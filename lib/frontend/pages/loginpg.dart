// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'signinpage.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   final String apiUrl = "http://10.0.2.2:5000/login"; // Ensure this is correct

//   Future<void> _handleLogin() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill in all fields')),
//       );
//       return;
//     }

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login Successful!')),
//         );

//         // Navigate to Profile Page, passing the email to fetch user data
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProfilePage(email: email),
//           ),
//         );
//       } else if (response.statusCode == 401) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid credentials!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to backend')),
//       );
//     }
//   }

//   void _navigateToSignUp() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignInPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF003399), Color(0xFF99CCFF)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Evalora",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 38,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins', // Added font
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   Center(
//                     child: Column(
//                       children: [
//                         Image.asset('assets/loginpg.png',
//                             height: screenHeight * 0.3),
//                         SizedBox(height: screenHeight * 0.02),
//                         Text(
//                           "Log in to continue\nAnd upskill your journey",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Poppins', // Added font
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//                         _buildTextField(
//                           controller: _emailController,
//                           hintText: "Enter Your Email",
//                           obscureText: false,
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         _buildTextField(
//                           controller: _passwordController,
//                           hintText: "Password",
//                           obscureText: !_isPasswordVisible,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.03),
//                         ElevatedButton(
//                           onPressed: _handleLogin,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Color(0xFF4A90E2),
//                             minimumSize: Size(double.infinity, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(22),
//                             ),
//                           ),
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins'), // Added font
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         GestureDetector(
//                           onTap: _navigateToSignUp,
//                           child: Text(
//                             "Don’t have an account? Sign in",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               decoration: TextDecoration.underline,
//                               fontFamily: 'Poppins', // Added font
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     bool obscureText = false,
//     Widget? suffixIcon,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         hintText: hintText,
//         hintStyle: TextStyle(fontFamily: 'Poppins'), // Added font
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: suffixIcon,
//       ),
//       style: TextStyle(fontFamily: 'Poppins'), // Added font
//     );
//   }
// }

// test

// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'signinpage.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   final String apiUrl = "http://10.0.2.2:5000/login"; // Ensure this is correct

//   Future<void> _handleLogin() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill in all fields')),
//       );
//       return;
//     }

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login Successful!')),
//         );

//         // Navigate to Profile Page, passing the email to fetch user data
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProfilePage(email: email),
//           ),
//         );
//       } else if (response.statusCode == 401) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid credentials!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to backend')),
//       );
//     }
//   }

//   void _navigateToSignUp() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignInPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF003399), Color(0xFF99CCFF)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Evalora",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 38,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins', // Added font
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   Center(
//                     child: Column(
//                       children: [
//                         Image.asset('assets/loginpg.png',
//                             height: screenHeight * 0.3),
//                         SizedBox(height: screenHeight * 0.02),
//                         Text(
//                           "Log in to continue\nAnd upskill your journey",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Poppins', // Added font
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//                         _buildTextField(
//                           controller: _emailController,
//                           hintText: "Enter Your Email",
//                           obscureText: false,
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         _buildTextField(
//                           controller: _passwordController,
//                           hintText: "Password",
//                           obscureText: !_isPasswordVisible,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.03),
//                         ElevatedButton(
//                           onPressed: _handleLogin,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Color(0xFF4A90E2),
//                             minimumSize: Size(double.infinity, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(22),
//                             ),
//                           ),
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins'), // Added font
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         GestureDetector(
//                           onTap: _navigateToSignUp,
//                           child: Text(
//                             "Don’t have an account? Sign in",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               decoration: TextDecoration.underline,
//                               fontFamily: 'Poppins', // Added font
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     bool obscureText = false,
//     Widget? suffixIcon,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         hintText: hintText,
//         hintStyle: TextStyle(fontFamily: 'Poppins'), // Added font
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: suffixIcon,
//       ),
//       style: TextStyle(fontFamily: 'Poppins'), // Added font
//     );
//   }
// }

//test 3 pass works
// import 'package:coderaiders/frontend/pages/signinpage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'homepage.dart'; // Import the HomePage
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:coderaiders/services/SpeechToTextServices.dart'; // Speech-to-Text Service
// import 'package:vibration/vibration.dart'; // Import the vibration package

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'homepage.dart'; // Import the HomePage
// import 'package:flutter_tts/flutter_tts.dart';
// import 'signinpage.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _isListening = false;
//   final SpeechToTextService _speechService = SpeechToTextService();
//   String _currentField = '';

//   final FlutterTts _flutterTts = FlutterTts();

//   final String apiUrl = "http://192.168.137.1:5000/login";
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _initializeSpeech();
//     _startListening();
//     // Automatically speak the speaker icon location when the screen is loaded
//     _speakSpeakerIconLocation();

//     // Adding listeners to trigger vibration when text fields gain focus
//     _emailFocusNode.addListener(() {
//       if (_emailFocusNode.hasFocus) {
//         _vibrate();
//       }
//     });

//     _passwordFocusNode.addListener(() {
//       if (_passwordFocusNode.hasFocus) {
//         _vibrate();
//       }
//     });
//   }

//   // Method to trigger vibration
//   Future<void> _vibrate() async {
//     bool? hasVibrator =
//         await Vibration.hasVibrator(); // Get vibrator availability
//     if (hasVibrator != null && hasVibrator) {
//       // Check if vibrator exists and is true
//       Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
//     }
//   }

//   Future<void> _initializeSpeech() async {
//     bool available = await _speechService.initialize();
//     if (!available) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Speech recognition not available')),
//       );
//     } else {
//       _startGlobalListening(); // Start listening globally
//     }
//   }

//   void _startGlobalListening() {
//     _speechService.startListening((recognizedWords) {
//       if (recognizedWords.toLowerCase().contains('login')) {
//         _speechService.stopListening();
//         _handleLogin();
//       }
//     });
//   }

//   void _startListening() {
//     setState(() {
//       _isListening = true; // Update state to indicate listening
//     });

//     _speechService.startListening((recognizedWords) {
//       print('Recognized words: $recognizedWords'); // Debugging log

//       if (recognizedWords.toLowerCase().contains('login')) {
//         print('Login command detected!');
//         _stopListening(); // Stop listening
//         _handleLogin(); // Trigger login action
//       }
//     });
//   }

//   void _startFieldListening(String targetField) {
//     setState(() {
//       _currentField = targetField; // Set the current field being populated
//     });

//     String previousText = ''; // To track changes in recognized text
//     String cumulativeText =
//         ''; // Track cumulative text to append only new parts

//     _speechService.startListening((recognizedWords) {
//       print('Recognized words: $recognizedWords'); // Debugging log

//       if (recognizedWords.toLowerCase().contains('login')) {
//         print('Login command detected!');
//         _speechService.stopListening(); // Stop listening
//         _handleLogin(); // Trigger login
//         return;
//       }

//       setState(() {
//         // Append only new words by removing duplicates from cumulativeText
//         if (recognizedWords != previousText) {
//           final newWords = recognizedWords.replaceAll(previousText, '').trim();
//           previousText =
//               recognizedWords; // Update previousText for next comparison

//           if (newWords.isNotEmpty) {
//             cumulativeText += newWords;

//             if (_currentField == 'email') {
//               _emailController.text = cumulativeText.replaceAll(' ', '');
//             } else if (_currentField == 'password') {
//               _passwordController.text = cumulativeText;
//             }
//           }
//         }
//       });
//     });
//   }

//   void _stopListening() {
//     _speechService.stopListening(); // Stop listening for voice input
//     setState(() {
//       _currentField = ''; // Reset the current field
//     });
//   }

//   Future<void> _speakSpeakerIconLocation() async {
//     String message =
//         "The speaker icon is located in the top right corner of the screen.";
//     await _flutterTts.setLanguage("en-US");
//     await _flutterTts.setPitch(1.0);
//     await _flutterTts.speak(message);
//   }

//   Future<void> _speakPageContent() async {
//     String pageContent = """
//       Welcome to Evalora Login Page.
//       Enter your email and password to log in.
//       If you don’t have an account, you can sign up using the Sign-Up button below.
//     """;

//     await _flutterTts.setLanguage("en-US");
//     await _flutterTts.setPitch(1.0);
//     await _flutterTts.speak(pageContent);
//   }

//   Future<void> _handleLogin() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill in all fields')),
//       );
//       return;
//     }

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login Successful!')),
//         );

//         // Navigate to HomePage, passing the email
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(email: email),
//           ),
//         );
//       } else if (response.statusCode == 401) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid credentials!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to backend')),
//       );
//     }
//   }

//   void _navigateToSignUp() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignInPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF003399),
//         elevation: 0,
//         title: const Text(
//           "Evalora", // Updated title
//           style: TextStyle(
//             fontSize: 38, // Large font size
//             fontWeight: FontWeight.bold, // Bold weight
//             color: Colors.white, // White color for text
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.volume_up,
//                 color: Color.fromARGB(255, 255, 255, 255)), // Speaker icon
//             onPressed: _speakPageContent, // TTS function
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.mic,
//               color: _speechService.isListening
//                   ? const Color.fromARGB(255, 255, 0, 0) // Red when listening
//                   : const Color.fromARGB(255, 255, 255, 255), // White when idle
//             ),
//             onPressed: () {
//               if (_speechService.isListening) {
//                 // Stop listening if already active
//                 _stopListening();
//               } else {
//                 // Start listening
//                 _startListening();
//               }
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         height: screenHeight,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF003399), Color(0xFF99CCFF)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: screenHeight * 0.03),
//                   Center(
//                     child: Column(
//                       children: [
//                         Image.asset('assets/loginpg.png',
//                             height: screenHeight * 0.3),
//                         SizedBox(height: screenHeight * 0.02),
//                         Text(
//                           "Log in to continue\nAnd upskill your journey",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//                         _buildTextField(
//                           controller: _emailController,
//                           hintText: "Enter Your Email",
//                           obscureText: false,
//                           focusNode:
//                               _emailFocusNode, // Add focusNode to email field
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               Icons.mic,
//                               color: _speechService.isListening &&
//                                       _currentField == 'email'
//                                   ? Colors.red
//                                   : null,
//                             ),
//                             onPressed: _speechService.isListening &&
//                                     _currentField == 'email'
//                                 ? _stopListening
//                                 : () => _startFieldListening('email'),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         _buildTextField(
//                           controller: _passwordController,
//                           hintText: "Password",
//                           obscureText: !_isPasswordVisible,
//                           focusNode:
//                               _passwordFocusNode, // Add focusNode to password field
//                           suffixIcon: Row(
//                             mainAxisSize: MainAxisSize
//                                 .min, // Ensures the Row only occupies the minimum width required
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   _isPasswordVisible
//                                       ? Icons.visibility
//                                       : Icons.visibility_off,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isPasswordVisible = !_isPasswordVisible;
//                                   });
//                                 },
//                               ),
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.mic,
//                                   color: _speechService.isListening &&
//                                           _currentField == 'password'
//                                       ? Colors.red
//                                       : null,
//                                 ),
//                                 onPressed: _speechService.isListening &&
//                                         _currentField == 'password'
//                                     ? _stopListening
//                                     : () => _startFieldListening('password'),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.03),
//                         ElevatedButton(
//                           onPressed: () {
//                             _vibrate(); // Trigger vibration when button is pressed
//                             _handleLogin();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Color(0xFF4A90E2),
//                             minimumSize: Size(double.infinity, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(22),
//                             ),
//                           ),
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         GestureDetector(
//                           onTap: _navigateToSignUp,
//                           child: Text(
//                             "Don’t have an account? Sign in",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               decoration: TextDecoration.underline,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     bool obscureText = false,
//     FocusNode? focusNode, // Add focusNode parameter
//     Widget? suffixIcon,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       focusNode: focusNode, // Use the provided focusNode
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         hintText: hintText,
//         hintStyle: TextStyle(fontFamily: 'Poppins'),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: suffixIcon,
//       ),
//       style: TextStyle(fontFamily: 'Poppins'),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////

import 'package:evalora/Services/SpeechToTextServices.dart';
import 'package:evalora/frontend/pages/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homepage.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vibration/vibration.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isListening = false;
  final SpeechToTextService _speechService = SpeechToTextService();
  String _currentField = '';

  final FlutterTts _flutterTts = FlutterTts();

  final String apiUrl = "http://10.0.2.2:5000/login";
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    _startListening();

    _speakSpeakerIconLocation();

    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        _vibrate();
      }
    });

    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        _vibrate();
      }
    });
  }

  Future<void> _vibrate() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      Vibration.vibrate(duration: 100);
    }
  }

  Future<void> _initializeSpeech() async {
    bool available = await _speechService.initialize();
    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Speech recognition not available')),
      );
    } else {
      _startGlobalListening();
    }
  }

  void _startGlobalListening() {
    _speechService.startListening((recognizedWords) {
      if (recognizedWords.toLowerCase().contains('login')) {
        _speechService.stopListening();
        _handleLogin();
      }
    });
  }

  void _startListening() {
    setState(() {
      _isListening = true;
    });

    _speechService.startListening((recognizedWords) {
      print('Recognized words: $recognizedWords');

      if (recognizedWords.isNotEmpty) {
        String command = recognizedWords.trim().toLowerCase();

        if (command.contains("login") || command.contains("log in")) {
          print('Login command detected!');

          _stopListening();
          _handleLogin();
        }
      }

      Future.delayed(const Duration(seconds: 2), () {
        _stopListening();
      });
    });
  }

  void _startFieldListening(String targetField) {
    setState(() {
      _currentField = targetField;
    });

    String previousText = '';
    String cumulativeText = '';

    _speechService.startListening((recognizedWords) {
      print('Recognized words: $recognizedWords');
      if (recognizedWords.toLowerCase().contains('login')) {
        print('Login command detected!');
        _speechService.stopListening();
        _handleLogin();
        return;
      }

      setState(() {
        if (recognizedWords != previousText) {
          final newWords = recognizedWords.replaceAll(previousText, '').trim();
          previousText = recognizedWords;

          if (newWords.isNotEmpty) {
            cumulativeText += newWords;

            if (_currentField == 'email') {
              _emailController.text = cumulativeText.replaceAll(' ', '');
            } else if (_currentField == 'password') {
              _passwordController.text = cumulativeText;
            }
          }
        }
      });
    });
  }

  void _stopListening() {
    _speechService.stopListening();
    setState(() {
      _currentField = '';
    });
  }

  Future<void> _speakSpeakerIconLocation() async {
    String message =
        "The speaker icon is located in the top right corner of the screen.";
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(message);
  }

  Future<void> _speakPageContent() async {
    String pageContent = """
      Welcome to Evalora Login Page.
      Enter your email and password to log in.
      If you don’t have an account, you can sign up using the Sign-Up button below.
    """;

    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(pageContent);
  }

  Future<void> _handleLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Successful!')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(email: email),
          ),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to backend')),
      );
    }
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF003399),
            elevation: 0,
            title: const Text(
              "Evalora",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.volume_up,
                    color: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  _vibrate();
                  _speakPageContent();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.mic,
                  color: _speechService.isListening
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  _vibrate();
                  if (_speechService.isListening) {
                    _stopListening();
                  } else {
                    _startListening();
                  }
                },
              ),
            ],
          ),
          body: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF003399), Color(0xFF99CCFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      Center(
                        child: Column(
                          children: [
                            Image.asset('assets/loginpg.png',
                                height: screenHeight * 0.3),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              "Log in to continue\nAnd upskill your journey",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            _buildTextField(
                              controller: _emailController,
                              hintText: "Enter Your Email",
                              obscureText: false,
                              focusNode:
                                  _emailFocusNode, // Add focusNode to email field
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  color: _speechService.isListening &&
                                          _currentField == 'email'
                                      ? Colors.red
                                      : null,
                                ),
                                onPressed: _speechService.isListening &&
                                        _currentField == 'email'
                                    ? _stopListening
                                    : () => _startFieldListening('email'),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _buildTextField(
                              controller: _passwordController,
                              hintText: "Password",
                              obscureText: !_isPasswordVisible,
                              focusNode: _passwordFocusNode,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.mic,
                                      color: _speechService.isListening &&
                                              _currentField == 'password'
                                          ? Colors.red
                                          : null,
                                    ),
                                    onPressed: _speechService.isListening &&
                                            _currentField == 'password'
                                        ? _stopListening
                                        : () =>
                                            _startFieldListening('password'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            ElevatedButton(
                              onPressed: () {
                                _vibrate();
                                _handleLogin();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Color(0xFF4A90E2),
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            GestureDetector(
                              onTap: () {
                                _vibrate();
                                _navigateToSignUp();
                              },
                              child: Text(
                                "Don’t have an account? Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    FocusNode? focusNode,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Poppins'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
      style: TextStyle(fontFamily: 'Poppins'),
    );
  }
}
