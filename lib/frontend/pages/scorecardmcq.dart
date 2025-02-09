// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:coderaiders/frontend/pages/mcq.dart';
// import 'package:flutter/material.dart';

// class ScorePage extends StatefulWidget {
//   final int totalQuestions;
//   final int correctAnswers;
//   final int wrongAnswers;
//   final String email;
//   final String topic;
//   final String details;

//   ScorePage({
//     required this.totalQuestions,
//     required this.correctAnswers,
//     required this.wrongAnswers,
//     required this.email,
//     required this.topic,
//     required this.details,
//   });

//   @override
//   _ScorePageState createState() => _ScorePageState();
// }

// class _ScorePageState extends State<ScorePage> {
//   int selectedDifficulty = 0; // Difficulty stars selection state
//   bool showDifficultyCard = true; // Track which card to show
//   String timeFeedback =
//       ""; // Time feedback state ("Sufficient" or "Not Sufficient")

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
//           style: TextStyle(fontFamily: 'Poppins', fontSize: 26),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.blue.shade900, Colors.blue.shade100],
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 40),

//             // Circular score display
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     '${percentage.toStringAsFixed(0)}%',
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),

//             // Statistics card
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildStatItem(
//                             color: Colors.blue.shade900,
//                             label: 'Completion',
//                             value: '100%',
//                           ),
//                           _buildStatItem(
//                             color: Colors.blue.shade900,
//                             label: 'Total questions',
//                             value: '${widget.totalQuestions}',
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildStatItem(
//                             color: Colors.green,
//                             label: 'Correct',
//                             value: '${widget.correctAnswers}',
//                           ),
//                           _buildStatItem(
//                             color: Colors.red,
//                             label: 'Wrong                ',
//                             value: '${widget.wrongAnswers}',
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),

//             // Toggleable Card (Difficulty/Time Given)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Flexible(
//                 child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           // Arrows and Title
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.arrow_back,
//                                     color: Colors.blue.shade900),
//                                 onPressed:
//                                     showDifficultyCard ? null : toggleCard,
//                               ),
//                               Text(
//                                 showDifficultyCard
//                                     ? 'Difficulty'
//                                     : 'Time Given',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Poppins',
//                                   color: Colors.blue.shade900,
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.arrow_forward,
//                                     color: Colors.blue.shade900),
//                                 onPressed:
//                                     showDifficultyCard ? toggleCard : null,
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 55),
//                           if (showDifficultyCard)
//                             _buildDifficultyContent()
//                           else
//                             _buildTimeGivenContent(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             Spacer(),

