// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class InterestSelectionScreen extends StatefulWidget {
//   final String email;

//   const InterestSelectionScreen({Key? key, required this.email})
//       : super(key: key);

//   @override
//   _InterestSelectionScreenState createState() =>
//       _InterestSelectionScreenState();
// }

// class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
//   final List<Map<String, String>> interests = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C program', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/Ux', 'icon': 'assets/ui_ux.png'},
//     {'title': 'Data Analytics', 'icon': 'assets/Data_Analytics.png'},
//     {'title': 'Cyber Security', 'icon': 'assets/Cyber_Security.png'},
//   ];

//   List<String> additionalCourses = [
//     'Cloud Computing',
//     'Blockchain Technology',
//     'DevOps',
//     'Mobile App Development',
//     'Game Development',
//     'Digital Marketing',
//     'Web Development',
//     'Software Testing',
//     'C++',
//     'Python',
//     'Java',
//     'C'
//   ];

//   final List<String> selectedItems = [];
//   String searchQuery = "";
//   List<String> filteredCourses = [];
//   final LayerLink _dropdownLink = LayerLink();
//   OverlayEntry? _dropdownOverlay;

//   final String apiUrl = "http://10.0.2.2:5000/save-preferences"; // Backend URL

//   @override
//   void initState() {
//     super.initState();
//     filteredCourses = additionalCourses;
//   }

//   void updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredCourses = additionalCourses
//           .where((course) => course.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void selectCourse(String course) {
//     setState(() {
//       if (!selectedItems.contains(course)) {
//         selectedItems.add(course);
//       }
//       searchQuery = ""; // Clear search query
//       filteredCourses = additionalCourses; // Reset dropdown options
//     });
//     _removeDropdown();
//   }

//   void toggleInterest(String interest) {
//     setState(() {
//       if (selectedItems.contains(interest)) {
//         selectedItems.remove(interest);
//       } else {
//         selectedItems.add(interest);
//       }
//     });
//   }

//   void _showDropdown() {
//     _dropdownOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: _dropdownLink,
//             showWhenUnlinked: false,
//             offset: const Offset(0, 50),
//             child: Material(
//               elevation: 4.0,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: filteredCourses.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredCourses[index],
//                       style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//                     ),
//                     onTap: () => selectCourse(filteredCourses[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(_dropdownOverlay!);
//   }

//   void _removeDropdown() {
//     _dropdownOverlay?.remove();
//     _dropdownOverlay = null;
//   }

