// import 'dart:convert';
// import 'package:evalora/frontend/pages/categories.dart';
// import 'package:evalora/frontend/pages/chatbot.dart';
// import 'package:evalora/frontend/pages/leaderboard.dart';
// import 'package:evalora/frontend/pages/loginpg.dart';
// import 'package:evalora/frontend/pages/profile.dart';
// import 'package:evalora/frontend/pages/reminders.dart';
// import 'package:evalora/frontend/pages/settings.dart';
// import 'package:evalora/frontend/pages/singleass.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_tts/flutter_tts.dart';

// class Analyticspg extends StatefulWidget {
//   final String email; // Unique email to identify the user

//   Analyticspg({required this.email});

//   @override
//   _ResultsPageState createState() => _ResultsPageState();
// }

// class _ResultsPageState extends State<Analyticspg> {
//   FlutterTts _flutterTts = FlutterTts();
//   bool _isTtsInitialized = false;
//   String dynamicFeedbackText = "No feedback available.";

//   String userName = "User";
//   List<Map<String, dynamic>> assessments = [];
//   bool isLoading = true;

//   Future<void> _initializeTts() async {
//     await _flutterTts.setLanguage('en-US');
//     await _flutterTts.setPitch(1.0);
//     await _flutterTts.setSpeechRate(0.5);
//     _isTtsInitialized = true;
//   }

//   void _speakText(String text) {
//     if (_isTtsInitialized) {
//       _flutterTts.speak(text);
//     }
//   }

//   void _showSidebar(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Stack(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Container(
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               bottom: 0,
//               left: 0,
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.75,
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(16),
//                     bottomRight: Radius.circular(16),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     Text(
//                       userName,
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       widget.email,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Divider(color: Colors.grey),
//                     const SizedBox(height: 16),
//                     _buildSidebarItem(context, Icons.analytics, "Analytics"),
//                     _buildSidebarItem(context, Icons.alarm, "Reminders"),
//                     _buildSidebarItem(
//                         context, Icons.leaderboard, "LeaderBoard"),
//                     _buildSidebarItem(context, Icons.settings, "Settings"),
//                     _buildSidebarItem(
//                         context, Icons.category, "Exam Categories"),
//                     _buildSidebarItem(context, Icons.smart_toy, "AI Assistant"),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()),
//                         );
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: const Color(0xFF0A0C90),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Logout",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildSidebarItem(BuildContext context, IconData icon, String title) {
//     return GestureDetector(
//       onTap: () {
//         if (title == "AI Assistant") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ChatScreen(email: widget.email)),
//           );
//         } else if (title == "Analytics") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Analyticspg(email: widget.email)),
//           );
//         } else if (title == "Reminders") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CalendarApp(email: widget.email)),
//           );
//         } else if (title == "Settings") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => SettingsPage(email: widget.email)),
//           );
//         } else if (title == "Exam Categories") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CategoriesPage(email: widget.email)),
//           );
//         } else if (title == "LeaderBoard") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => LeaderboardPage()),
//           );
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12.0),
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.black, size: 24),
//             const SizedBox(width: 16),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initializeTts();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       final response = await http.get(
//         Uri.parse("http://192.168.137.1:5000/get-user?email=${widget.email}"),
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           userName = data['name'];
//           dynamicFeedbackText =
//               data['feedback'] ?? "No personalized feedback available.";
//           assessments = (data['scores'] as List)
//               .map((score) => {
//                     'percentage': (score['percentage'] as num).toDouble(),
//                     'title': score['topic'],
//                     'date': score['date'].split('T')[0],
//                   })
//               .toList();
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to fetch user data');
//       }
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ProfilePage(email: widget.email)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             "User Analysis",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon:
//                 const Icon(Icons.volume_up, color: Color(0xFF0F3870), size: 32),
//             onPressed: () {
//               if (_isTtsInitialized) {
//                 final mostRecentAssessment =
//                     assessments.isNotEmpty ? assessments.first : null;
//                 String speechText =
//                     "Welcome to your analytics page, $userName! ${mostRecentAssessment != null ? "Your most recent assessment is in ${mostRecentAssessment['title']} where you scored ${mostRecentAssessment['percentage'].toStringAsFixed(0)} percent on ${mostRecentAssessment['date']}." : "You have no recent assessments."} Highlights of your progress: Noticeable growth in Math, consistent efforts and increasing confidence, tackling more advanced challenges successfully.";
//                 _speakText(speechText);
//               }
//             },
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 20),
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.black,
//                       child: Icon(Icons.person, size: 50, color: Colors.white),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Hi $userName!',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Recent assessments',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: assessments.isEmpty
//                           ? Center(
//                               child: Text(
//                                 "No recent assessments available.",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontSize: 14,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             )
//                           : Row(
//                               children: assessments.map((assessment) {
//                                 return _buildAssessmentCard(
//                                   context,
//                                   email: widget.email,
//                                   percentage: assessment['percentage'],
//                                   title: assessment['title'],
//                                   date: assessment['date'],
//                                 );
//                               }).toList(),
//                             ),
//                     ),
//                     SizedBox(height: 24),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Feedback',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Card(
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
//                               "You're doing an amazing job! Your assessments show significant improvement, and your dedication to upskilling is paying off.",
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 14,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               "Highlights of Your Progress",
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               "• Noticeable growth in [specific skill/area].\n"
//                               "• Consistent efforts and increasing confidence.\n"
//                               "• Tackling more advanced challenges successfully.",
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 14,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildAssessmentCard(
//     BuildContext context, {
//     required double percentage,
//     required String title,
//     required String date,
//     required String email,
//   }) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         width: 150,
//         height: 250,
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.blue.shade100,
//               child: Text(
//                 "${percentage.toStringAsFixed(0)}%",
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               title,
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 8),
//             Text(
//               date,
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 12,
//                 color: Colors.black54,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AnalyticsPage(
//                       percentage: percentage,
//                       title: title,
//                       email: email,
//                     ),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade900,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               child: Text(
//                 'Analytics',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// // Ensure this file exists
// import 'package:evalora/frontend/pages/singleass.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_tts/flutter_tts.dart';

