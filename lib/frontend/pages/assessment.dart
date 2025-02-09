import 'package:evalora/frontend/pages/analyticspg.dart';
import 'package:evalora/frontend/pages/categories.dart';
import 'package:evalora/frontend/pages/chatbot.dart';
import 'package:evalora/frontend/pages/descriptive.dart';
import 'package:evalora/frontend/pages/leaderboard.dart';
import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:evalora/frontend/pages/practicalsweb.dart';
import 'package:evalora/frontend/pages/profile.dart';
import 'package:evalora/frontend/pages/reminders.dart';
import 'package:evalora/frontend/pages/settings.dart';
import 'package:evalora/frontend/pages/viva.dart';
import 'package:flutter/material.dart';
import 'mcq.dart'; // Import the MCQ page

class AssessmentPage extends StatefulWidget {
  final String title;
  final String email;
  final String overview;
  final String content;
  const AssessmentPage({
    Key? key,
    required this.title,
    required this.email,
    required this.content,
    required this.overview,
  }) : super(key: key);

  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  String? selectedMode; // Track the selected assessment mode

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

                    // Replace Jason and email with user details
                    Text(
                      "User", // Replace with current user's name
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.email, // Replace with current user's email
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
                      width: double
                          .infinity, // Makes the card take the full width of the parent
                      child: Card(
                        color: const Color(0xFF0A0C90), // Background color
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
                                  color: Colors.white, // Text color
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
                              Text(
                                "• Quality AI-Assessments",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Text(
                                "• Feedbacks",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Text(
                                "• Chatbot",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Logout Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        ); // Handle logout logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF0A0C90), // Dark blue color
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
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(email: widget.email)),
          );
        } else if (title == "Analytics") {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Analyticspg(email: widget.email)),
          );
        } else if (title == "Reminders") {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CalendarApp(email: widget.email)),
          );
        } else if (title == "Settings") {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SettingsPage(
                      email: widget.email,
                    )),
          );
        } else if (title == "Exam Categories") {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriesPage(
                      email: widget.email,
                    )),
          );
        } else if (title == "LeaderBoard") {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LeaderboardPage()),
          );
        } else {
          // Default behavior for other items
          print('$title tapped!');
          Navigator.of(context).pop(); // Close sidebar after action
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
            "Assessments",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Color(0xFF0A0C90), size: 32),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(email: widget.email),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.grid_view, color: Color(0xFF0A0C90), size: 28),
          onPressed: () {
            _showSidebar(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.blue.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.overview,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose Mode of assessments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 45,
              runSpacing: 18,
              children: [
                _buildAssessmentButton('MCQS'),
                _buildAssessmentButton('Viva-Voce'),
                _buildAssessmentButton('Practicals'),
                _buildAssessmentButton('Pen-Paper'),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedMode != null) {
                    if (selectedMode == 'MCQS') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MCQTestPage(
                            topic: widget.title,
                            details: widget.overview,
                            email: widget.email,
                          ),
                        ),
                      );
                    } else if (selectedMode == 'Practicals') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CodingPage(
                            title: widget.title,
                            email: widget.email,
                          ),
                        ),
                      );
                    } else if (selectedMode == 'Viva-Voce') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VivaPage(),
                        ),
                      );
                    } else if (selectedMode == 'Pen-Paper') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadFilePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'This mode is under development: $selectedMode'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a mode first'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Take Test',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildAssessmentButton(String text) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedMode = text;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selectedMode == text ? Colors.green : Colors.blue.shade800,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