//   Future<void> _savePreferences(BuildContext context) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': widget.email,
//           'selectedItems': selectedItems,
//         }),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Preferences saved successfully!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to the backend')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _removeDropdown();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Welcome Onboard",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontFamily: 'Poppins', // Poppins
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Let us know what you are interested in?",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black54,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Choices Selected",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             CompositedTransformTarget(
//               link: _dropdownLink,
//               child: TextField(
//                 onChanged: (value) {
//                   updateSearch(value);
//                   if (value.isNotEmpty) {
//                     if (_dropdownOverlay == null) {
//                       _showDropdown();
//                     }
//                   } else {
//                     _removeDropdown();
//                   }
//                 },
//                 controller: TextEditingController(text: searchQuery),
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: const TextStyle(
//                     fontSize: 14,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.black26),
//                   ),
//                 ),
//                 style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (selectedItems.isNotEmpty) ...[
//               const Text(
//                 "Selected Items:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Poppins', // Poppins
//                 ),
//               ),
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: selectedItems
//                     .map(
//                       (item) => Chip(
//                         label: Text(
//                           item,
//                           style:
//                               const TextStyle(fontFamily: 'Poppins'), // Poppins
//                         ),
//                         onDeleted: () {
//                           setState(() {
//                             selectedItems.remove(item);
//                           });
//                         },
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//             const SizedBox(height: 16),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   childAspectRatio: 1.5,
//                 ),
//                 itemCount: interests.length,
//                 itemBuilder: (context, index) {
//                   final interest = interests[index];
//                   final isSelected = selectedItems.contains(interest['title']!);
//                   return GestureDetector(
//                     onTap: () => toggleInterest(interest['title']!),
//                     child: InterestCard(
//                       title: interest['title']!,
//                       iconPath: interest['icon']!,
//                       isSelected: isSelected,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _savePreferences(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 45, 82),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                 ),
//                 child: const Text(
//                   "Done",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InterestCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final bool isSelected;

//   const InterestCard({
//     Key? key,
//     required this.title,
//     required this.iconPath,
//     required this.isSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue[100] : Colors.blue[50],
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 8,
//             left: 8,
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: isSelected ? Colors.blue : Colors.black,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               iconPath,
//               height: 90,
//               width: 90,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// test1

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class InterestSelectionScreen extends StatefulWidget {
//   final String email;

//   const InterestSelectionScreen({Key? key, required this.email})
//       : super(key: key);

//   @override
//   _InterestSelectionScreenState createState() =>
//       _InterestSelectionScreenState();
// }

// class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
//   final List<Map<String, String>> interests = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C program', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/Ux', 'icon': 'assets/ui_ux.png'},
//     {'title': 'Data Analytics', 'icon': 'assets/Data_Analytics.png'},
//     {'title': 'Cyber Security', 'icon': 'assets/Cyber_Security.png'},
//   ];

//   List<String> additionalCourses = [
//     'Cloud Computing',
//     'Blockchain Technology',
//     'DevOps',
//     'Mobile App Development',
//     'Game Development',
//     'Digital Marketing',
//     'Web Development',
//     'Software Testing',
//     'C++',
//     'Python',
//     'Java',
//     'C'
//   ];

//   final List<String> selectedItems = [];
//   String searchQuery = "";
//   List<String> filteredCourses = [];
//   final LayerLink _dropdownLink = LayerLink();
//   OverlayEntry? _dropdownOverlay;

//   final String apiUrl = "http://10.0.2.2:5000/save-preferences"; // Backend URL

//   @override
//   void initState() {
//     super.initState();
//     filteredCourses = additionalCourses;
//   }

//   void updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredCourses = additionalCourses
//           .where((course) => course.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void selectCourse(String course) {
//     setState(() {
//       if (!selectedItems.contains(course)) {
//         selectedItems.add(course);
//       }
//       searchQuery = ""; // Clear search query
//       filteredCourses = additionalCourses; // Reset dropdown options
//     });
//     _removeDropdown();
//   }

//   void toggleInterest(String interest) {
//     setState(() {
//       if (selectedItems.contains(interest)) {
//         selectedItems.remove(interest);
//       } else {
//         selectedItems.add(interest);
//       }
//     });
//   }

//   void _showDropdown() {
//     _dropdownOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: _dropdownLink,
//             showWhenUnlinked: false,
//             offset: const Offset(0, 50),
//             child: Material(
//               elevation: 4.0,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: filteredCourses.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredCourses[index],
//                       style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//                     ),
//                     onTap: () => selectCourse(filteredCourses[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(_dropdownOverlay!);
//   }

//   void _removeDropdown() {
//     _dropdownOverlay?.remove();
//     _dropdownOverlay = null;
//   }

//   Future<void> _savePreferences(BuildContext context) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': widget.email,
//           'selectedItems': selectedItems,
//         }),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Preferences saved successfully!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to the backend')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _removeDropdown();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Welcome Onboard",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontFamily: 'Poppins', // Poppins
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Let us know what you are interested in?",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black54,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Choices Selected",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             CompositedTransformTarget(
//               link: _dropdownLink,
//               child: TextField(
//                 onChanged: (value) {
//                   updateSearch(value);
//                   if (value.isNotEmpty) {
//                     if (_dropdownOverlay == null) {
//                       _showDropdown();
//                     }
//                   } else {
//                     _removeDropdown();
//                   }
//                 },
//                 controller: TextEditingController(text: searchQuery),
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: const TextStyle(
//                     fontSize: 14,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.black26),
//                   ),
//                 ),
//                 style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (selectedItems.isNotEmpty) ...[
//               const Text(
//                 "Selected Items:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Poppins', // Poppins
//                 ),
//               ),
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: selectedItems
//                     .map(
//                       (item) => Chip(
//                         label: Text(
//                           item,
//                           style:
//                               const TextStyle(fontFamily: 'Poppins'), // Poppins
//                         ),
//                         onDeleted: () {
//                           setState(() {
//                             selectedItems.remove(item);
//                           });
//                         },
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//             const SizedBox(height: 16),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   childAspectRatio: 1.5,
//                 ),
//                 itemCount: interests.length,
//                 itemBuilder: (context, index) {
//                   final interest = interests[index];
//                   final isSelected = selectedItems.contains(interest['title']!);
//                   return GestureDetector(
//                     onTap: () => toggleInterest(interest['title']!),
//                     child: InterestCard(
//                       title: interest['title']!,
//                       iconPath: interest['icon']!,
//                       isSelected: isSelected,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _savePreferences(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 45, 82),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                 ),
//                 child: const Text(
//                   "Done",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InterestCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final bool isSelected;

//   const InterestCard({
//     Key? key,
//     required this.title,
//     required this.iconPath,
//     required this.isSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue[100] : Colors.blue[50],
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 8,
//             left: 8,
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: isSelected ? Colors.blue : Colors.black,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               iconPath,
//               height: 90,
//               width: 90,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//test 3

// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class InterestSelectionScreen extends StatefulWidget {
//   final String email;

//   const InterestSelectionScreen({Key? key, required this.email})
//       : super(key: key);

//   @override
//   _InterestSelectionScreenState createState() =>
//       _InterestSelectionScreenState();
// }

// class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
//   final List<Map<String, String>> interests = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C program', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/Ux', 'icon': 'assets/ui_ux.png'},
//     {'title': 'Data Analytics', 'icon': 'assets/Data_Analytics.png'},
//     {'title': 'Cyber Security', 'icon': 'assets/Cyber_Security.png'},
//   ];

//   List<String> additionalCourses = [
//     'Cloud Computing',
//     'Blockchain Technology',
//     'DevOps',
//     'Mobile App Development',
//     'Game Development',
//     'Digital Marketing',
//     'Web Development',
//     'Software Testing',
//     'C++',
//     'Python',
//     'Java',
//     'C'
//   ];

//   final List<String> selectedItems = [];
//   String searchQuery = "";
//   List<String> filteredCourses = [];
//   final LayerLink _dropdownLink = LayerLink();
//   OverlayEntry? _dropdownOverlay;

//   final String apiUrl = "http://10.0.2.2:5000/save-preferences"; // Backend URL

//   @override
//   void initState() {
//     super.initState();
//     filteredCourses = additionalCourses;
//   }

//   void updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredCourses = additionalCourses
//           .where((course) => course.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void selectCourse(String course) {
//     setState(() {
//       if (!selectedItems.contains(course)) {
//         selectedItems.add(course);
//       }
//       searchQuery = ""; // Clear search query
//       filteredCourses = additionalCourses; // Reset dropdown options
//     });
//     _removeDropdown();
//   }

//   void toggleInterest(String interest) {
//     setState(() {
//       if (selectedItems.contains(interest)) {
//         selectedItems.remove(interest);
//       } else {
//         selectedItems.add(interest);
//       }
//     });
//   }

//   void _showDropdown() {
//     _dropdownOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: _dropdownLink,
//             showWhenUnlinked: false,
//             offset: const Offset(0, 50),
//             child: Material(
//               elevation: 4.0,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: filteredCourses.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredCourses[index],
//                       style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//                     ),
//                     onTap: () => selectCourse(filteredCourses[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(_dropdownOverlay!);
//   }

//   void _removeDropdown() {
//     _dropdownOverlay?.remove();
//     _dropdownOverlay = null;
//   }

//   Future<void> _savePreferences(BuildContext context) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': widget.email,
//           'selectedItems': selectedItems,
//         }),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Preferences saved successfully!')),
//         );

//         // Navigate to the Home Page after saving preferences
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(email: widget.email),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to the backend')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _removeDropdown();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Welcome Onboard",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontFamily: 'Poppins', // Poppins
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Let us know what you are interested in?",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black54,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Choices Selected",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             CompositedTransformTarget(
//               link: _dropdownLink,
//               child: TextField(
//                 onChanged: (value) {
//                   updateSearch(value);
//                   if (value.isNotEmpty) {
//                     if (_dropdownOverlay == null) {
//                       _showDropdown();
//                     }
//                   } else {
//                     _removeDropdown();
//                   }
//                 },
//                 controller: TextEditingController(text: searchQuery),
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: const TextStyle(
//                     fontSize: 14,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.black26),
//                   ),
//                 ),
//                 style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (selectedItems.isNotEmpty) ...[
//               const Text(
//                 "Selected Items:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Poppins', // Poppins
//                 ),
//               ),
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: selectedItems
//                     .map(
//                       (item) => Chip(
//                         label: Text(
//                           item,
//                           style:
//                               const TextStyle(fontFamily: 'Poppins'), // Poppins
//                         ),
//                         onDeleted: () {
//                           setState(() {
//                             selectedItems.remove(item);
//                           });
//                         },
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//             const SizedBox(height: 16),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   childAspectRatio: 1.5,
//                 ),
//                 itemCount: interests.length,
//                 itemBuilder: (context, index) {
//                   final interest = interests[index];
//                   final isSelected = selectedItems.contains(interest['title']!);
//                   return GestureDetector(
//                     onTap: () => toggleInterest(interest['title']!),
//                     child: InterestCard(
//                       title: interest['title']!,
//                       iconPath: interest['icon']!,
//                       isSelected: isSelected,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _savePreferences(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 45, 82),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                 ),
//                 child: const Text(
//                   "Done",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InterestCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final bool isSelected;

//   const InterestCard({
//     Key? key,
//     required this.title,
//     required this.iconPath,
//     required this.isSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue[100] : Colors.blue[50],
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 8,
//             left: 8,
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: isSelected ? Colors.blue : Colors.black,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               iconPath,
//               height: 90,
//               width: 90,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//test 4 pass works

// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class InterestSelectionScreen extends StatefulWidget {
//   final String email;

//   const InterestSelectionScreen({Key? key, required this.email})
//       : super(key: key);

//   @override
//   _InterestSelectionScreenState createState() =>
//       _InterestSelectionScreenState();
// }

// class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
//   final List<Map<String, String>> interests = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C program', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/Ux', 'icon': 'assets/ui_ux.png'},
//     {'title': 'Data Analytics', 'icon': 'assets/Data_Analytics.png'},
//     {'title': 'Cyber Security', 'icon': 'assets/Cyber_Security.png'},
//   ];

//   List<String> additionalCourses = [
//     'Cloud Computing',
//     'Blockchain Technology',
//     'DevOps',
//     'Mobile App Development',
//     'Game Development',
//     'Digital Marketing',
//     'Web Development',
//     'Software Testing',
//     'C++',
//     'Python',
//     'Java',
//     'C'
//   ];

//   final List<String> selectedItems = [];
//   String searchQuery = "";
//   List<String> filteredCourses = [];
//   final LayerLink _dropdownLink = LayerLink();
//   OverlayEntry? _dropdownOverlay;

//   final String apiUrl =
//       "http://192.168.137.1:5000/save-preferences"; // Backend URL

//   @override
//   void initState() {
//     super.initState();
//     filteredCourses = additionalCourses;
//   }

//   void updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredCourses = additionalCourses
//           .where((course) => course.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });

//     if (searchQuery.isNotEmpty) {
//       if (_dropdownOverlay == null) {
//         _showDropdown();
//       }
//     } else {
//       _removeDropdown();
//     }
//   }

//   void selectCourse(String course) {
//     setState(() {
//       if (!selectedItems.contains(course)) {
//         selectedItems.add(course);
//       }
//       searchQuery = ""; // Clear search query
//       filteredCourses = additionalCourses; // Reset dropdown options
//     });
//     _removeDropdown();
//   }

//   void toggleInterest(String interest) {
//     setState(() {
//       if (selectedItems.contains(interest)) {
//         selectedItems.remove(interest);
//       } else {
//         selectedItems.add(interest);
//       }
//     });
//   }

//   void _showDropdown() {
//     _dropdownOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: _dropdownLink,
//             showWhenUnlinked: false,
//             offset: const Offset(0, 50),
//             child: Material(
//               elevation: 4.0,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: filteredCourses.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredCourses[index],
//                       style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//                     ),
//                     onTap: () => selectCourse(filteredCourses[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(_dropdownOverlay!);
//   }

//   void _removeDropdown() {
//     _dropdownOverlay?.remove();
//     _dropdownOverlay = null;
//   }

//   Future<void> _savePreferences(BuildContext context) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': widget.email,
//           'selectedItems': selectedItems,
//         }),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Preferences saved successfully!')),
//         );

//         // Navigate to the Home Page after saving preferences
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(email: widget.email),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error connecting to the backend')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _removeDropdown();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Welcome Onboard",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontFamily: 'Poppins', // Poppins
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Let us know what you are interested in?",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black54,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Choices Selected",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//             const SizedBox(height: 16),
//             CompositedTransformTarget(
//               link: _dropdownLink,
//               child: TextField(
//                 onChanged: updateSearch,
//                 controller: TextEditingController(text: searchQuery),
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: const TextStyle(
//                     fontSize: 14,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.black26),
//                   ),
//                 ),
//                 style: const TextStyle(fontFamily: 'Poppins'), // Poppins
//                 textDirection: TextDirection.ltr, // Ensure left-to-right typing
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (selectedItems.isNotEmpty) ...[
//               const Text(
//                 "Selected Items:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Poppins', // Poppins
//                 ),
//               ),
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: selectedItems
//                     .map(
//                       (item) => Chip(
//                         label: Text(
//                           item,
//                           style:
//                               const TextStyle(fontFamily: 'Poppins'), // Poppins
//                         ),
//                         onDeleted: () {
//                           setState(() {
//                             selectedItems.remove(item);
//                           });
//                         },
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//             const SizedBox(height: 16),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   childAspectRatio: 1.5,
//                 ),
//                 itemCount: interests.length,
//                 itemBuilder: (context, index) {
//                   final interest = interests[index];
//                   final isSelected = selectedItems.contains(interest['title']!);
//                   return GestureDetector(
//                     onTap: () => toggleInterest(interest['title']!),
//                     child: InterestCard(
//                       title: interest['title']!,
//                       iconPath: interest['icon']!,
//                       isSelected: isSelected,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _savePreferences(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 45, 82),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                 ),
//                 child: const Text(
//                   "Done",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins', // Poppins
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InterestCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final bool isSelected;

//   const InterestCard({
//     Key? key,
//     required this.title,
//     required this.iconPath,
//     required this.isSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue[100] : Colors.blue[50],
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 8,
//             left: 8,
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: isSelected ? Colors.blue : Colors.black,
//                 fontFamily: 'Poppins', // Poppins
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               iconPath,
//               height: 90,
//               width: 90,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:evalora/frontend/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart'; // Import vibration package

class InterestSelectionScreen extends StatefulWidget {
  final String email;

  const InterestSelectionScreen({Key? key, required this.email})
      : super(key: key);

  @override
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  final List<Map<String, String>> interests = [
    {'title': 'English', 'icon': 'assets/english.png'},
    {'title': 'Python', 'icon': 'assets/python.png'},
    {'title': 'C program', 'icon': 'assets/c_programming.png'},
    {'title': 'Data Science', 'icon': 'assets/data_science.png'},
    {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
    {'title': 'UI/Ux', 'icon': 'assets/ui_ux.png'},
    {'title': 'Data Analytics', 'icon': 'assets/Data_Analytics.png'},
    {'title': 'Cyber Security', 'icon': 'assets/Cyber_Security.png'},
  ];

  List<String> additionalCourses = [
    'Cloud Computing',
    'Blockchain Technology',
    'DevOps',
    'Mobile App Development',
    'Game Development',
    'Digital Marketing',
    'Web Development',
    'Software Testing',
    'C++',
    'Python',
    'Java',
    'C'
  ];

  final List<String> selectedItems = [];
  String searchQuery = "";
  List<String> filteredCourses = [];
  final LayerLink _dropdownLink = LayerLink();
  OverlayEntry? _dropdownOverlay;

  final String apiUrl =
      "http://10.0.2.2:5000/save-preferences"; // Backend URL

  @override
  void initState() {
    super.initState();
    filteredCourses = additionalCourses;
  }

  // Method to trigger vibration
  Future<void> _vibrate() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
    }
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredCourses = additionalCourses
          .where((course) => course.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    if (searchQuery.isNotEmpty) {
      if (_dropdownOverlay == null) {
        _showDropdown();
      }
    } else {
      _removeDropdown();
    }
  }

  void selectCourse(String course) {
    setState(() {
      if (!selectedItems.contains(course)) {
        selectedItems.add(course);
      }
      searchQuery = ""; // Clear search query
      filteredCourses = additionalCourses; // Reset dropdown options
    });
    _removeDropdown();
  }

  void toggleInterest(String interest) {
    setState(() {
      if (selectedItems.contains(interest)) {
        selectedItems.remove(interest);
      } else {
        selectedItems.add(interest);
      }
    });
    _vibrate(); // Trigger vibration when interest is toggled
  }

  void _showDropdown() {
    _dropdownOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: _dropdownLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 50),
            child: Material(
              elevation: 4.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredCourses[index],
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                    onTap: () => selectCourse(filteredCourses[index]),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_dropdownOverlay!);
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  Future<void> _savePreferences(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': widget.email,
          'selectedItems': selectedItems,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Preferences saved successfully!')),
        );

        // Navigate to the Home Page after saving preferences
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(email: widget.email),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to the backend')),
      );
    }
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Welcome Onboard",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins', // Poppins
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Let us know what you are interested in?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontFamily: 'Poppins', // Poppins
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choices Selected",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins', // Poppins
              ),
            ),
            const SizedBox(height: 16),
            CompositedTransformTarget(
              link: _dropdownLink,
              child: TextField(
                onChanged: updateSearch,
                controller: TextEditingController(text: searchQuery),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins', // Poppins
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                ),
                style: const TextStyle(fontFamily: 'Poppins'), // Poppins
                textDirection: TextDirection.ltr, // Ensure left-to-right typing
                onTap:
                    _vibrate, // Trigger vibration when the search field is tapped
              ),
            ),
            const SizedBox(height: 16),
            if (selectedItems.isNotEmpty) ...[
              const Text(
                "Selected Items:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins', // Poppins
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selectedItems
                    .map(
                      (item) => Chip(
                        label: Text(
                          item,
                          style:
                              const TextStyle(fontFamily: 'Poppins'), // Poppins
                        ),
                        onDeleted: () {
                          setState(() {
                            selectedItems.remove(item);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.5,
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  final interest = interests[index];
                  final isSelected = selectedItems.contains(interest['title']!);
                  return GestureDetector(
                    onTap: () {
                      toggleInterest(interest['title']!);
                      _vibrate(); // Trigger vibration when interest card is tapped
                    },
                    child: InterestCard(
                      title: interest['title']!,
                      iconPath: interest['icon']!,
                      isSelected: isSelected,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _vibrate(); // Trigger vibration when "Done" button is clicked
                  _savePreferences(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 45, 82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins', // Poppins
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;

  const InterestCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[100] : Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.blue : Colors.black,
                fontFamily: 'Poppins', // Poppins
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              iconPath,
              height: 90,
              width: 90,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
