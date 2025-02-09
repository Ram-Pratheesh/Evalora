// import 'package:evalora/frontend/pages/homepage.dart';
// import 'package:evalora/frontend/pages/mcq.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ScorePage extends StatefulWidget {
//   final int totalQuestions;
//   final int correctAnswers;
//   final int wrongAnswers;
//   final String email;
//   final String topic;
//   final String details;
//   final Map<String, String> feedbacks; // Feedback per topic

//   ScorePage({
//     required this.totalQuestions,
//     required this.correctAnswers,
//     required this.wrongAnswers,
//     required this.email,
//     required this.topic,
//     required this.details,
//     required this.feedbacks,
//   });

//   @override
//   _ScorePageState createState() => _ScorePageState();
// }

// class _ScorePageState extends State<ScorePage> {
//   int selectedDifficulty = 0; // Difficulty stars selection state
//   bool showDifficultyCard = true; // Track which card to show
//   String timeFeedback =
//       ""; // Time feedback state ("Sufficient" or "Not Sufficient")
//   bool isLoading = false;

//   void updateDifficulty(int level) {
//     setState(() {
//       selectedDifficulty = level;
//     });
//   }

//   void toggleCard() {
//     setState(() {
//       showDifficultyCard = !showDifficultyCard;
//     });
//   }

//   void setTimeFeedback(String feedback) {
//     setState(() {
//       timeFeedback = feedback;
//     });
//   }

//   Future<void> submitScore() async {
//     setState(() {
//       isLoading = true;
//     });

//     double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;
//     String type = showDifficultyCard
//         ? "Difficulty Feedback"
//         : (timeFeedback == "Sufficient"
//             ? "Sufficient Time"
//             : "Insufficient Time");

//     final url = Uri.parse(
//         'http://192.168.137.1:5000/add-score'); // Replace with your server's address
//     final body = jsonEncode({
//       "email": widget.email,
//       "totalQuestions": widget.totalQuestions,
//       "correctAnswers": widget.correctAnswers,
//       "wrongAnswers": widget.wrongAnswers,
//       "topic": widget.topic,
//       "percentage": percentage,
//       "type": "mcqs",
//       // "feedbacks":
//       //     widget.feedbacks.values.toList(), // Convert feedback map to list
//     });

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: body,
//       );

//       if (response.statusCode == 201) {
//         print("Score submitted successfully");
//       } else {
//         print("Failed to submit score: ${response.body}");
//       }
//     } catch (e) {
//       print("Error submitting score: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;

//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePage(email: widget.email),
//               ),
//             );
//           },
//         ),
//         title: Text(
//           'Your Score',
//           style: TextStyle(fontFamily: 'Poppins', fontSize: 28),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.blue.shade900, Colors.blue.shade100],
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 40),

//                   // Circular score display
//                   Center(
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: 150,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           '${percentage.toStringAsFixed(0)}%',
//                           style: TextStyle(
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),

//                   // Statistics card
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 16, horizontal: 24),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 _buildStatItem(
//                                   color: Colors.blue.shade900,
//                                   label: 'Completion',
//                                   value: '100%',
//                                 ),
//                                 _buildStatItem(
//                                   color: Colors.blue.shade900,
//                                   label: 'Total questions',
//                                   value: '${widget.totalQuestions}',
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 _buildStatItem(
//                                   color: Colors.green,
//                                   label: 'Correct',
//                                   value: '${widget.correctAnswers}',
//                                 ),
//                                 _buildStatItem(
//                                   color: Colors.red,
//                                   label: 'Wrong',
//                                   value: '${widget.wrongAnswers}',
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),

//                   // Toggleable Card (Difficulty/Time Given)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             children: [
//                               // Arrows and Title
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(Icons.arrow_back,
//                                         color: Colors.blue.shade900),
//                                     onPressed:
//                                         showDifficultyCard ? null : toggleCard,
//                                   ),
//                                   Text(
//                                     showDifficultyCard
//                                         ? 'Difficulty'
//                                         : 'Time Given',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Poppins',
//                                       color: Colors.blue.shade900,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.arrow_forward,
//                                         color: Colors.blue.shade900),
//                                     onPressed:
//                                         showDifficultyCard ? toggleCard : null,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 55),
//                               if (showDifficultyCard)
//                                 _buildDifficultyContent()
//                               else
//                                 _buildTimeGivenContent(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),

//                   // Feedback Section
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Feedback:',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                                 color: Colors.blue.shade900,
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             ...widget.feedbacks.entries.map((entry) {
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 4.0),
//                                 child: Text(
//                                   '${entry.value}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily: 'Poppins',
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),

//                   // Action buttons
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             _buildCircularActionButton(
//                               icon: Icons.refresh,
//                               label: 'Attempt Again',
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MCQTestPage(
//                                       email: widget.email,
//                                       topic: widget.topic,
//                                       details: widget.details,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             _buildCircularActionButton(
//                               icon: Icons.home,
//                               label: 'Home',
//                               onPressed: () async {
//                                 await submitScore(); // Submit the score
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         HomePage(email: widget.email),
//                                   ),
//                                 );
//                               },
//                             ),
//                             _buildCircularActionButton(
//                               icon: Icons.share,
//                               label: 'Share',
//                               onPressed: () {
//                                 // Implement sharing functionality here
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//           if (isLoading) Center(child: CircularProgressIndicator()),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatItem(
//       {required Color color, required String label, required String value}) {
//     return Column(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             fontFamily: 'Poppins',
//             color: Colors.black87,
//           ),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//             color: color,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDifficultyContent() {
//     return Column(
//       children: [
//         Text(
//           'Select Difficulty Level:',
//           style: TextStyle(
//             fontSize: 14,
//             fontFamily: 'Poppins',
//             color: Colors.blue.shade900,
//           ),
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildDifficultyStar(1),
//             _buildDifficultyStar(2),
//             _buildDifficultyStar(3),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildDifficultyStar(int level) {
//     return IconButton(
//       icon: Icon(
//         Icons.star,
//         color: selectedDifficulty >= level ? Colors.yellow : Colors.grey,
//       ),
//       onPressed: () => updateDifficulty(level),
//     );
//   }

//   Widget _buildTimeGivenContent() {
//     return Column(
//       children: [
//         Text(
//           'Was the time given sufficient?',
//           style: TextStyle(
//             fontSize: 14,
//             fontFamily: 'Poppins',
//             color: Colors.blue.shade900,
//           ),
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildTimeButton('Sufficient'),
//             _buildTimeButton('Not Sufficient'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeButton(String feedback) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: ElevatedButton(
//         onPressed: () => setTimeFeedback(feedback),
//         child: Text(feedback),
//       ),
//     );
//   }

//   Widget _buildCircularActionButton(
//       {required IconData icon,
//       required String label,
//       required VoidCallback onPressed}) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.blue.shade900,
//           child: IconButton(
//             icon: Icon(icon, color: Colors.white),
//             onPressed: onPressed,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             fontFamily: 'Poppins',
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
