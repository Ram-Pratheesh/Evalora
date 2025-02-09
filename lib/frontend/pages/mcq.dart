// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MCQTestPage extends StatefulWidget {
//   final String topic;
//   final String details;

//   MCQTestPage({required this.topic, required this.details});

//   @override
//   _MCQTestPageState createState() => _MCQTestPageState();
// }

// class _MCQTestPageState extends State<MCQTestPage> {
//   int score = 0;
//   Timer? timer;
//   int timerValue = 1500; // 25 minutes in seconds
//   List<dynamic> questions = [];
//   List<String?> userAnswers = [];
//   int currentQuestionIndex = 0;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadQuestions();
//     startTimer();
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       if (timerValue > 0) {
//         setState(() {
//           timerValue--;
//         });
//       } else {
//         t.cancel();
//         // Handle timeout, e.g., auto-submit answers
//         submitAnswers();
//       }
//     });
//   }

//   Future<void> loadQuestions() async {
//     final url = Uri.parse('http://10.0.2.2:5003/generate_mcqs');
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "topic": widget.topic,
//           "details": widget.details,
//           "num_questions": 10, // Number of questions to fetch
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           questions = data['mcqs'];
//           userAnswers = List<String?>.filled(questions.length, null);
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load questions');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading questions: $e')),
//       );
//     }
//   }

//   void submitAnswers() {
//     int score = 0;
//     for (int i = 0; i < questions.length; i++) {
//       if (userAnswers[i] ==
//           questions[i]['options']
//               [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)]) {
//         score++;
//       }
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Test Completed'),
//         content: Text('Your score is $score/${questions.length}'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (questions.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(
//           child: Text(
//             'No questions available',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//       );
//     }

//     final currentQuestion = questions[currentQuestionIndex];

//     // Convert timerValue to minutes and seconds
//     final minutes = timerValue ~/ 60;
//     final seconds = timerValue % 60;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MCQ Assessment',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.blue.shade900, // Top gradient color
//               Colors.blue.shade100, // Bottom gradient color
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Top card with question and timer
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       // Timer inside a circle
//                       Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           CircularProgressIndicator(
//                             value: timerValue / 1500,
//                             backgroundColor: Colors.grey[300],
//                             valueColor:
//                                 AlwaysStoppedAnimation<Color>(Colors.blue),
//                           ),
//                           Text(
//                             '$minutes:${seconds.toString().padLeft(2, '0')}',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//                       // Question text
//                       Text(
//                         currentQuestion["question"],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Poppins',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Options
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: currentQuestion["options"].length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(
//                         currentQuestion["options"][index],
//                         style: TextStyle(fontFamily: 'Poppins'),
//                       ),
//                       leading: Radio<String>(
//                         value: currentQuestion["options"][index],
//                         groupValue: userAnswers[currentQuestionIndex],
//                         onChanged: (value) {
//                           setState(() {
//                             userAnswers[currentQuestionIndex] = value;
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Navigation buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex > 0
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex--;
//                             });
//                           }
//                         : null,
//                     child: Text(
//                       'Previous',
//                       style: TextStyle(fontFamily: 'Poppins'),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex < questions.length - 1
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex++;
//                             });
//                           }
//                         : () => submitAnswers(),
//                     child: Text(
//                       currentQuestionIndex < questions.length - 1
//                           ? 'Next'
//                           : 'Submit',
//                       style: TextStyle(fontFamily: 'Poppins'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MCQTestPage extends StatefulWidget {
//   final String topic;
//   final String details;

//   MCQTestPage({required this.topic, required this.details});

//   @override
//   _MCQTestPageState createState() => _MCQTestPageState();
// }

// class _MCQTestPageState extends State<MCQTestPage> {
//   int score = 0;
//   Timer? timer;
//   int timerValue = 1500; // 25 minutes in seconds
//   List<dynamic> questions = [];
//   List<String?> userAnswers = [];
//   int currentQuestionIndex = 0;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadQuestions();
//     startTimer();
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       if (timerValue > 0) {
//         setState(() {
//           timerValue--;
//         });
//       } else {
//         t.cancel();
//         submitAnswers();
//       }
//     });
//   }

//   Future<void> loadQuestions() async {
//     final url = Uri.parse('http://10.0.2.2:5003/generate_mcqs');
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "topic": widget.topic,
//           "details": widget.details,
//           "num_questions": 30,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           questions = data['mcqs'];
//           userAnswers = List<String?>.filled(questions.length, null);
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load questions');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading questions: $e')),
//       );
//     }
//   }

