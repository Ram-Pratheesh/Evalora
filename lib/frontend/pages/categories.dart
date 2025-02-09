// import 'package:evalora/frontend/pages/analyticspg.dart';
// import 'package:evalora/frontend/pages/catmcq.dart';
// import 'package:evalora/frontend/pages/chatbot.dart';
// import 'package:evalora/frontend/pages/leaderboard.dart';
// import 'package:evalora/frontend/pages/loginpg.dart';
// import 'package:evalora/frontend/pages/profile.dart';
// import 'package:evalora/frontend/pages/reminders.dart';
// import 'package:evalora/frontend/pages/settings.dart';
// import 'package:flutter/material.dart';

// class CategoriesPage extends StatelessWidget {
//   final String email;

//   CategoriesPage({required this.email});

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
//                       "user",
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       email,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Divider(color: Colors.grey),
//                     const SizedBox(height: 16),
//                     // Sidebar Items
//                     _buildSidebarItem(context, Icons.analytics, "Analytics"),
//                     _buildSidebarItem(context, Icons.alarm, "Reminders"),
//                     _buildSidebarItem(
//                         context, Icons.leaderboard, "LeaderBoard"),
//                     _buildSidebarItem(context, Icons.settings, "Settings"),
//                     _buildSidebarItem(
//                         context, Icons.category, "Exam Categories"),
//                     _buildSidebarItem(context, Icons.smart_toy, "AI Assistant"),
//                     const Spacer(),
//                     // Premium Card Positioned Centrally
//                     SizedBox(
//                       width: double.infinity,
//                       child: Card(
//                         color: const Color(0xFF0A0C90),
//                         elevation: 4,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(22.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 "Try premium features",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(height: 6),
//                               Text(
//                                 "just for ₹399",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.orange,
//                                 ),
//                               ),
//                               SizedBox(height: 16),
//                               Text("• Quality AI-Assessments",
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                               Text("• Feedbacks",
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                               Text("• Chatbot",
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     // Logout Button
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()),
//                         ); // Handle logout logic here
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
//                     const SizedBox(height: 16),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Method to build clickable sidebar items
//   Widget _buildSidebarItem(BuildContext context, IconData icon, String title) {
//     return GestureDetector(
//       onTap: () {
//         if (title == "AI Assistant") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ChatScreen(email: email)),
//           );
//         } else if (title == "Analytics") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Analyticspg(email: email)),
//           );
//         } else if (title == "Reminders") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CalendarApp(email: email)),
//           );
//         } else if (title == "Settings") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SettingsPage(email: email)),
//           );
//         } else if (title == "Exam Categories") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CategoriesPage(email: email)),
//           );
//         } else if (title == "LeaderBoard") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => LeaderboardPage()),
//           );
//         } else {
//           print('$title tapped!');
//           Navigator.of(context).pop(); // Close sidebar after action
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
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             "Categories",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle,
//                 color: Color(0xFF0F3870), size: 36),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ProfilePage(
//                           email: email,
//                         )),
//               );
//             }, // Handle profile navigation
//           ),
//         ],
//         leading: IconButton(
//           icon: const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
//           onPressed: () {
//             _showSidebar(context);
//           },
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: ListView(
//           padding: const EdgeInsets.all(16),
//           children: [
//             CategoryCard(
//               title: "MCQ Based Exam",
//               description: "Choose the best option that might be the answer.",
//               imagePath: "assets/mcq_exam.png",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => McqRulesPage(),
//                   ),
//                 );
//               },
//             ),
//             CategoryCard(
//               title: "Viva-Voce Exam",
//               description:
//                   "Provide clear and concise answers to demonstrate your understanding orally.",
//               imagePath: "assets/viva_exam.png",
//               onTap: () {},
//             ),
//             CategoryCard(
//               title: "Practical Exam",
//               description:
//                   "Perform the required tasks to showcase your practical skills and knowledge.",
//               imagePath: "assets/practical_exam.png",
//               onTap: () {},
//             ),
//             CategoryCard(
//               title: "Pen-Paper Exam",
//               description:
//                   "Write detailed answers to demonstrate your understanding and knowledge.",
//               imagePath: "assets/pen_paper_exam.png",
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String imagePath;
//   final VoidCallback onTap;

//   const CategoryCard({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.imagePath,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: const Color(0xFF9ABBFF),
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: InkWell(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       description,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 flex: 1,
//                 child: Image.asset(
//                   imagePath,
//                   height: 80,
//                   fit: BoxFit.contain,
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Icon(Icons.image,
//                         size: 80, color: Colors.grey);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: CategoriesPage(email: "user@example.com"),
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//       fontFamily: 'Poppins',
//     ),
//   ));
// }

import 'package:evalora/frontend/pages/analyticspg.dart';
import 'package:evalora/frontend/pages/catmcq.dart';
import 'package:evalora/frontend/pages/chatbot.dart';
import 'package:evalora/frontend/pages/leaderboard.dart';
import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:evalora/frontend/pages/profile.dart';
import 'package:evalora/frontend/pages/reminders.dart';
import 'package:evalora/frontend/pages/settings.dart';
import 'package:evalora/frontend/pages/vivacat.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final String email;

  CategoriesPage({required this.email});

  void _showSidebar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "user",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 16),
                    // Sidebar Items
                    _buildSidebarItem(context, Icons.analytics, "Analytics"),
                    _buildSidebarItem(context, Icons.alarm, "Reminders"),
                    _buildSidebarItem(
                        context, Icons.leaderboard, "LeaderBoard"),
                    _buildSidebarItem(context, Icons.settings, "Settings"),
                    _buildSidebarItem(
                        context, Icons.category, "Exam Categories"),
                    _buildSidebarItem(context, Icons.smart_toy, "AI Assistant"),
                    const Spacer(),
                    // Premium Card Positioned Centrally
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: const Color(0xFF0A0C90),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Try premium features",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "just for ₹399",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text("• Quality AI-Assessments",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              Text("• Feedbacks",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              Text("• Chatbot",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Logout Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF0A0C90),
                        ),
                        child: const Center(
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Method to build clickable sidebar items
  Widget _buildSidebarItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "AI Assistant") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen(email: email)),
          );
        } else if (title == "Analytics") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Analyticspg(email: email)),
          );
        } else if (title == "Reminders") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalendarApp(email: email)),
          );
        } else if (title == "Settings") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage(email: email)),
          );
        } else if (title == "Exam Categories") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriesPage(email: email)),
          );
        } else if (title == "LeaderBoard") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LeaderboardPage()),
          );
        } else {
          print('$title tapped!');
          Navigator.of(context).pop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Color(0xFF0F3870), size: 36),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(email: email)),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
          onPressed: () {
            _showSidebar(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CategoryCard(
              title: "MCQ Based Exam",
              description: "Choose the best option that might be the answer.",
              imagePath: "assets/mcq_exam.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => McqRulesPage()),
                );
              },
            ),
            CategoryCard(
              title: "Viva-Voce Exam",
              description:
                  "Provide clear and concise answers to demonstrate your understanding orally.",
              imagePath: "assets/viva_exam.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VivaVoceApp()),
                );
              },
            ),
            CategoryCard(
              title: "Practical Exam",
              description:
                  "Perform the required tasks to showcase your practical skills and knowledge.",
              imagePath: "assets/practical_exam.png",
              onTap: () {},
            ),
            CategoryCard(
              title: "Pen-Paper Exam",
              description:
                  "Write detailed answers to demonstrate your understanding and knowledge.",
              imagePath: "assets/pen_paper_exam.png",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF9ABBFF),
      margin: const EdgeInsets.symmetric(
          vertical: 12), // Increased vertical spacing between cards
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 140, // Increased card height for a bigger card
          padding: const EdgeInsets.all(20.0), // Increased internal padding
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20, // Increased title font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14, // Increased description font size
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Image.asset(
                  imagePath,
                  height: 100, // Increased image size
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image,
                        size: 100, color: Colors.grey);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CategoriesPage(email: "user@example.com"),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily:
          'Poppins', // Ensure Poppins font is added in your pubspec.yaml
    ),
  ));
}
