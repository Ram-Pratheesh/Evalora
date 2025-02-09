// import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  final String email;

  const LanguageSelectionPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final List<String> languages = [
    'English', // English as the first language
    'Assamese', // Assamese as the second language
    'Bengali',
    'Gujarati',
    'Hindi',
    'Kannada',
    'Malayalam',
    'Manipuri',
    'Marathi',
    'Nepali',
    'Punjabi',
    'Tamil',
    'Urdu'
  ];
  final List<String> localess = [
    'en', // Locale for English
    'as', // Locale for Assamese
    'bn',
    'gu',
    'hi',
    'kn',
    'ml',
    'mr',
    'ne',
    'pa',
    'ta',
    'ur'
  ];
  final Map<String, bool> selectedLanguages = {};

  @override
  void initState() {
    super.initState();
    for (var language in languages) {
      selectedLanguages[language] = false;
    }
  }

  void _showSidebar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
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
                      "User",
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
                    _buildSidebarItem(
                        context, Icons.analytics, "analytics".tr()),
                    _buildSidebarItem(context, Icons.alarm, "reminders".tr()),
                    _buildSidebarItem(
                        context, Icons.leaderboard, "leaderboard".tr()),
                    _buildSidebarItem(context, Icons.settings, "settings".tr()),
                    _buildSidebarItem(
                        context, Icons.category, "exam_categories".tr()),
                    _buildSidebarItem(
                        context, Icons.smart_toy, "ai_assistant".tr()),
                    const Spacer(),
                    _buildPremiumCard(),
                    const SizedBox(height: 16),
                    _buildLogoutButton(context),
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
        print('$title tapped!');
        Navigator.of(context).pop();
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

  Widget _buildPremiumCard() {
    return SizedBox(
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
            children: [
              Text(
                "try_premium_features".tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "premium_features".tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 16),
              Text("• Quality AI-Assessments",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              Text("• Feedbacks",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              Text("• Chatbot",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/login');
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _showSidebar(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {}, // Add profile navigation logic here
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select your preferred language',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  String language = languages[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Card(
                        color: Color(0xFF0F3870),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CheckboxListTile(
                          value: selectedLanguages[language],
                          onChanged: (bool? value) {
                            setState(() {
                              selectedLanguages[language] = value ?? false;
                            });
                          },
                          title: Text(
                            language,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.white,
                          checkColor: Color(0xFF0F3870),
                        ),
                      ));
                },
              ),
            ),
            SizedBox(height: 1),
            ElevatedButton(
              onPressed: () async {
                final selected = selectedLanguages.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();

                if (selected.isNotEmpty) {
                  int index = languages.indexOf(selected.last);
                  Locale newLocale = Locale(localess[index]);
                  await context.setLocale(newLocale);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0F3870),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
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