// class Analyticspg extends StatefulWidget {
//   final String email;

//   Analyticspg({required this.email});

//   @override
//   _ResultsPageState createState() => _ResultsPageState();
// }

// class _ResultsPageState extends State<Analyticspg> {
//   FlutterTts _flutterTts = FlutterTts();
//   bool _isTtsInitialized = false;
//   String userName = "User";
//   List<Map<String, dynamic>> assessments = [];
//   bool isLoading = true;

//   Future<void> _initializeTts() async {
//     await _flutterTts.setLanguage('en-US');
//     await _flutterTts.setPitch(1.0);
//     await _flutterTts.setSpeechRate(0.5);
//     _isTtsInitialized = true;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initializeTts();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       final response = await http.get(
//         Uri.parse("http://192.168.137.1:5000/get-user?email=${widget.email}"),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           userName = data['name'];
//           assessments = (data['scores'] as List)
//               .map((score) => {
//                     'percentage': (score['percentage'] as num).toDouble(),
//                     'title': score['topic'],
//                     'date': score['date'].split('T')[0],
//                     'tqs_list': score['tqs_list'] ?? [],
//                     'crans_list': score['crans_list'] ?? [],
//                     'wrnans_list': score['wrnans_list'] ?? [],
//                   })
//               .toList();
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to fetch user data');
//       }
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             "User Analysis",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 20),
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.black,
//                       child: Icon(Icons.person, size: 50, color: Colors.white),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Hi $userName!',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Recent assessments',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: assessments.isEmpty
//                           ? Center(
//                               child: Text(
//                                 "No recent assessments available.",
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontSize: 14,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             )
//                           : Row(
//                               children: assessments.map((assessment) {
//                                 return _buildAssessmentCard(
//                                   context,
//                                   email: widget.email,
//                                   percentage: assessment['percentage'],
//                                   title: assessment['title'],
//                                   date: assessment['date'],
//                                   tqsList: assessment['tqs_list'],
//                                   cransList: assessment['crans_list'],
//                                   wrnansList: assessment['wrnans_list'],
//                                 );
//                               }).toList(),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildAssessmentCard(
//     BuildContext context, {
//     required double percentage,
//     required String title,
//     required String date,
//     required String email,
//     required List tqsList,
//     required List cransList,
//     required List wrnansList,
//   }) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         width: 150,
//         height: 250,
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.blue.shade100,
//               child: Text(
//                 "${percentage.toStringAsFixed(0)}%",
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               title,
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 8),
//             Text(
//               date,
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 12,
//                 color: Colors.black54,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AnalyticsPage(
//                       email: email,
//                       title: title,
//                       percentage: percentage,
//                       tqsList: tqsList,
//                       cransList: cransList,
//                       wrnansList: wrnansList,
//                     ),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade900,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               child: Text(
//                 'Analytics',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:evalora/frontend/pages/singleass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

class Analyticspg extends StatefulWidget {
  final String email;

  Analyticspg({required this.email});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<Analyticspg> {
  FlutterTts _flutterTts = FlutterTts();
  bool _isTtsInitialized = false;
  String userName = "User";
  List<Map<String, dynamic>> assessments = [];
  bool isLoading = true;
  String feedbackText = "";

  Future<void> _initializeTts() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
    _isTtsInitialized = true;
  }

  @override
  void initState() {
    super.initState();
    _initializeTts();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse("http://10.0.2.2:5000/get-user?email=${widget.email}"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          userName = data['name'];
          feedbackText = data['feedback'] ??
              "• Noticeable growth in [specific skill/area].\n"
                  "• Consistent efforts and increasing confidence.\n"
                  "• Tackling more advanced challenges successfully.";
          assessments = (data['scores'] as List)
              .map((score) => {
                    'percentage': (score['percentage'] as num).toDouble(),
                    'title': score['topic'],
                    'date': score['date'].split('T')[0],
                    'tqs_list': score['tqs_list'] ?? [],
                    'crans_list': score['crans_list'] ?? [],
                    'wrnans_list': score['wrnans_list'] ?? [],
                  })
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch user data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "User Analysis",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hi $userName!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent assessments',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: assessments.isEmpty
                          ? Center(
                              child: Text(
                                "No recent assessments available.",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          : Row(
                              children: assessments.map((assessment) {
                                return _buildAssessmentCard(
                                  context,
                                  email: widget.email,
                                  percentage: assessment['percentage'],
                                  title: assessment['title'],
                                  date: assessment['date'],
                                  tqsList: assessment['tqs_list'],
                                  cransList: assessment['crans_list'],
                                  wrnansList: assessment['wrnans_list'],
                                );
                              }).toList(),
                            ),
                    ),

                    SizedBox(height: 24),

                    // Feedback Card (Updated)
                    _buildFeedbackCard(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildFeedbackCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Feedback",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              feedbackText,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssessmentCard(
    BuildContext context, {
    required double percentage,
    required String title,
    required String date,
    required String email,
    required List tqsList,
    required List cransList,
    required List wrnansList,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 150,
        height: 250,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade100,
              child: Text(
                "${percentage.toStringAsFixed(0)}%",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnalyticsPage(
                      email: email,
                      title: title,
                      percentage: percentage,
                      tqsList: tqsList,
                      cransList: cransList,
                      wrnansList: wrnansList,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Analytics',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
