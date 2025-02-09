import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Import for file selection
import 'package:http/http.dart' as http; // Import for HTTP requests
import 'dart:convert'; // Import for JSON encoding/decoding

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UploadFilePage(),
  ));
}

class UploadFilePage extends StatefulWidget {
  @override
  _UploadFilePageState createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  FilePickerResult? selectedFile; // Variable to store selected file

  /// Function to handle file selection
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Restrict to PDF files
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFile = result;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF uploaded successfully!')),
      );
    } else {
      setState(() {
        selectedFile = null; // Reset if no file is selected
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected.')),
      );
    }
  }

  /// Function to handle submission and processing
  Future<void> _submitAndProcess(BuildContext context) async {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload a PDF file to continue.')),
      );
      return;
    }

    final uri = Uri.parse(
        'http://10.0.2.2:5007/process_pdf'); // For Android Emulator
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath(
        'pdf',
        selectedFile!.files.first.path!,
      ));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        // Decode response to extract text chunks
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> processResult = json.decode(responseBody);
        List<String> textChunks =
            List<String>.from(processResult['text_chunks']);

        // Generate questions from the extracted text
        await _generateQuestions(context, textChunks);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to process PDF. Try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  /// Function to generate questions from text chunks
  Future<void> _generateQuestions(
      BuildContext context, List<String> textChunks) async {
    final questionsUri =
        Uri.parse('http://10.0.2.2:5007/generate_questions');
    try {
      var response = await http.post(
        questionsUri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text_chunks': textChunks}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> questionsResult = json.decode(response.body);
        List<String> questions =
            List<String>.from(questionsResult['questions']);

        // Navigate to the GenerateQuestionsPage with generated questions
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GenerateQuestionsPage(questions: questions),
          ),
        );
      } else {
        throw Exception('Failed to generate questions.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF04318A), // Dominant Blue
                  Color(0xFFE3ECFF), // Lighter White
                ],
                stops: [0.5, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.grid_view, color: Colors.white, size: 30),
                  onPressed: () {
                    print('4-rectangle icon pressed');
                  },
                ),
                Text(
                  'Pen-Paper',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon:
                      Icon(Icons.account_circle, color: Colors.white, size: 30),
                  onPressed: () {
                    print('User icon pressed');
                  },
                ),
              ],
            ),
          ),

          // Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upload your File',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A368D),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Generate Descriptive Questions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF6592E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.cloud_upload, color: Colors.white, size: 50),
                        SizedBox(height: 10),
                        Text(
                          'Drag and Drop Files here',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _pickFile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF04318A),
                          ),
                          child: Text(
                            'Select PDF',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '*.pdf (max: 200mb)',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _submitAndProcess(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF04318A),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Submit and Process',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenerateQuestionsPage extends StatefulWidget {
  final List<String> questions;

  GenerateQuestionsPage({required this.questions});

  @override
  _GenerateQuestionsPageState createState() => _GenerateQuestionsPageState();
}

Future<String> extractTextFromImage(String imagePath) async {
  // Simulate image text extraction (e.g., from AWS Textract or OCR)
  String extractedText = await performTextExtraction(imagePath);
  return extractedText;
}

Future<String> performTextExtraction(String imagePath) async {
  // Call your text extraction API here (e.g., AWS Textract)
  // Example API call:
  // final response = await http.post(Uri.parse('API_URL'), body: {'imagePath': imagePath});
  // return response.body;

  // For now, just return mock text
  return "Extracted text for $imagePath";
}

class _GenerateQuestionsPageState extends State<GenerateQuestionsPage> {
  List<String> uploadedImages = [];
  String totalScore = "";
  List<String> evaluationResults = [];

  // Function to pick images using File Picker
  Future<void> _pickImagesFromDrive() async {
    if (uploadedImages.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You can upload up to 5 images only.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Restrict selection to image files
      allowMultiple: true,
    );

    if (result != null) {
      final newFiles = result.files.map((file) => file.name).toList();

      if (uploadedImages.length + newFiles.length > 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You can upload up to 5 images only.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      setState(() {
        uploadedImages.addAll(newFiles);
      });
    }
  }

  // Function to handle the "Submit and Process" button
  Future<void> _submitAndProcess() async {
    if (uploadedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload at least one image.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Initialize the user answers map
    final Map<String, String> userAnswers = {};

    // Loop through uploaded images and extract text
    for (int i = 0; i < uploadedImages.length; i++) {
      try {
        // Call the text extraction function (from the image)
        String extractedText = await extractTextFromImage(uploadedImages[i]);

        // Map the extracted text to the question number
        userAnswers['Question ${i + 1}'] = extractedText;
      } catch (e) {
        // Handle any errors from text extraction
        print("Error extracting text from image: $e");
        userAnswers['Question ${i + 1}'] =
            'Error extracting answer'; // Default error message
      }
    }

    // Send the answers to backend for evaluation (including model answer generation)
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5007/evaluate_answers'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "user_answers":
            userAnswers, // Updated to a dictionary with extracted answers
        "model_answers": Map.fromIterable(
          widget.questions,
          key: (e) => 'Question ${widget.questions.indexOf(e) + 1}',
          value: (e) =>
              "Sample model answer for $e", // Map questions to dictionary
        ),
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        totalScore = data['total_score']
            .toString(); // Updated total score from backend response
        evaluationResults = (data['scores'] as Map)
            .map((key, value) {
              return MapEntry(key,
                  '${value['marks']} marks (${value['similarity']}% similarity)');
            })
            .values
            .toList();
      });

      // Pass the results to the EvaluationPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EvaluationPage(
            evaluationResults: evaluationResults,
            totalScore: totalScore,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error evaluating answers. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF04318A), // Dominant Blue
                Color(0xFFE3ECFF), // Lighter White
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Generated Questions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.grid_view, color: Colors.white),
          onPressed: () {
            // Your onPressed logic for grid icon
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Your onPressed logic for account circle
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Generated Descriptive Questions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFE3ECFF),
                    child: ListTile(
                      title: Text(
                        'Question ${index + 1}:',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        widget.questions[index],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Upload Your Answers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF6592E9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Select Images from Drive',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImagesFromDrive,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF04318A),
                    ),
                    child: Text(
                      'Select Images',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '*.jpg, *.png, *.jpeg (max: 5 images)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            if (uploadedImages.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: uploadedImages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.image, color: Colors.blue),
                      title: Text(uploadedImages[index]),
                    );
                  },
                ),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitAndProcess,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF04318A),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Submit and Process',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvaluationPage extends StatelessWidget {
  final List<String> evaluationResults;
  final String totalScore;

  EvaluationPage({
    required this.evaluationResults,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF04318A), // Dominant Blue
                Color(0xFFE3ECFF), // Lighter White
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Pen- Paper',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.grid_view, color: Colors.white),
          onPressed: () {
            // Logic for grid icon (if needed)
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Logic for account icon (if needed)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Evaluation Result',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: evaluationResults.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFE3ECFF),
                    child: ListTile(
                      title: Text(
                        'Result ${index + 1}:',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        evaluationResults[index],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF04318A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Total Score:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    totalScore,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
