import 'package:evalora/frontend/pages/analyticspg.dart';
import 'package:evalora/frontend/pages/categories.dart';
import 'package:evalora/frontend/pages/chatbot.dart';
import 'package:evalora/frontend/pages/lang.dart';
import 'package:evalora/frontend/pages/leaderboard.dart';
import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:evalora/frontend/pages/profile.dart';
import 'package:evalora/frontend/pages/reminders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SettingsPage extends StatefulWidget {
  final String email;

  SettingsPage({required this.email});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false;
  String? userName;
  bool areNotificationsEnabled = false;

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

                    Text(
                      userName ?? "User",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.email,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
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

  Widget _buildSidebarItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "AI Assistant") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(email: widget.email)),
          );
        } else if (title == "Analytics") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Analyticspg(email: widget.email)),
          );
        } else if (title == "Reminders") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CalendarApp(email: widget.email)),
          );
        } else if (title == "Settings") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SettingsPage(
                      email: widget.email,
                    )),
          );
        } else if (title == "Exam Categories") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriesPage(
                      email: widget.email,
                    )),
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
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5000/get-user?email=${widget.email}'),
    );

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      setState(() {
        isDarkModeEnabled = userData['selectedItems'].contains('Dark mode');
        areNotificationsEnabled =
            userData['selectedItems'].contains('Notifications');
      });
    } else {
      print('Failed to load user data');
    }
  }

  Future<void> _savePreferences() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/save-preferences'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': widget.email,
        'selectedItems': [
          if (isDarkModeEnabled) 'Dark mode',
          if (areNotificationsEnabled) 'Notifications',
        ],
      }),
    );

    if (response.statusCode == 200) {
      print('Preferences saved successfully');
    } else {
      print('Failed to save preferences');
    }
  }

  void _navigateToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(email: widget.email),
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
            "Settings",
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
            onPressed: _navigateToProfilePage,
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
        color: Color(0xFFF0F4FF),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  SettingTile(
                    icon: Icons.nights_stay,
                    title: "Dark mode",
                    trailing: Switch(
                      value: isDarkModeEnabled,
                      onChanged: (value) {
                        setState(() {
                          isDarkModeEnabled = value;
                        });
                        _savePreferences();
                      },
                      activeColor: Color(0xFF2E4DA7),
                    ),
                  ),
                  SettingTile(
                    icon: Icons.notifications,
                    title: "Notifications",
                    trailing: Switch(
                      value: areNotificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          areNotificationsEnabled = value;
                        });
                        _savePreferences();
                      },
                      activeColor: Color(0xFF2E4DA7),
                    ),
                  ),
                  SettingTile(
                    icon: Icons.lock,
                    title: "Privacy",
                    onTap: () {},
                  ),
                  SettingTile(
                    icon: Icons.attach_money,
                    title: "Payments",
                    onTap: () {},
                  ),
                  SettingTile(
                    icon: Icons.feedback,
                    title: "Feedback/Reviews",
                    onTap: () {},
                  ),
                  SettingTile(
                    icon: Icons.language,
                    title: "Language",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LanguageSelectionPage(
                                  email: widget.email,
                                )),
                      );
                    },
                  ),
                  SettingTile(
                    icon: Icons.support_agent,
                    title: "Support and help",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingTile({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: 70,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsPage(email: 'user@example.com'),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}
