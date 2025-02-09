import 'package:flutter/material.dart';

void main() {
  runApp(const McqRulesApp());
}

class McqRulesApp extends StatelessWidget {
  const McqRulesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const McqRulesPage(),
    );
  }
}

class McqRulesPage extends StatelessWidget {
  const McqRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Rules",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.grid_view, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "MCQ",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Card-like container with gradient background
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A368D), Color(0xFF5B7AB7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Please abide by the rules and have fun learning",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._buildRules(),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // "Done" button aligned to the right
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 140,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to next page or perform another action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6592E9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRules() {
    final List<String> rules = [
      "Read the question carefully: Understand the question before choosing an answer.",
      "One Answer Only: Select only one option unless specified otherwise.",
      "Follow the Time Limit: Complete the test within the allotted time.",
      "No Cheating or Outside Help: Use only permitted resources and avoid sharing or receiving answers.",
      "Submit Before Time Ends: Ensure all answers are submitted before the timer runs out.",
    ];

    return List.generate(rules.length, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          "${index + 1}. ${rules[index]}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    });
  }
}
