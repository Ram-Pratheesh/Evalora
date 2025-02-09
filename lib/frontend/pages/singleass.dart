import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnalyticsPage extends StatefulWidget {
  final double percentage;
  final String title;
  final String email;
  final List tqsList;
  final List cransList;
  final List wrnansList;

  const AnalyticsPage({
    required this.percentage,
    required this.title,
    required this.email,
    required this.tqsList,
    required this.cransList,
    required this.wrnansList,
  });

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  Map<String, String> aiAnalysisSections = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAIAnalysis();
  }

  Future<void> fetchAIAnalysis() async {
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:5000/generate-ai-analysis"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": widget.email,
          "crans_list": widget.cransList,
          "wrnans_list": widget.wrnansList,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          aiAnalysisSections = Map<String, String>.from(data);
          isLoading = false;
        });
        print("AI Analysis Parsed: $aiAnalysisSections");
      } else {
        throw Exception("Failed to fetch AI analysis");
      }
    } catch (error) {
      setState(() {
        aiAnalysisSections = {
          "Error": "Failed to fetch AI analysis. Please try again."
        };
        isLoading = false;
      });
      print("Error fetching AI analysis: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.grid_view_rounded, color: Colors.blue, size: 28),
                    Text(
                      'Analytics',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.person_outline, color: Colors.black, size: 28),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade100,
                            ),
                          ),
                          Text(
                            '${widget.percentage.toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: aiAnalysisSections.entries.map((entry) {
                          return _buildFeedbackCard(
                            title: entry.key,
                            content: entry.value,
                          );
                        }).toList(),
                      ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackCard({
    required String title,
    required String content,
  }) {
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
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold, // ✅
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
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
}
