import 'package:flutter/material.dart';
import 'interestse.dart';
import 'package:vibration/vibration.dart'; // Import vibration package

class DisabilityCheckPage extends StatefulWidget {
  final String email; // Accept email as a parameter

  const DisabilityCheckPage({Key? key, required this.email}) : super(key: key);

  @override
  _DisabilityCheckPageState createState() => _DisabilityCheckPageState();
}

class _DisabilityCheckPageState extends State<DisabilityCheckPage> {
  String? _disabilityStatus;
  final TextEditingController udidController = TextEditingController();
  bool _isUdidEnabled = false;

  // Method to trigger vibration
  Future<void> _vibrate() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF04318A), // Very dark blue
                        Color(0xFF284F9D), // Dark blue
                        Color(0xFF5E7CB9), // Medium blue
                        Color(0xFFB4C5E6), // Light grayish blue
                        Color(0xFFE3ECFF), // Light blue
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100), // Adjust the position of "Evalora"
                          Text(
                            "Evalora",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 50),
                          Center(
                            child: Text(
                              "Helps us ensure inclusivity and tailor services to meet your needs",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: Text(
                              "Do you identify as a person with a disability (PWD)?",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'Yes',
                                    groupValue: _disabilityStatus,
                                    onChanged: (value) {
                                      setState(() {
                                        _disabilityStatus = value;
                                        _isUdidEnabled = true;
                                      });
                                      _vibrate(); // Trigger vibration on "Yes"
                                    },
                                  ),
                                  Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'No',
                                    groupValue: _disabilityStatus,
                                    onChanged: (value) {
                                      setState(() {
                                        _disabilityStatus = value;
                                        _isUdidEnabled = false;
                                        udidController.clear();
                                      });
                                      _vibrate(); // Trigger vibration on "No"
                                    },
                                  ),
                                  Text(
                                    "No",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: TextField(
                              controller: udidController,
                              keyboardType: TextInputType.number,
                              enabled: _isUdidEnabled,
                              decoration: InputDecoration(
                                hintText: "UDID",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontFamily: 'Poppins'),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.6),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onTap:
                                  _vibrate, // Trigger vibration on text field focus
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              _vibrate(); // Trigger vibration when button is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InterestSelectionScreen(
                                    email: widget.email,
                                  ),
                                ),
                              );
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
                              "Next",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