//   void submitAnswers() {
//     int score = 0;
//     for (int i = 0; i < questions.length; i++) {
//       if (userAnswers[i] ==
//           questions[i]['options']
//               [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)]) {
//         score++;
//       }
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Test Completed'),
//         content: Text('Your score is $score/${questions.length}'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (questions.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(
//           child: Text(
//             'No questions available',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//       );
//     }

//     final currentQuestion = questions[currentQuestionIndex];
//     final minutes = timerValue ~/ 60;
//     final seconds = timerValue % 60;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MCQ Assessment',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.center,
//             colors: [
//               Colors.blue.shade900,
//               Colors.blue.shade100,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               SizedBox(height: kToolbarHeight + 16), // Space for app bar
//               // Timer with larger size and white background
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 140,
//                     height: 140,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 130,
//                     height: 130,
//                     child: CircularProgressIndicator(
//                       value: timerValue / 1500,
//                       backgroundColor: Colors.grey[300],
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                       strokeWidth: 8,
//                     ),
//                   ),
//                   Text(
//                     '$minutes:${seconds.toString().padLeft(2, '0')}',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Question card with timer overlap
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         currentQuestion["question"],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Poppins',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: -70,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: SizedBox(), // Keeps timer visually aligned
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced space between question and options
//               // Options list with reduced space
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: currentQuestion["options"].length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       margin: const EdgeInsets.symmetric(vertical: 4),
//                       child: ListTile(
//                         title: Text(
//                           currentQuestion["options"][index],
//                           style: TextStyle(fontFamily: 'Poppins'),
//                         ),
//                         leading: Radio<String>(
//                           value: currentQuestion["options"][index],
//                           groupValue: userAnswers[currentQuestionIndex],
//                           onChanged: (value) {
//                             setState(() {
//                               userAnswers[currentQuestionIndex] = value;
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Navigation buttons with reduced space
//               SizedBox(height: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex > 0
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex--;
//                             });
//                           }
//                         : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       'Previous',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex < questions.length - 1
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex++;
//                             });
//                           }
//                         : () => submitAnswers(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       currentQuestionIndex < questions.length - 1
//                           ? 'Next'
//                           : 'Submit',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced bottom padding
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'package:coderaiders/frontend/pages/random.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MCQTestPage extends StatefulWidget {
//   final String topic;
//   final String details;

//   MCQTestPage({required this.topic, required this.details});

//   @override
//   _MCQTestPageState createState() => _MCQTestPageState();
// }

// class _MCQTestPageState extends State<MCQTestPage> {
//   int score = 0;
//   Timer? timer;
//   int timerValue = 1500; // 25 minutes in seconds
//   List<dynamic> questions = [];
//   List<String?> userAnswers = [];
//   int currentQuestionIndex = 0;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadQuestions();
//     startTimer();
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       if (timerValue > 0) {
//         setState(() {
//           timerValue--;
//         });
//       } else {
//         t.cancel();
//         submitAnswers();
//       }
//     });
//   }

//   Future<void> loadQuestions() async {
//     final url = Uri.parse('http://10.0.2.2:5003/generate_mcqs');
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "topic": widget.topic,
//           "details": widget.details,
//           "num_questions": 30,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           questions = data['mcqs'];
//           userAnswers = List<String?>.filled(questions.length, null);
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load questions');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading questions: $e')),
//       );
//     }
//   }

//   Future<void> sendEmail(int score, int totalQuestions) async {
//     final url = Uri.parse('https://api.example.com/send-email');
//     final emailData = {
//       "to": "user@example.com",
//       "subject": "Your MCQ Test Results",
//       "body":
//           "You scored $score out of $totalQuestions in the test on ${widget.topic}."
//     };

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(emailData),
//       );