//             // Action buttons
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildCircularActionButton(
//                         icon: Icons.refresh,
//                         label: 'Attempt Again',
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MCQTestPage(
//                                   email: widget.email,
//                                   topic: widget.topic,
//                                   details: widget.details,
//                                 ),
//                               ));
//                         },
//                       ),
//                       _buildCircularActionButton(
//                         icon: Icons.home,
//                         label: 'Home',
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   HomePage(email: widget.email),
//                             ),
//                           );
//                         },
//                       ),
//                       _buildCircularActionButton(
//                         icon: Icons.share,
//                         label: 'Share Score',
//                         onPressed: () {
//                           // Add share logic
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDifficultyContent() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Easy',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Poppins',
//                 color: Colors.green,
//               ),
//             ),
//             Text(
//               'Moderate',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Poppins',
//                 color: Colors.yellow,
//               ),
//             ),
//             Text(
//               'Intermediate',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Poppins',
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(5, (index) {
//             return GestureDetector(
//               onTap: () => updateDifficulty(index + 1),
//               child: Icon(
//                 Icons.star,
//                 color: selectedDifficulty > index
//                     ? Colors.orange
//                     : Colors.grey.shade300,
//                 size: 24,
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeGivenContent() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () => setTimeFeedback("Sufficient"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: timeFeedback == "Sufficient"
//                     ? Colors.green
//                     : Colors.grey.shade300,
//               ),
//               child: Text('Sufficient'),
//             ),
//             ElevatedButton(
//               onPressed: () => setTimeFeedback("Not Sufficient"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: timeFeedback == "Not Sufficient"
//                     ? Colors.red
//                     : Colors.grey.shade300,
//               ),
//               child: Text('Not Sufficient'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildCircularActionButton({
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onPressed,
//           child: Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue.shade900,
//             ),
//             child: Icon(icon, color: Colors.white, size: 28),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontFamily: 'Poppins',
//             color: Colors.blue.shade900,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }

//   Widget _buildStatItem({
//     required Color color,
//     required String label,
//     required String value,
//   }) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 8,
//           backgroundColor: color,
//         ),
//         SizedBox(width: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Poppins',
//                 color: color,
//               ),
//             ),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Poppins',
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:coderaiders/frontend/pages/mcq.dart';
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

//   ScorePage({
//     required this.totalQuestions,
//     required this.correctAnswers,
//     required this.wrongAnswers,
//     required this.email,
//     required this.topic,
//     required this.details,
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
//         'http://10.0.2.2:5000/add-score'); // Replace with your server's address
//     final body = jsonEncode({
//       "email": widget.email,
//       "totalQuestions": widget.totalQuestions,
//       "correctAnswers": widget.correctAnswers,
//       "wrongAnswers": widget.wrongAnswers,
//       "topic": widget.topic,
//       "percentage": percentage,
//       "type": "mcqs",
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

//   return Scaffold(
//     backgroundColor: Colors.blue.shade900,
//     appBar: AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.white),
//         onPressed: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomePage(email: widget.email),
//             ),
//           );
//         },
//       ),
//       title: Text(
//         'Your Score',
//         style: TextStyle(fontFamily: 'Poppins', fontSize: 26),
//       ),
//       centerTitle: true,
//     ),
//     body: Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.blue.shade900, Colors.blue.shade100],
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 40),

//               // Circular score display
//               Center(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       width: 150,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       '${percentage.toStringAsFixed(0)}%',
//                       style: TextStyle(
//                         fontSize: 36,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Statistics card
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 16, horizontal: 24),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             _buildStatItem(
//                               color: Colors.blue.shade900,
//                               label: 'Completion',
//                               value: '100%',
//                             ),
//                             _buildStatItem(
//                               color: Colors.blue.shade900,
//                               label: 'Total questions',
//                               value: '${widget.totalQuestions}',
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             _buildStatItem(
//                               color: Colors.green,
//                               label: 'Correct',
//                               value: '${widget.correctAnswers}',
//                             ),
//                             _buildStatItem(
//                               color: Colors.red,
//                               label: 'Wrong                ',
//                               value: '${widget.wrongAnswers}',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Toggleable Card (Difficulty/Time Given)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Flexible(
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             // Arrows and Title
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.arrow_back,
//                                       color: Colors.blue.shade900),
//                                   onPressed:
//                                       showDifficultyCard ? null : toggleCard,
//                                 ),
//                                 Text(
//                                   showDifficultyCard
//                                       ? 'Difficulty'
//                                       : 'Time Given',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Poppins',
//                                     color: Colors.blue.shade900,
//                                   ),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.arrow_forward,
//                                       color: Colors.blue.shade900),
//                                   onPressed:
//                                       showDifficultyCard ? toggleCard : null,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 55),
//                             if (showDifficultyCard)
//                               _buildDifficultyContent()
//                             else
//                               _buildTimeGivenContent(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               Spacer(),

//               // Action buttons
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildCircularActionButton(
//                           icon: Icons.refresh,
//                           label: 'Attempt Again',
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => MCQTestPage(
//                                     email: widget.email,
//                                     topic: widget.topic,
//                                     details: widget.details,
//                                   ),
//                                 ));
//                           },
//                         ),
//                         _buildCircularActionButton(
//                           icon: Icons.home,
//                           label: 'Home',
//                           onPressed: () async {
//                             await submitScore(); // Submit the score
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     HomePage(email: widget.email),
//                               ),
//                             );
//                           },
//                         ),
//                         _buildCircularActionButton(
//                           icon: Icons.share,
//                           label: 'Share Score',
//                           onPressed: () {
//                             // Add share logic
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),

//         // Loading overlay
//         if (isLoading)
//           Container(
//             color: Colors.black.withOpacity(0.5),
//             child: Center(
//               child: CircularProgressIndicator(color: Colors.white),
//             ),
//           ),
//       ],
//     ),
//   );
// }

//   Widget _buildDifficultyContent() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Easy',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Poppins',
//                 color: Colors.green,
//               ),
//             ),
//             Text(
//               'Moderate',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Poppins',
//                 color: Colors.yellow,
//               ),
//             ),
//             Text(
//               'Intermediate',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Poppins',
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(5, (index) {
//             return GestureDetector(
//               onTap: () => updateDifficulty(index + 1),
//               child: Icon(
//                 Icons.star,
//                 color: selectedDifficulty > index
//                     ? Colors.orange
//                     : Colors.grey.shade300,
//                 size: 24,
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeGivenContent() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () => setTimeFeedback("Sufficient"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: timeFeedback == "Sufficient"
//                     ? Colors.green
//                     : Colors.grey.shade300,
//               ),
//               child: Text('Sufficient'),
//             ),
//             ElevatedButton(
//               onPressed: () => setTimeFeedback("Not Sufficient"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: timeFeedback == "Not Sufficient"
//                     ? Colors.red
//                     : Colors.grey.shade300,
//               ),
//               child: Text('Not Sufficient'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildCircularActionButton({
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onPressed,
//           child: Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue.shade900,
//             ),
//             child: Icon(icon, color: Colors.white, size: 28),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontFamily: 'Poppins',
//             color: Colors.blue.shade900,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }

//   Widget _buildStatItem({
//     required Color color,
//     required String label,
//     required String value,
//   }) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 8,
//           backgroundColor: color,
//         ),
//         SizedBox(width: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Poppins',
//                 color: color,
//               ),
//             ),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Poppins',
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:coderaiders/frontend/pages/mcq.dart';
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
//       "feedbacks":
//           widget.feedbacks.values.toList(), // Convert feedback map to list
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
//           style: TextStyle(fontFamily: 'Poppins', fontSize: 26),
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

// import 'package:evalora/frontend/pages/homepage.dart';
// import 'package:evalora/frontend/pages/mcq.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart'; // Importing shared_preferences
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
//     required List questions,
//     required List<Map<String, dynamic>> wrongAnswersList,
//     required List<String?> userAnswers,
//   });

//   @override
//   _ScorePageState createState() => _ScorePageState();
// }

// class _ScorePageState extends State<ScorePage> {
//   String selectedDifficulty = "Medium"; // Default to "Medium"
//   bool isLoading = false;
//   String timeFeedback = "Sufficient"; // Default time feedback

//   @override
//   void initState() {
//     super.initState();
//     _loadDifficultyLevel(); // Load saved difficulty level
//   }

//   // Load the saved difficulty level from shared preferences
//   Future<void> _loadDifficultyLevel() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedDifficulty = prefs.getString('difficulty_level') ?? "Medium";
//       print("Loaded Difficulty Level: $selectedDifficulty");
//     });
//   }

//   // Save the selected difficulty level to shared preferences
//   Future<void> _saveDifficultyLevel(String level) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('difficulty_level', level);
//     print("Saved Difficulty Level: $level");
//   }

//   // Update the difficulty when a user clicks one of the buttons
//   void updateDifficulty(String difficulty) {
//     setState(() {
//       selectedDifficulty = difficulty;
//       _saveDifficultyLevel(difficulty); // Save the updated difficulty level
//       print("Current Difficulty Level: $selectedDifficulty");
//     });
//   }

//   // Update the time feedback when a user clicks one of the buttons
//   void setTimeFeedback(String feedback) {
//     setState(() {
//       timeFeedback = feedback;
//       print("Time Feedback: $timeFeedback");
//     });
//   }

//   // Function to submit the score to the backend
//   Future<void> submitScore() async {
//     setState(() {
//       isLoading = true;
//     });

//     double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;
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
//       "feedbacks":
//           widget.feedbacks.values.toList(), // Convert feedback map to list
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

//   // Generate MCQs based on the selected difficulty
//   Future<void> generateMCQs() async {
//     setState(() {
//       isLoading = true;
//     });

//     final url = Uri.parse(
//         'http://192.168.137.1:5000/generate_mcqs'); // Replace with your server's address
//     final body = jsonEncode({
//       "user_id": widget.email,
//       "topic": widget.topic,
//       "details": widget.details,
//       "difficulty": selectedDifficulty,
//     });

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: body,
//       );

//       if (response.statusCode == 200) {
//         print("MCQs generated successfully");
//         // Handle the response containing MCQs
//       } else {
//         print("Failed to generate MCQs: ${response.body}");
//       }
//     } catch (e) {
//       print("Error generating MCQs: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
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
//                           '${((widget.correctAnswers / widget.totalQuestions) * 100).toStringAsFixed(0)}%',
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
//                   // Difficulty selection card
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
//                           children: [
//                             Text(
//                               'Select Difficulty, You want The Next To Be:',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                                 color: Colors.blue.shade900,
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () => updateDifficulty("Easy"),
//                                   child: Text("Easy"),
//                                 ),
//                                 SizedBox(width: 10),
//                                 ElevatedButton(
//                                   onPressed: () => updateDifficulty("Medium"),
//                                   child: Text("Medium"),
//                                 ),
//                                 SizedBox(width: 10),
//                                 ElevatedButton(
//                                   onPressed: () => updateDifficulty("Hard"),
//                                   child: Text("Hard"),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Time Feedback Card
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
//                           children: [
//                             Text(
//                               'Was the time sufficient?',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                                 color: Colors.blue.shade900,
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () =>
//                                       setTimeFeedback("Sufficient"),
//                                   child: Text("Sufficient"),
//                                 ),
//                                 SizedBox(width: 10),
//                                 ElevatedButton(
//                                   onPressed: () =>
//                                       setTimeFeedback("Not Sufficient"),
//                                   child: Text("Not Sufficient"),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 40),
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

// import 'package:evalora/frontend/pages/homepage.dart';
// import 'package:evalora/frontend/pages/mcq.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class ScorePage extends StatefulWidget {
//   final int totalQuestions;
//   final int correctAnswers;
//   final int wrongAnswers;
//   final String email;
//   final String topic;
//   final String details;
//   final Map<String, String> feedbacks;
//   final List<dynamic> questions;
//   final List<Map<String, dynamic>> wrongAnswersList;
//   final List<String?> userAnswers;

//   ScorePage({
//     required this.totalQuestions,
//     required this.correctAnswers,
//     required this.wrongAnswers,
//     required this.email,
//     required this.topic,
//     required this.details,
//     required this.feedbacks,
//     required this.questions,
//     required this.wrongAnswersList,
//     required this.userAnswers,
//   });

//   @override
//   _ScorePageState createState() => _ScorePageState();
// }

// class _ScorePageState extends State<ScorePage> {
//   String selectedDifficulty = "Medium";
//   bool isLoading = false;
//   String timeFeedback = "Sufficient";

//   @override
//   void initState() {
//     super.initState();
//     _loadDifficultyLevel();
//   }

//   Future<void> _loadDifficultyLevel() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedDifficulty = prefs.getString('difficulty_level') ?? "Medium";
//     });
//   }

//   Future<void> _saveDifficultyLevel(String level) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('difficulty_level', level);
//   }

//   void updateDifficulty(String difficulty) {
//     setState(() {
//       selectedDifficulty = difficulty;
//       _saveDifficultyLevel(difficulty);
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
//     final url = Uri.parse('http://192.168.137.1:5000/add-score');
//     final body = jsonEncode({
//       "email": widget.email,
//       "totalQuestions": widget.totalQuestions,
//       "correctAnswers": widget.correctAnswers,
//       "wrongAnswers": widget.wrongAnswers,
//       "topic": widget.topic,
//       "percentage": percentage,
//       "type": "mcqs",
//       "feedbacks": widget.feedbacks.values.toList(),
//     });

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: body,
//       );

//       if (response.statusCode == 201) {
//         print("✅ Score submitted successfully");
//       } else {
//         print("❌ Failed to submit score: ${response.body}");
//       }
//     } catch (e) {
//       print("❌ Error submitting score: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade900,
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
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Colors.white, // Ensuring visibility
//           ),
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
//                   _buildScoreDisplay(),
//                   SizedBox(height: 20),
//                   _buildDifficultySelection(),
//                   SizedBox(height: 20),
//                   _buildTimeFeedback(),
//                   SizedBox(height: 20),
//                   _buildFeedbackSection(),
//                   SizedBox(height: 20),
//                   _buildActionButtons(),
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

//   Widget _buildScoreDisplay() {
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             '${((widget.correctAnswers / widget.totalQuestions) * 100).toStringAsFixed(0)}%',
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Poppins',
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDifficultySelection() {
//     return _buildCard(
//       title: 'Select Difficulty for Next Quiz:',
//       content: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: ["Easy", "Medium", "Hard"].map((level) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: ElevatedButton(
//               onPressed: () => updateDifficulty(level),
//               child: Text(level),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildTimeFeedback() {
//     return _buildCard(
//       title: 'Was the time sufficient?',
//       content: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: ["Sufficient", "Not Sufficient"].map((feedback) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: ElevatedButton(
//               onPressed: () => setTimeFeedback(feedback),
//               child: Text(feedback),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildFeedbackSection() {
//     return _buildCard(
//       title: 'Feedback:',
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: widget.feedbacks.values
//             .map((feedback) => Padding(
//                   padding: EdgeInsets.symmetric(vertical: 4),
//                   child: Text(feedback),
//                 ))
//             .toList(),
//       ),
//     );
//   }

//   Widget _buildActionButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildCircularActionButton(
//           icon: Icons.refresh,
//           label: 'Attempt Again',
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MCQTestPage(
//                   email: widget.email,
//                   topic: widget.topic,
//                   details: widget.details,
//                 ),
//               ),
//             );
//           },
//         ),
//         _buildCircularActionButton(
//           icon: Icons.home,
//           label: 'Home',
//           onPressed: () async {
//             await submitScore();
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePage(email: widget.email),
//               ),
//             );
//           },
//         ),
//       ],
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
//         Text(label,
//             style: TextStyle(
//                 fontSize: 14, fontFamily: 'Poppins', color: Colors.white)),
//       ],
//     );
//   }

//   Widget _buildCard({required String title, required Widget content}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Padding(padding: EdgeInsets.all(16), child: content),
//       ),
//     );
//   }
// }

//works

import 'package:evalora/frontend/pages/homepage.dart';
import 'package:evalora/frontend/pages/mcq.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ScorePage extends StatefulWidget {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final String email;
  final String topic;
  final String details;
  final Map<String, String> feedbacks;
  final List<dynamic> questions;
  final List<Map<String, dynamic>> wrongAnswersList;
  final List<String?> userAnswers;

  ScorePage({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.email,
    required this.topic,
    required this.details,
    required this.feedbacks,
    required this.questions,
    required this.wrongAnswersList,
    required this.userAnswers,
  });

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  String selectedDifficulty = "Medium";
  bool isLoading = false;
  String timeFeedback = "Sufficient";

  @override
  void initState() {
    super.initState();
    _loadDifficultyLevel();

    Future.delayed(Duration(milliseconds: 500), () {
      print("✅ Questions List: ${jsonEncode(widget.questions)}");
      print("✅ User Answers List: ${jsonEncode(widget.userAnswers)}");
      print("✅ Wrong Answers List: ${jsonEncode(widget.wrongAnswersList)}");
    });
  }

  Future<void> _loadDifficultyLevel() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedDifficulty = prefs.getString('difficulty_level') ?? "Medium";
    });
  }

  Future<void> _saveDifficultyLevel(String level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('difficulty_level', level);
  }

  void updateDifficulty(String difficulty) {
    setState(() {
      selectedDifficulty = difficulty;
      _saveDifficultyLevel(difficulty);
    });
  }

  void setTimeFeedback(String feedback) {
    setState(() {
      timeFeedback = feedback;
    });
  }

  Future<void> submitScore() async {
    setState(() {
      isLoading = true;
    });

    double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;
    final url = Uri.parse('http://10.0.2.2:5000/add-score');

    final body = jsonEncode({
      "email": widget.email,
      "totalQuestions": widget.totalQuestions,
      "correctAnswers": widget.correctAnswers,
      "wrongAnswers": widget.wrongAnswers,
      "topic": widget.topic,
      "percentage": percentage,
      "type": "mcqs",
      "feedbacks": widget.feedbacks.values.toList(),
      "tqs_list": widget.questions, // ✅ Sending full question details
      "crans_list": widget.questions
          .map((q) => q["correct"])
          .toList(), // ✅ Extracting correct answers
      "wrnans_list": widget.wrongAnswersList, // ✅ Sending wrong answers
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 201) {
        print("✅ Score submitted successfully");
      } else {
        print("❌ Failed to submit score: ${response.body}");
      }
    } catch (e) {
      print("❌ Error submitting score: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(email: widget.email),
              ),
            );
          },
        ),
        title: Text(
          'Your Score',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade900, Colors.blue.shade100],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  _buildScoreDisplay(),
                  SizedBox(height: 20),
                  _buildDifficultySelection(),
                  SizedBox(height: 20),
                  _buildTimeFeedback(),
                  SizedBox(height: 20),
                  _buildFeedbackSection(),
                  SizedBox(height: 20),
                  _buildActionButtons(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  Widget _buildScoreDisplay() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Text(
            '${((widget.correctAnswers / widget.totalQuestions) * 100).toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultySelection() {
    return _buildCard(
      title: 'Select Difficulty for Next Quiz:',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ["Easy", "Medium", "Hard"].map((level) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              onPressed: () => updateDifficulty(level),
              child: Text(level),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTimeFeedback() {
    return _buildCard(
      title: 'Was the time sufficient?',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ["Sufficient", "Not Sufficient"].map((feedback) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              onPressed: () => setTimeFeedback(feedback),
              child: Text(feedback),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return _buildCard(
      title: 'Feedback:',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.feedbacks.values
            .map((feedback) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    feedback,
                    style: TextStyle(fontSize: 16),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCircularActionButton(
          icon: Icons.refresh,
          label: 'Attempt Again',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MCQTestPage(
                  email: widget.email,
                  topic: widget.topic,
                  details: widget.details,
                ),
              ),
            );
          },
        ),
        _buildCircularActionButton(
          icon: Icons.home,
          label: 'Home',
          onPressed: () async {
            await submitScore();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(email: widget.email),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(20), // Increased padding for visibility
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCircularActionButton(
    {required IconData icon,
    required String label,
    required VoidCallback onPressed}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue.shade900,
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
      ),
      SizedBox(height: 10),
      Text(label,
          style: TextStyle(
              fontSize: 14, fontFamily: 'Poppins', color: Colors.white)),
    ],
  );
}
