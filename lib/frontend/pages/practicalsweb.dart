import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homepage.dart';

class CodingPage extends StatefulWidget {
  final String title;
  final String email;

  const CodingPage({required this.title, required this.email, Key? key})
      : super(key: key);

  @override
  _CodingPageState createState() => _CodingPageState();
}

class _CodingPageState extends State<CodingPage> with WidgetsBindingObserver {
  String selectedLanguage = "Python";
  final codeController = TextEditingController();
  final inputController = TextEditingController();
  String output = "";
  String question = "";

  final String baseUrl = "http://10.0.2.2:5005";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    selectedLanguage = _detectLanguage(widget.title);
    _generateQuestion();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    codeController.dispose();
    inputController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _autoSubmitTest();
    }
  }

  Future<void> _autoSubmitTest() async {
    await _compileCode();
    if (mounted) {
      _showAutoSubmitPopup();
    }
  }

  void _showAutoSubmitPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Auto-Submission"),
          content: const Text(
              "Your test was auto-submitted because you switched tabs or left the app."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(email: widget.email)),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showSubmitPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Submission Successful"),
          content: const Text("Your code has been successfully submitted."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(email: widget.email)),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  String _detectLanguage(String title) {
    title = title.toLowerCase();
    if (title.contains('python')) {
      return "Python";
    } else if (title.contains('java')) {
      return "Java";
    } else if (title.contains('c ')) {
      return "C";
    }
    return "Python";
  }

  Future<void> _generateQuestion() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/generate_question'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': widget.title, 'email': widget.email}),
      );

      if (response.statusCode == 200) {
        setState(() {
          question = json.decode(response.body)['question'];
        });
      } else {
        setState(() {
          question =
              "Error: Unable to generate question. Status: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        question = "Error: $e";
      });
    }
  }

  Future<void> _compileCode() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/evaluate_code'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'code': codeController.text,
          'language': selectedLanguage,
          'input': inputController.text,
          'email': widget.email,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          output = json.decode(response.body)['evaluation'];
        });
      } else {
        setState(() {
          output = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        output = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Assessments", style: TextStyle(fontFamily: 'Poppins')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < 3; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ["Program:", "Your Code:", "Output:"][i],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 265,
                      width: 650,
                      child: Card(
                        color: [
                          Color(0xFF6592E9),
                          Color(0xFF9ABBFF),
                          Colors.white
                        ][i],
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xFF0F3870), width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: i == 1
                                ? TextField(
                                    controller: codeController,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Write your code here...",
                                    ),
                                  )
                                : Text(
                                    i == 0
                                        ? (question.isNotEmpty
                                            ? question
                                            : "Loading question...")
                                        : (output.isNotEmpty
                                            ? output
                                            : "Output will be displayed here."),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _showSubmitPopup,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text("Submit",
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: _compileCode,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0F3870)),
                    child: const Text("Evaluate",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