//       if (response.statusCode != 200) {
//         throw Exception('Failed to send email');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error sending email: $e')),
//       );
//     }
//   }

//   void submitAnswers() async {
//     int correctAnswers = 0;
//     for (int i = 0; i < questions.length; i++) {
//       if (userAnswers[i] ==
//           questions[i]['options']
//               [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)]) {
//         correctAnswers++;
//       }
//     }

//     int wrongAnswers = questions.length - correctAnswers;

//     // Send email
//     await sendEmail(correctAnswers, questions.length);

//     // Navigate to ScorePage
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ScorePage(
//           totalQuestions: questions.length,
//           correctAnswers: correctAnswers,
//           wrongAnswers: wrongAnswers,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (questions.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(
//           child: Text(
//             'No questions available',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//       );
//     }

//     final currentQuestion = questions[currentQuestionIndex];
//     final minutes = timerValue ~/ 60;
//     final seconds = timerValue % 60;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MCQ Assessment',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.center,
//             colors: [
//               Colors.blue.shade900,
//               Colors.blue.shade100,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               SizedBox(height: kToolbarHeight + 16), // Space for app bar
//               // Timer with larger size and white background
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 140,
//                     height: 140,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 130,
//                     height: 130,
//                     child: CircularProgressIndicator(
//                       value: timerValue / 1500,
//                       backgroundColor: Colors.grey[300],
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                       strokeWidth: 8,
//                     ),
//                   ),
//                   Text(
//                     '$minutes:${seconds.toString().padLeft(2, '0')}',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Question card with timer overlap
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         currentQuestion["question"],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Poppins',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: -70,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: SizedBox(), // Keeps timer visually aligned
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced space between question and options
//               // Options list with reduced space
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: currentQuestion["options"].length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       margin: const EdgeInsets.symmetric(vertical: 4),
//                       child: ListTile(
//                         title: Text(
//                           currentQuestion["options"][index],
//                           style: TextStyle(fontFamily: 'Poppins'),
//                         ),
//                         leading: Radio<String>(
//                           value: currentQuestion["options"][index],
//                           groupValue: userAnswers[currentQuestionIndex],
//                           onChanged: (value) {
//                             setState(() {
//                               userAnswers[currentQuestionIndex] = value;
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Navigation buttons with reduced space
//               SizedBox(height: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex > 0
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex--;
//                             });
//                           }
//                         : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       'Previous',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex < questions.length - 1
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex++;
//                             });
//                           }
//                         : () => submitAnswers(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       currentQuestionIndex < questions.length - 1
//                           ? 'Next'
//                           : 'Submit',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced bottom padding
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ScorePage

// import 'dart:async';
// import 'dart:convert';
// import 'package:coderaiders/frontend/pages/scorecardmcq.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MCQTestPage extends StatefulWidget {
//   final String topic;
//   final String details;
//   final String email; // Email parameter

//   MCQTestPage({
//     required this.topic,
//     required this.details,
//     required this.email,
//   });

//   @override
//   _MCQTestPageState createState() => _MCQTestPageState();
// }

// class _MCQTestPageState extends State<MCQTestPage> {
//   int score = 0;
//   Timer? timer;
//   int timerValue = 1500; // 25 minutes in seconds
//   List<dynamic> questions = [];
//   List<String?> userAnswers = [];
//   int currentQuestionIndex = 0;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadQuestions();
//     startTimer();
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       if (timerValue > 0) {
//         setState(() {
//           timerValue--;
//         });
//       } else {
//         t.cancel();
//         submitAnswers();
//       }
//     });
//   }

//   Future<void> loadQuestions() async {
//     final url = Uri.parse('http://10.0.2.2:5003/generate_mcqs');
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "topic": widget.topic,
//           "details": widget.details,
//           "num_questions": 30,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           questions = data['mcqs'];
//           userAnswers = List<String?>.filled(questions.length, null);
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load questions');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading questions: $e')),
//       );
//     }
//   }

