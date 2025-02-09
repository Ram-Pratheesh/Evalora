import 'package:evalora/frontend/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';

// Import your home page file
// 🔹 Replace with actual home page file

class StudyPlanGenerator extends StatefulWidget {
  final String email; // 🔹 Pass email dynamically
  // Add this to accept the email
  StudyPlanGenerator({required this.email}); // 🔹 Accept email in constructor

  @override
  _StudyPlanGeneratorState createState() => _StudyPlanGeneratorState();
}

class _StudyPlanGeneratorState extends State<StudyPlanGenerator> {
  String selectedSubject = 'Java';
  String selectedDuration = '1';
  String selectedKnowledgeLevel = 'Easy';
  final TextEditingController goalController = TextEditingController();

  final List<String> subjects = [
    'Java',
    'Python',
    'Cyber Security',
    'Data Science',
    'C',
    'AI'
  ];
  final List<String> durations = ['1', '2', '3', '4', '6', '8'];
  final List<String> knowledgeLevels = ['Easy', 'Medium', 'Expert'];

  Future<void> generateStudyPlan() async {
    final url = Uri.parse('http://10.0.2.2:5009/generate_study_plan');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'subject': selectedSubject,
        'level': selectedKnowledgeLevel,
        'duration': int.parse(selectedDuration),
        'topic': goalController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudyPlanScreen(
            studyPlanDetails: json.decode(response.body),
            subject: selectedSubject,
            level: selectedKnowledgeLevel,
            duration: selectedDuration,
            focus: goalController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate study plan')),
      );
    }
  }

  Widget _buildInputField(String label, String hint, String example,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black38),
              suffixText: example,
              suffixStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F3D77),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(email: widget.email), // 🔹 Pass email dynamically
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F3D77), Color(0xFF5A84C8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Centering the whole card
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 340,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.white, Color(0xFFE1ECF8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "AI- Based Study\nPlan Generator",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F3D77),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Create a personalised study plan that helps you achieve your learning goals effectively.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    _buildDropdownField("Subject/Topic to study",
                        "Select subject", subjects, selectedSubject, (value) {
                      setState(() {
                        selectedSubject = value!;
                      });
                    }),
                    _buildDropdownField(
                        "Your Current Knowledge Level",
                        "Select Knowledge Level",
                        knowledgeLevels,
                        selectedKnowledgeLevel, (value) {
                      setState(() {
                        selectedKnowledgeLevel = value!;
                      });
                    }),
                    _buildDropdownField("Study Duration", "Select Duration",
                        durations, selectedDuration, (value) {
                      setState(() {
                        selectedDuration = value!;
                      });
                    }),
                    _buildInputField(
                      "Specific Goal or Area of Focus",
                      "Enter your Area of Focus",
                      "eg: Variables",
                      goalController,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: generateStudyPlan,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F3D77),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Generate your Study Plan",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint, List<String> items,
      String selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFF0F3D77),
              ),
            ),
            child: DropdownButton<String>(
              value: selectedValue,
              onChanged: onChanged,
              isExpanded: true,
              hint: Text(hint),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: const TextStyle(fontSize: 14, color: Colors.black),
              dropdownColor: Colors.white,
              underline: Container(),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}

class StudyPlanScreen extends StatefulWidget {
  final String subject;
  final String level;
  final String duration;
  final String focus;
  final dynamic studyPlanDetails;

  const StudyPlanScreen({
    required this.studyPlanDetails,
    required this.subject,
    required this.level,
    required this.duration,
    required this.focus,
  });

  @override
  _StudyPlanScreenState createState() => _StudyPlanScreenState();
}

class _StudyPlanScreenState extends State<StudyPlanScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Map<String, dynamic> getWeekStudyPlan(int weekNumber) {
    if (widget.studyPlanDetails != null &&
        widget.studyPlanDetails['study_plan'] != null) {
      return widget.studyPlanDetails['study_plan']['Week $weekNumber'];
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.subject} Study Plan",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF0F3D77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Change arrow color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F3D77), Color(0xFF5A84C8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subject: ${widget.subject}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Knowledge Level: ${widget.level}",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "Duration: ${widget.duration} weeks",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "Focus: ${widget.focus}",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),

                // Calendar View
                Center(
                  child: Container(
                    width: 450,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 59, 126),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TableCalendar(
                      focusedDay: _selectedDay,
                      firstDay: DateTime(2020),
                      lastDay: DateTime(2030),
                      calendarFormat: _calendarFormat,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        leftChevronIcon:
                            Icon(Icons.chevron_left, color: Colors.white),
                        rightChevronIcon:
                            Icon(Icons.chevron_right, color: Colors.white),
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        selectedTextStyle:
                            TextStyle(color: Colors.blue.shade800),
                        weekendTextStyle: TextStyle(color: Colors.white),
                        defaultTextStyle: TextStyle(color: Colors.white),
                        outsideTextStyle: TextStyle(color: Colors.white70),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.white),
                        weekendStyle: TextStyle(color: Colors.redAccent),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                        });

                        int weekNumber =
                            ((selectedDay.difference(DateTime.now()).inDays) /
                                        7)
                                    .floor() +
                                1;

                        var weekStudyPlan = getWeekStudyPlan(weekNumber);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudyPlanDetailsScreen(
                              weekStudyPlan: weekStudyPlan,
                              weekNumber:
                                  weekNumber, // Pass the correct weekNumber
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudyPlanDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> weekStudyPlan;
  final int weekNumber;

  const StudyPlanDetailsScreen(
      {required this.weekStudyPlan, required this.weekNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Plan for the Week",
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white)),
        backgroundColor: Color(0xFF0F3D77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Change arrow color to white
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F3D77), Color(0xFF5A84C8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Week $weekNumber Schedule",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              weekStudyPlan.isNotEmpty
                  ? Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(7, (index) {
                              String topic = weekStudyPlan['topics'][index] ??
                                  'No topic available';

                              topic = topic
                                  .replaceAll(RegExp(r'Day \d+:'), '')
                                  .trim();
                              topic =
                                  topic.replaceAll(RegExp(r'\\'), '').trim();

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Day ${index + 1}: $topic",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
