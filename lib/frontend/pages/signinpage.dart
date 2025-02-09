import 'package:evalora/frontend/pages/interestse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobDayController = TextEditingController();
  final TextEditingController dobMonthController = TextEditingController();
  final TextEditingController dobYearController = TextEditingController();

  bool _isPasswordVisible = false;

  final String apiUrl = "http://10.0.2.2:5000/signup";

  Future<void> _handleSignUp(BuildContext context) async {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String dob =
        "${dobDayController.text.trim()}-${dobMonthController.text.trim()}-${dobYearController.text.trim()}";

    print('Name: $name');
    print('Phone: $phone');
    print('Email: $email');
    print('Password: $password');
    print('DOB: $dob');

    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        dobDayController.text.trim().isEmpty ||
        dobMonthController.text.trim().isEmpty ||
        dobYearController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'email': email,
          'dob': dob,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-Up Successful!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InterestSelectionScreen(email: email),
          ),
        );
      } else if (response.statusCode == 409) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email is already registered')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to the backend')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF003399),
              Color(0xFF99CCFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Evalora",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/signinpg.png',
                  height: screenHeight * 0.25,
                ),
                const SizedBox(height: 30),
                Text(
                  "Let’s help you meet up your tasks",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                _buildTextField(
                  controller: nameController,
                  hintText: "Name",
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTextField(
                      controller: dobDayController,
                      hintText: "DD",
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    _buildTextField(
                      controller: dobMonthController,
                      hintText: "MM",
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    _buildTextField(
                      controller: dobYearController,
                      hintText: "YYYY",
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: emailController,
                  hintText: "Enter Your Email",
                  keyboardType: TextInputType.emailAddress,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: !_isPasswordVisible,
                  width: MediaQuery.of(context).size.width * 0.9,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _handleSignUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF003399),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController? controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    double width = double.infinity,
    Widget? suffixIcon,
  }) {
    return Container(
      width: width,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