//   void submitAnswers() {
//     int correctAnswers = 0;
//     for (int i = 0; i < questions.length; i++) {
//       if (userAnswers[i] ==
//           questions[i]['options']
//               [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)]) {
//         correctAnswers++;
//       }
//     }

//     int wrongAnswers = questions.length - correctAnswers;

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ScorePage(
//           totalQuestions: questions.length,
//           correctAnswers: correctAnswers,
//           wrongAnswers: wrongAnswers,
//           email: widget.email, // Pass email to ScorePage
//           topic: widget.topic,
//           details: widget.details,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (questions.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(
//           child: Text(
//             'No questions available',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//       );
//     }

//     final currentQuestion = questions[currentQuestionIndex];
//     final minutes = timerValue ~/ 60;
//     final seconds = timerValue % 60;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MCQ Assessment',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.center,
//             colors: [
//               Colors.blue.shade900,
//               Colors.blue.shade100,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               SizedBox(height: kToolbarHeight + 16), // Space for app bar
//               // Timer with larger size and white background
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 140,
//                     height: 140,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 130,
//                     height: 130,
//                     child: CircularProgressIndicator(
//                       value: timerValue / 1500,
//                       backgroundColor: Colors.grey[300],
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                       strokeWidth: 8,
//                     ),
//                   ),
//                   Text(
//                     '$minutes:${seconds.toString().padLeft(2, '0')}',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Question card with timer overlap
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         currentQuestion["question"],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Poppins',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: -70,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: SizedBox(), // Keeps timer visually aligned
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced space between question and options
//               // Options list with reduced space
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: currentQuestion["options"].length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       margin: const EdgeInsets.symmetric(vertical: 4),
//                       child: ListTile(
//                         title: Text(
//                           currentQuestion["options"][index],
//                           style: TextStyle(fontFamily: 'Poppins'),
//                         ),
//                         leading: Radio<String>(
//                           value: currentQuestion["options"][index],
//                           groupValue: userAnswers[currentQuestionIndex],
//                           onChanged: (value) {
//                             setState(() {
//                               userAnswers[currentQuestionIndex] = value;
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Navigation buttons with reduced space
//               SizedBox(height: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex > 0
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex--;
//                             });
//                           }
//                         : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       'Previous',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex < questions.length - 1
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex++;
//                             });
//                           }
//                         : () => submitAnswers(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       currentQuestionIndex < questions.length - 1
//                           ? 'Next'
//                           : 'Submit',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced bottom padding
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////////

// import 'dart:async';
// import 'dart:convert';
// import 'package:coderaiders/frontend/pages/scorecardmcq.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_tts/flutter_tts.dart';

// class MCQTestPage extends StatefulWidget {
//   final String topic;
//   final String details;
//   final String email; // Email parameter

//   MCQTestPage({
//     required this.topic,
//     required this.details,
//     required this.email,
//   });

//   @override
//   _MCQTestPageState createState() => _MCQTestPageState();
// }

// class _MCQTestPageState extends State<MCQTestPage> {
//     FlutterTts flutterTts = FlutterTts();

//   int score = 0;
//   Timer? timer;
//   int timerValue = 1500; // 25 minutes in seconds
//   List<dynamic> questions = [];
//   List<String?> userAnswers = [];
//   int currentQuestionIndex = 0;
//   bool isLoading = true;

//   // New additions
//   Map<String, dynamic> topicScores = {}; // Store scores per topic
//   Map<String, String> feedback = {}; // Store feedback per topic

//   @override
//   void initState() {
//     super.initState();
//     loadQuestions();
//     startTimer();
//     initializeTTS();
//   }

//   @override
//   void dispose() {
//     flutterTts.stop(); // Stop TTS on widget disposal
//     timer?.cancel();
//     super.dispose();
//   }

//   void initializeTTS() async {
//     await flutterTts.setLanguage("en-US"); // Set language to English
//     await flutterTts.setSpeechRate(0.5); // Set speech rate (adjust as needed)
//     await flutterTts.setPitch(1.0); // Set pitch (default is 1.0)
//   }

//    Future<void> announceInstructions() async {
//     String instructions = "Welcome to the MCQ Test. "
//         "The speaker icon is on the top right corner, which reads out the questions and answers. "
//         "Use the Previous button on the bottom left and the Next button on the bottom right to navigate.";
//     await flutterTts.speak(instructions);
//   }

//       Future<void> speakOutQuestion() async {
//     if (questions.isNotEmpty) {
//       final currentQuestion = questions[currentQuestionIndex];
//       String textToSpeak = currentQuestion["question"];

//       // Append options to the question
//       for (int i = 0; i < currentQuestion["options"].length; i++) {
//         textToSpeak += "\nOption ${String.fromCharCode(65 + i)}: ${currentQuestion["options"][i]}";
//       }

//       await flutterTts.speak(textToSpeak);
//     }
//   }

//   void stopSpeaking() async {
//     await flutterTts.stop();
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       if (timerValue > 0) {
//         setState(() {
//           timerValue--;
//         });
//       } else {
//         t.cancel();
//         submitAnswers();
//       }
//     });
//   }

//   Future<void> loadQuestions() async {
//     final url = Uri.parse('http://192.168.137.1:5003/generate_mcqs');
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "topic": widget.topic,
//           "details": widget.details,
//           "num_questions": 30,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           questions = data['mcqs'];
//           userAnswers = List<String?>.filled(questions.length, null);
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load questions');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading questions: $e')),
//       );
//     }
//   }

//   void calculateFeedback() {
//     int correctAnswers = 0;
//     int totalQuestions = questions.length;

//     // Calculate correct answers for the topic
//     for (int i = 0; i < totalQuestions; i++) {
//       final correctOption = questions[i]['options']
//           [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)];
//       if (userAnswers[i] == correctOption) {
//         correctAnswers++;
//       }
//     }

//     // Calculate topic-specific accuracy and feedback
//     // Calculate topic-specific accuracy and feedback
//     double accuracy = (correctAnswers / totalQuestions) * 100;
//     if (accuracy >= 85) {
//       feedback[widget.topic] =
//           "Excellent job in the topic: ${widget.topic}! Your accuracy of ${accuracy.toStringAsFixed(2)}% shows a strong grasp of the material. "
//           "You’ve demonstrated a high level of understanding and are well-prepared. Keep up the great work, and consider exploring advanced topics "
//           "to challenge yourself further.";
//     } else if (accuracy >= 50) {
//       feedback[widget.topic] =
//           "Good performance in the topic: ${widget.topic}. Your accuracy of ${accuracy.toStringAsFixed(2)}% indicates that you have a decent understanding "
//           "of the material. However, there’s room for improvement. Revisiting the areas where you struggled could help solidify your knowledge. Keep practicing!";
//     } else if (accuracy > 25) {
//       feedback[widget.topic] =
//           "You faced some challenges in the topic: ${widget.topic}. With an accuracy of ${accuracy.toStringAsFixed(2)}%, it seems there are gaps in your understanding. "
//           "Consider revising the core concepts and practicing more to build confidence. Remember, improvement comes with consistent effort!";
//     } else {
//       feedback[widget.topic] =
//           "It looks like you struggled with the topic: ${widget.topic}, achieving an accuracy of only ${accuracy.toStringAsFixed(2)}%. "
//           "We recommend a thorough review of the foundational concepts and additional practice exercises. Don't get discouraged—progress takes time, and each step forward matters!";
//     }

//     // Store scores for the topic
//     topicScores[widget.topic] = {
//       "correct": correctAnswers,
//       "total": totalQuestions,
//     };
//   }

//   void submitAnswers() {
//     calculateFeedback();

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ScorePage(
//           totalQuestions: topicScores[widget.topic]["total"],
//           correctAnswers: topicScores[widget.topic]["correct"],
//           wrongAnswers: topicScores[widget.topic]["total"] -
//               topicScores[widget.topic]["correct"],
//           email: widget.email,
//           topic: widget.topic,
//           details: widget.details,
//           feedbacks: feedback, // Pass feedbacks to ScorePage
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (questions.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'MCQ Test',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//         body: Center(
//           child: Text(
//             'No questions available',
//             style: TextStyle(fontFamily: 'Poppins'),
//           ),
//         ),
//       );
//     }

//     final currentQuestion = questions[currentQuestionIndex];
//     final minutes = timerValue ~/ 60;
//     final seconds = timerValue % 60;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MCQ Assessment',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.center,
//             colors: [
//               Colors.blue.shade900,
//               Colors.blue.shade100,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               SizedBox(height: kToolbarHeight + 16), // Space for app bar
//               // Timer display
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 140,
//                     height: 140,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 130,
//                     height: 130,
//                     child: CircularProgressIndicator(
//                       value: timerValue / 1500,
//                       backgroundColor: Colors.grey[300],
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                       strokeWidth: 8,
//                     ),
//                   ),
//                   Text(
//                     '$minutes:${seconds.toString().padLeft(2, '0')}',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Question card with timer overlap
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     currentQuestion["question"],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8), // Reduced space between question and options
//               // Options list
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: currentQuestion["options"].length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       margin: const EdgeInsets.symmetric(vertical: 4),
//                       child: ListTile(
//                         title: Text(
//                           currentQuestion["options"][index],
//                           style: TextStyle(fontFamily: 'Poppins'),
//                         ),
//                         leading: Radio<String>(
//                           value: currentQuestion["options"][index],
//                           groupValue: userAnswers[currentQuestionIndex],
//                           onChanged: (value) {
//                             setState(() {
//                               userAnswers[currentQuestionIndex] = value;
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Navigation buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex > 0
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex--;
//                             });
//                           }
//                         : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       'Previous',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex < questions.length - 1
//                         ? () {
//                             setState(() {
//                               currentQuestionIndex++;
//                             });
//                           }
//                         : () => submitAnswers(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0A368D),
//                     ),
//                     child: Text(
//                       currentQuestionIndex < questions.length - 1
//                           ? 'Next'
//                           : 'Submit',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8), // Reduced bottom padding
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:evalora/frontend/pages/scorecardmcq.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MCQTestPage extends StatefulWidget {
  final String topic;
  final String details;
  final String email; // Email parameter

  MCQTestPage({
    required this.topic,
    required this.details,
    required this.email,
  });

  @override
  _MCQTestPageState createState() => _MCQTestPageState();
}

class _MCQTestPageState extends State<MCQTestPage> {
  int score = 0;
  Timer? timer;
  int timerValue = 1500;
  List<dynamic> questions = [];
  List<String?> userAnswers = [];
  int currentQuestionIndex = 0;
  bool isLoading = true;

  Map<String, dynamic> topicScores = {};
  Map<String, String> feedback = {};

  @override
  void initState() {
    super.initState();
    loadQuestions();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timerValue > 0) {
        setState(() {
          timerValue--;
        });
      } else {
        t.cancel();
        submitAnswers();
      }
    });
  }

  Future<void> loadQuestions() async {
    final url = Uri.parse('http://10.0.2.2:5003/generate_mcqs');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "topic": widget.topic,
          "details": widget.details,
          "num_questions": 30,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          questions = data['mcqs'];
          userAnswers = List<String?>.filled(questions.length, null);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading questions: $e')),
      );
    }
  }

  void calculateFeedback() {
    int correctAnswers = 0;
    int totalQuestions = questions.length;

    for (int i = 0; i < totalQuestions; i++) {
      final correctOption = questions[i]['options']
          [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)];
      if (userAnswers[i] == correctOption) {
        correctAnswers++;
      }
    }

    double accuracy = (correctAnswers / totalQuestions) * 100;
    if (accuracy >= 85) {
      feedback[widget.topic] =
          "Excellent job in the topic: ${widget.topic}! Your accuracy of ${accuracy.toStringAsFixed(2)}% shows a strong grasp of the material. "
          "You’ve demonstrated a high level of understanding and are well-prepared. Keep up the great work, and consider exploring advanced topics "
          "to challenge yourself further.";
    } else if (accuracy >= 50) {
      feedback[widget.topic] =
          "Good performance in the topic: ${widget.topic}. Your accuracy of ${accuracy.toStringAsFixed(2)}% indicates that you have a decent understanding "
          "of the material. However, there’s room for improvement. Revisiting the areas where you struggled could help solidify your knowledge. Keep practicing!";
    } else if (accuracy > 25) {
      feedback[widget.topic] =
          "You faced some challenges in the topic: ${widget.topic}. With an accuracy of ${accuracy.toStringAsFixed(2)}%, it seems there are gaps in your understanding. "
          "Consider revising the core concepts and practicing more to build confidence. Remember, improvement comes with consistent effort!";
    } else {
      feedback[widget.topic] =
          "It looks like you struggled with the topic: ${widget.topic}, achieving an accuracy of only ${accuracy.toStringAsFixed(2)}%. "
          "We recommend a thorough review of the foundational concepts and additional practice exercises. Don't get discouraged—progress takes time, and each step forward matters!";
    }

    // Store scores for the topic
    topicScores[widget.topic] = {
      "correct": correctAnswers,
      "total": totalQuestions,
    };
  }

  // void submitAnswers() {
  //   calculateFeedback();

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ScorePage(
  //         totalQuestions: topicScores[widget.topic]["total"],
  //         correctAnswers: topicScores[widget.topic]["correct"],
  //         wrongAnswers: topicScores[widget.topic]["total"] -
  //             topicScores[widget.topic]["correct"],
  //         email: widget.email,
  //         topic: widget.topic,
  //         details: widget.details,
  //         feedbacks: feedback, // Pass feedbacks to ScorePage
  //       ),
  //     ),
  //   );
  // }

  void submitAnswers() {
    calculateFeedback();

    List<Map<String, dynamic>> wrongAnswersList = [];
    for (int i = 0; i < questions.length; i++) {
      final correctOption = questions[i]['options']
          [questions[i]['correct'].codeUnitAt(0) - 'a'.codeUnitAt(0)];

      if (userAnswers[i] != correctOption) {
        wrongAnswersList.add({
          "question": questions[i]['question'],
          "your_answer": userAnswers[i] ?? "No Answer",
          "correct_answer": correctOption,
        });
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScorePage(
          totalQuestions: topicScores[widget.topic]["total"],
          correctAnswers: topicScores[widget.topic]["correct"],
          wrongAnswers: topicScores[widget.topic]["total"] -
              topicScores[widget.topic]["correct"],
          email: widget.email,
          topic: widget.topic,
          details: widget.details,
          feedbacks: feedback,
          questions: questions,
          userAnswers: userAnswers,
          wrongAnswersList: wrongAnswersList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'MCQ Test',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'MCQ Test',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        body: Center(
          child: Text(
            'No questions available',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];
    final minutes = timerValue ~/ 60;
    final seconds = timerValue % 60;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: kToolbarHeight + 16), // Space for app bar
              Text(
                'MCQ ASSESSMENT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 16),

              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: CircularProgressIndicator(
                      value: timerValue / 1500,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 8,
                    ),
                  ),
                  Text(
                    '$minutes:${seconds.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16), // Add spacing below the timer
              // Question card with timer overlap
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "${currentQuestionIndex + 1}. ${currentQuestion["question"].replaceFirst(RegExp(r'^\d+\.\s*'), '')}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 8),

              Expanded(
                child: ListView.builder(
                  itemCount: currentQuestion["options"].length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(
                          currentQuestion["options"][index],
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        leading: Radio<String>(
                          value: currentQuestion["options"][index],
                          groupValue: userAnswers[currentQuestionIndex],
                          onChanged: (value) {
                            setState(() {
                              userAnswers[currentQuestionIndex] = value;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0
                        ? () {
                            setState(() {
                              currentQuestionIndex--;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0A368D),
                    ),
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: currentQuestionIndex < questions.length - 1
                        ? () {
                            setState(() {
                              currentQuestionIndex++;
                            });
                          }
                        : () => submitAnswers(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0A368D),
                    ),
                    child: Text(
                      currentQuestionIndex < questions.length - 1
                          ? 'Next'
                          : 'Submit',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
