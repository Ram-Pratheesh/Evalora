// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Poppins',
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final double appBarIconSize = 36;
//   final double titleFontSize = 32;
//   final double subtitleFontSize = 16;
//   final double searchBoxHeight = 50;
//   final double cardPadding = 20;
//   final double cardBorderRadius = 12;
//   final double featuredCategoryIconSize = 60;
//   final double featuredCategoryFontSize = 14;
//   final double recommendationCardHeight = 160;
//   final double recommendationCardWidth = 140;

//   final EdgeInsets pagePadding = EdgeInsets.all(16);
//   final EdgeInsets recommendationCardMargin =
//       EdgeInsets.symmetric(horizontal: 8);

//   final Color primaryColor = Color(0xFF21324B);
//   final Color backgroundColor = Colors.white;
//   final Color cardBackgroundColor = Color(0xFFF7F9FC);
//   final Color textColor = Colors.black;
//   final Color iconColor = Color(0xFF0F3870);
//   final Color borderColor = Color(0xFF21324B);
//   final Color buttonColor = Color(0xFF0F3870);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         elevation: 0,
//         title: Center(
//           child: Text(
//             "Home",
//             style: TextStyle(
//               fontSize: titleFontSize + 4,
//               color: textColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle,
//                 color: iconColor, size: appBarIconSize),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.grid_view, color: iconColor, size: appBarIconSize),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: pagePadding,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hi Jason!",
//                 style: TextStyle(
//                   fontSize: titleFontSize,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               Text(
//                 "Good morning",
//                 style: TextStyle(
//                   fontSize: subtitleFontSize,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: searchBoxHeight / 4),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(cardBorderRadius),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 padding: EdgeInsets.all(cardPadding),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: borderColor, width: 2),
//                   borderRadius: BorderRadius.circular(cardBorderRadius),
//                   color: cardBackgroundColor,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: subtitleFontSize + 4,
//                             fontWeight: FontWeight.bold,
//                             color: textColor,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Take this test to assess and \nfind out your skills.",
//                           style: TextStyle(
//                             fontSize: subtitleFontSize - 2,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                         backgroundColor: buttonColor,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(cardBorderRadius),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Add test-taking logic
//                       },
//                       child: Text(
//                         "Take Test",
//                         style: TextStyle(fontSize: subtitleFontSize - 2),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 25),
//               Text(
//                 "Categories",
//                 style: TextStyle(
//                   fontSize: subtitleFontSize + 2,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     buildCategoryCard(context, "assets/english.png", "English"),
//                     SizedBox(width: 12),
//                     buildCategoryCard(context, "assets/python.png", "Python"),
//                     SizedBox(width: 12),
//                     buildCategoryCard(
//                         context, "assets/c_programming.png", "C Program"),
//                     SizedBox(width: 12),
//                     buildCategoryCard(
//                         context, "assets/data_science.png", "DSA"),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Recommendations",
//                 style: TextStyle(
//                   fontSize: subtitleFontSize + 2,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     buildRecommendationCard(context),
//                     buildRecommendationCard(context),
//                     buildRecommendationCard(context),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             padding: EdgeInsets.all(cardPadding / 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(cardBorderRadius),
//               border: Border.all(color: Colors.grey.shade300),
//               color: cardBackgroundColor,
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Image.asset(
//                     imagePath,
//                     height: featuredCategoryIconSize + 10,
//                     width: featuredCategoryIconSize + 10,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: featuredCategoryFontSize + 2,
//               color: textColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('Recommendation card tapped!');
//       },
//       child: Container(
//         height: recommendationCardHeight,
//         width: recommendationCardWidth,
//         margin: recommendationCardMargin,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(cardBorderRadius),
//           color: cardBackgroundColor,
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Center(
//           child: Text(
//             "Content",
//             style: TextStyle(
//               fontSize: subtitleFontSize,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//test

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Poppins',
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final double appBarIconSize = 36;
//   final double titleFontSize = 32;
//   final double subtitleFontSize = 16;
//   final double searchBoxHeight = 50;
//   final double cardPadding = 20;
//   final double cardBorderRadius = 12;
//   final double featuredCategoryIconSize = 60;
//   final double featuredCategoryFontSize = 14;
//   final double recommendationCardHeight = 180;
//   final double recommendationCardWidth = 160;

//   final EdgeInsets pagePadding = EdgeInsets.all(16);
//   final EdgeInsets recommendationCardMargin =
//       EdgeInsets.symmetric(horizontal: 8);

//   final Color primaryColor = Color(0xFF21324B);
//   final Color backgroundColor = Colors.white;
//   final Color cardBackgroundColor = Color(0xFFF7F9FC);
//   final Color textColor = Colors.black;
//   final Color iconColor = Color(0xFF0F3870);
//   final Color borderColor = Color(0xFF21324B);
//   final Color buttonColor = Color(0xFF0F3870);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         elevation: 0,
//         title: Center(
//           child: Text(
//             "Home",
//             style: TextStyle(
//               fontSize: titleFontSize + 4,
//               color: textColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle,
//                 color: iconColor, size: appBarIconSize),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.grid_view, color: iconColor, size: appBarIconSize),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: pagePadding,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hi Jason!",
//                 style: TextStyle(
//                   fontSize: titleFontSize,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               Text(
//                 "Good morning",
//                 style: TextStyle(
//                   fontSize: subtitleFontSize,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: searchBoxHeight / 4),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(cardBorderRadius),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 padding: EdgeInsets.all(cardPadding),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: borderColor, width: 2),
//                   borderRadius: BorderRadius.circular(cardBorderRadius),
//                   color: cardBackgroundColor,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: subtitleFontSize + 4,
//                             fontWeight: FontWeight.bold,
//                             color: textColor,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Take this test to assess and \nfind out your skills.",
//                           style: TextStyle(
//                             fontSize: subtitleFontSize - 2,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                         backgroundColor: buttonColor,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(cardBorderRadius),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Add test-taking logic
//                       },
//                       child: Text(
//                         "Take Test",
//                         style: TextStyle(fontSize: subtitleFontSize - 2),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 25),
//               Text(
//                 "Categories",
//                 style: TextStyle(
//                   fontSize: subtitleFontSize + 2,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     buildCategoryCard(context, "assets/english.png", "English"),
//                     SizedBox(width: 12),
//                     buildCategoryCard(context, "assets/python.png", "Python"),
//                     SizedBox(width: 12),
//                     buildCategoryCard(
//                         context, "assets/c_programming.png", "C Program"),
//                     SizedBox(width: 12),
//                     buildCategoryCard(
//                         context, "assets/data_science.png", "DSA"),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Recommendations",
//                 style: TextStyle(
//                   fontSize: subtitleFontSize + 2,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     buildRecommendationCard(context),
//                     buildRecommendationCard(context),
//                     buildRecommendationCard(context),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             padding: EdgeInsets.all(cardPadding / 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(cardBorderRadius),
//               border: Border.all(color: Colors.grey.shade300),
//               color: cardBackgroundColor,
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Image.asset(
//                     imagePath,
//                     height: featuredCategoryIconSize + 10,
//                     width: featuredCategoryIconSize + 10,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: featuredCategoryFontSize + 2,
//               color: textColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('Recommendation card tapped!');
//       },
//       child: Container(
//         height: recommendationCardHeight,
//         width: recommendationCardWidth,
//         margin: recommendationCardMargin,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(cardBorderRadius),
//           color: cardBackgroundColor,
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Center(
//           child: Text(
//             "Content",
//             style: TextStyle(
//               fontSize: subtitleFontSize,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//test 2
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
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
//             "Home",
//             style: TextStyle(
//               fontSize: 36,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon:
//                 Icon(Icons.account_circle, color: Color(0xFF0F3870), size: 36),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 36),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hi Jason!",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "Good morning",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFF21324B), width: 2),
//                   borderRadius: BorderRadius.circular(12),
//                   color: Color(0xFFF7F9FC),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Take this test to assess and \nfind out your skills.",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//                         backgroundColor: Color(0xFF0F3870),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         "Take Test",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Text(
//                 "Recommendations",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (isLoading)
//                 const Center(child: CircularProgressIndicator())
//               else if (errorMessage != null)
//                 Center(
//                   child: Text(
//                     errorMessage!,
//                     style: const TextStyle(color: Colors.red, fontSize: 16),
//                     textAlign: TextAlign.center,
//                   ),
//                 )
//               else if (recommendations.isEmpty)
//                 const Center(child: Text("No recommendations available."))
//               else
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: recommendations.map((course) {
//                       return buildRecommendationCard(
//                         course["course_name"],
//                         course["course_description"],
//                         course["course_rating"],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 3 works

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;

//   final List<Map<String, String>> categories = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C Programming', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/UX', 'icon': 'assets/ui_ux.png'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
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
//             "Home",
//             style: TextStyle(
//               fontSize: 36,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon:
//                 Icon(Icons.account_circle, color: Color(0xFF0F3870), size: 36),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 36),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hi Jason!",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "Good morning",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFF21324B), width: 2),
//                   borderRadius: BorderRadius.circular(12),
//                   color: Color(0xFFF7F9FC),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Take this test to assess and \nfind out your skills.",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//                         backgroundColor: Color(0xFF0F3870),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         "Take Test",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Text(
//                 "Categories",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: categories.map((category) {
//                     return buildCategoryCard(
//                       context,
//                       category['icon']!,
//                       category['title']!,
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "Recommendations",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (isLoading)
//                 const Center(child: CircularProgressIndicator())
//               else if (errorMessage != null)
//                 Center(
//                   child: Text(
//                     errorMessage!,
//                     style: const TextStyle(color: Colors.red, fontSize: 16),
//                     textAlign: TextAlign.center,
//                   ),
//                 )
//               else if (recommendations.isEmpty)
//                 const Center(child: Text("No recommendations available."))
//               else
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: recommendations.map((course) {
//                       return buildRecommendationCard(
//                         course["course_name"],
//                         course["course_description"],
//                         course["course_rating"],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 14, color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 5

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;

//   final List<Map<String, String>> categories = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C Programming', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/UX', 'icon': 'assets/ui_ux.png'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
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
//             "Home",
//             style: TextStyle(
//               fontSize: 36,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon:
//                 Icon(Icons.account_circle, color: Color(0xFF0F3870), size: 36),
//             onPressed: () {

//             },
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 36),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hi Jason!",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               Text(
//                 "Good morning",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFF21324B), width: 2),
//                   borderRadius: BorderRadius.circular(12),
//                   color: Color(0xFFF7F9FC),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Take this test to assess and \nfind out your skills.",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//                         backgroundColor: Color(0xFF0F3870),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         "Take Test",
//                         style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Text(
//                 "Featured Categories",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: categories.map((category) {
//                     return buildCategoryCard(
//                       context,
//                       category['icon']!,
//                       category['title']!,
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "Recommendations",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (isLoading)
//                 const Center(child: CircularProgressIndicator())
//               else if (errorMessage != null)
//                 Center(
//                   child: Text(
//                     errorMessage!,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 16,
//                       fontFamily: 'Poppins',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 )
//               else if (recommendations.isEmpty)
//                 const Center(
//                   child: Text(
//                     "No recommendations available.",
//                     style: TextStyle(fontFamily: 'Poppins'),
//                   ),
//                 )
//               else
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: recommendations.map((course) {
//                       return buildRecommendationCard(
//                         course["course_name"],
//                         course["course_description"],
//                         course["course_rating"],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontFamily: 'Poppins',
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//                 fontFamily: 'Poppins',
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 6

// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;

//   final List<Map<String, String>> categories = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C Programming', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/UX', 'icon': 'assets/ui_ux.png'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
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
//             "Home",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon:
//                 Icon(Icons.account_circle, color: Color(0xFF0F3870), size: 36),
//             onPressed: _navigateToProfilePage, // Navigate to ProfilePage
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 36),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Hi Jason!",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               Text(
//                 "Good morning",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFF21324B), width: 2),
//                   borderRadius: BorderRadius.circular(12),
//                   color: Color(0xFFF7F9FC),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Take this test to assess and \nfind out your skills.",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//                         backgroundColor: Color(0xFF0F3870),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         "Take Test",
//                         style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Text(
//                 "Featured Categories",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: categories.map((category) {
//                     return buildCategoryCard(
//                       context,
//                       category['icon']!,
//                       category['title']!,
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "Recommendations",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (isLoading)
//                 const Center(child: CircularProgressIndicator())
//               else if (errorMessage != null)
//                 Center(
//                   child: Text(
//                     errorMessage!,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 16,
//                       fontFamily: 'Poppins',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 )
//               else if (recommendations.isEmpty)
//                 const Center(
//                   child: Text(
//                     "No recommendations available.",
//                     style: TextStyle(fontFamily: 'Poppins'),
//                   ),
//                 )
//               else
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: recommendations.map((course) {
//                       return buildRecommendationCard(
//                         course["course_name"],
//                         course["course_description"],
//                         course["course_rating"],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontFamily: 'Poppins',
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//                 fontFamily: 'Poppins',
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 7 pass

// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   final String userApi = "http://10.0.2.2:5000/get-user";

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;

//   final List<Map<String, String>> categories = [
//     {'title': 'English', 'icon': 'assets/english.png'},
//     {'title': 'Python', 'icon': 'assets/python.png'},
//     {'title': 'C Programming', 'icon': 'assets/c_programming.png'},
//     {'title': 'Data Science', 'icon': 'assets/data_science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'UI/UX', 'icon': 'assets/ui_ux.png'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User"; // Fallback if fetching name fails
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User"; // Fallback if there is an error
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         fontFamily: 'Poppins', // Apply Poppins font globally
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage, // Navigate to ProfilePage
//             ),
//           ],
//           leading: IconButton(
//             icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 30),
//             onPressed: () {},
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search, color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF21324B), width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                     color: Color(0xFFF7F9FC),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             "Take this test to assess and \nfind out your skills.",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           backgroundColor: Color(0xFF0F3870),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Take Test",
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: categories.map((category) {
//                       return buildCategoryCard(
//                         context,
//                         category['icon']!,
//                         category['title']!,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return buildRecommendationCard(
//                           course["course_name"],
//                           course["course_description"],
//                           course["course_rating"],
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 8
// import 'dart:math';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   final String userApi = "http://10.0.2.2:5000/get-user";

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;

//   final List<Map<String, String>> skills = [
//     {'title': 'Python', 'icon': 'assets/python (1).png'}, //
//     {'title': 'Java', 'icon': 'assets/java.png'}, //
//     {'title': 'C Programming', 'icon': 'assets/c-sharp.png'}, //
//     {'title': 'JavaScript', 'icon': 'assets/javascript.png'}, //
//     {'title': 'Flutter', 'icon': 'assets/mobile-development.png'}, //
//     {'title': 'Data Science', 'icon': 'assets/data-science.png'}, //
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'}, //
//     {'title': 'Cybersecurity', 'icon': 'assets/cyber-security.png'}, //
//     {'title': 'Blockchain', 'icon': 'assets/bitcoin.png'}, //
//     {'title': 'UI/UX Design', 'icon': 'assets/ux-design.png'}, //
//     {'title': 'Cloud Computing', 'icon': 'assets/server.png'}, //
//     {'title': 'DevOps', 'icon': 'assets/devops.png'}, //
//     {'title': 'Game Development', 'icon': 'assets/game-development.png'}, //
//     {
//       'title': 'Mobile App Development',
//       'icon': 'assets/mobile-development.png'
//     }, //
//     {'title': 'Software Testing', 'icon': 'assets/testing.png'}, //
//     {'title': 'Digital Marketing', 'icon': 'assets/bullhorn.png'}, //
//     {'title': 'Artificial Intelligence', 'icon': 'assets/ai.png'}, //
//     {'title': 'Augmented Reality', 'icon': 'assets/virtual-tour.png'}, //
//     {'title': 'Web Development', 'icon': 'assets/coding.png'}, //
//     {'title': 'SQL Databases', 'icon': 'assets/sql.png'}, //
//   ];

//   List<Map<String, String>> featuredSkills = [];
//   List<Map<String, String>> remainingSkills = [];
//   String searchQuery = "";
//   List<Map<String, String>> filteredSkills = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//     _randomizeSkills();
//   }

//   void _randomizeSkills() {
//     final random = Random();
//     final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
//     featuredSkills = shuffled.take(5).toList();
//     remainingSkills = shuffled.skip(5).toList();
//     filteredSkills = List.from(remainingSkills);
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User"; // Fallback if fetching name fails
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User"; // Fallback if there is an error
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredSkills = remainingSkills
//           .where((skill) =>
//               skill['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         fontFamily: 'Poppins', // Apply Poppins font globally
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage, // Navigate to ProfilePage
//             ),
//           ],
//           leading: IconButton(
//             icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 30),
//             onPressed: () {},
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CompositedTransformTarget(
//                   link: LayerLink(),
//                   child: TextField(
//                     onChanged: _updateSearch,
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 if (filteredSkills.isNotEmpty)
//                   Material(
//                     elevation: 4.0,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: filteredSkills.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(filteredSkills[index]['title']!,
//                               style: TextStyle(fontFamily: 'Poppins')),
//                           onTap: () {
//                             print(
//                                 "Selected: ${filteredSkills[index]['title']}");
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: featuredSkills.map((skill) {
//                       return buildCategoryCard(
//                         context,
//                         skill['icon']!,
//                         skill['title']!,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return buildRecommendationCard(
//                           course["course_name"],
//                           course["course_description"],
//                           course["course_rating"],
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 9

// import 'dart:math';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   final String userApi = "http://10.0.2.2:5000/get-user";

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;

//   final List<Map<String, String>> skills = [
//     {'title': 'Python', 'icon': 'assets/python (1).png'},
//     {'title': 'Java', 'icon': 'assets/java.png'},
//     {'title': 'C Programming', 'icon': 'assets/c-sharp.png'},
//     {'title': 'JavaScript', 'icon': 'assets/javascript.png'},
//     {'title': 'Flutter', 'icon': 'assets/mobile-development.png'},
//     {'title': 'Data Science', 'icon': 'assets/data-science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'Cybersecurity', 'icon': 'assets/cyber-security.png'},
//     {'title': 'Blockchain', 'icon': 'assets/bitcoin.png'},
//     {'title': 'UI/UX Design', 'icon': 'assets/ux-design.png'},
//     {'title': 'Cloud Computing', 'icon': 'assets/server.png'},
//     {'title': 'DevOps', 'icon': 'assets/devops.png'},
//     {'title': 'Game Development', 'icon': 'assets/game-development.png'},
//     {
//       'title': 'Mobile App Development',
//       'icon': 'assets/mobile-development.png'
//     },
//     {'title': 'Software Testing', 'icon': 'assets/testing.png'},
//     {'title': 'Digital Marketing', 'icon': 'assets/bullhorn.png'},
//     {'title': 'Artificial Intelligence', 'icon': 'assets/ai.png'},
//     {'title': 'Augmented Reality', 'icon': 'assets/virtual-tour.png'},
//     {'title': 'Web Development', 'icon': 'assets/coding.png'},
//     {'title': 'SQL Databases', 'icon': 'assets/sql.png'},
//   ];

//   List<Map<String, String>> featuredSkills = [];
//   List<Map<String, String>> remainingSkills = [];
//   String searchQuery = "";
//   List<Map<String, String>> filteredSkills = [];
//   OverlayEntry? searchOverlay;
//   final LayerLink layerLink = LayerLink();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//     _randomizeSkills();
//   }

//   void _randomizeSkills() {
//     final random = Random();
//     final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
//     featuredSkills = shuffled.take(5).toList();
//     remainingSkills = shuffled.skip(5).toList();
//     filteredSkills = List.from(remainingSkills);
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User"; // Fallback if fetching name fails
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User"; // Fallback if there is an error
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredSkills = remainingSkills
//           .where((skill) =>
//               skill['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//     if (query.isNotEmpty) {
//       _showSearchDropdown();
//     } else {
//       _removeSearchDropdown();
//     }
//   }

//   void _showSearchDropdown() {
//     if (searchOverlay != null) {
//       _removeSearchDropdown();
//     }
//     searchOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: layerLink,
//             offset: Offset(0, 60),
//             showWhenUnlinked: false,
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: filteredSkills.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredSkills[index]['title']!,
//                       style: TextStyle(fontFamily: 'Poppins'),
//                     ),
//                     onTap: () {
//                       print("Selected: ${filteredSkills[index]['title']}");
//                       _removeSearchDropdown();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(searchOverlay!);
//   }

//   void _removeSearchDropdown() {
//     searchOverlay?.remove();
//     searchOverlay = null;
//   }

//   @override
//   void dispose() {
//     _removeSearchDropdown();
//     super.dispose();
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'Poppins'),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage,
//             ),
//           ],
//           leading: IconButton(
//             icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 30),
//             onPressed: () {},
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CompositedTransformTarget(
//                   link: layerLink,
//                   child: TextField(
//                     onChanged: _updateSearch,
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF21324B), width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                     color: Color(0xFFF7F9FC),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             "Take this test to assess and \nfind out your skills.",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           backgroundColor: Color(0xFF0F3870),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Take Test",
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: featuredSkills.map((skill) {
//                       return buildCategoryCard(
//                         context,
//                         skill['icon']!,
//                         skill['title']!,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return buildRecommendationCard(
//                           course["course_name"],
//                           course["course_description"],
//                           course["course_rating"],
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12, // Reduced font size
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 9 workss

// import 'dart:math';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   final String userApi = "http://10.0.2.2:5000/get-user";

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;

//   final List<Map<String, String>> skills = [
//     {'title': 'Python', 'icon': 'assets/python (1).png'},
//     {'title': 'Java', 'icon': 'assets/java.png'},
//     {'title': 'C Programming', 'icon': 'assets/c-sharp.png'},
//     {'title': 'JavaScript', 'icon': 'assets/javascript.png'},
//     {'title': 'Flutter', 'icon': 'assets/mobile-development.png'},
//     {'title': 'Data Science', 'icon': 'assets/data-science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'Cybersecurity', 'icon': 'assets/cyber-security.png'},
//     {'title': 'Blockchain', 'icon': 'assets/bitcoin.png'},
//     {'title': 'UI/UX Design', 'icon': 'assets/ux-design.png'},
//     {'title': 'Cloud Computing', 'icon': 'assets/server.png'},
//     {'title': 'DevOps', 'icon': 'assets/devops.png'},
//     {'title': 'Game Development', 'icon': 'assets/game-development.png'},
//     {
//       'title': 'Mobile App Development',
//       'icon': 'assets/mobile-development.png'
//     },
//     {'title': 'Software Testing', 'icon': 'assets/testing.png'},
//     {'title': 'Digital Marketing', 'icon': 'assets/bullhorn.png'},
//     {'title': 'Artificial Intelligence', 'icon': 'assets/ai.png'},
//     {'title': 'Augmented Reality', 'icon': 'assets/virtual-tour.png'},
//     {'title': 'Web Development', 'icon': 'assets/coding.png'},
//     {'title': 'SQL Databases', 'icon': 'assets/sql.png'},
//   ];

//   List<Map<String, String>> featuredSkills = [];
//   List<Map<String, String>> remainingSkills = [];
//   String searchQuery = "";
//   List<Map<String, String>> filteredSkills = [];
//   OverlayEntry? searchOverlay;
//   final LayerLink layerLink = LayerLink();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//     _randomizeSkills();
//   }

//   void _randomizeSkills() {
//     final random = Random();
//     final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
//     featuredSkills = shuffled.take(5).toList();
//     remainingSkills = shuffled.skip(5).toList();
//     filteredSkills = List.from(remainingSkills);
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User"; // Fallback if fetching name fails
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User"; // Fallback if there is an error
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredSkills = remainingSkills
//           .where((skill) =>
//               skill['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//     if (query.isNotEmpty) {
//       _showSearchDropdown();
//     } else {
//       _removeSearchDropdown();
//     }
//   }

//   void _showSearchDropdown() {
//     if (searchOverlay != null) {
//       _removeSearchDropdown();
//     }
//     searchOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: layerLink,
//             offset: Offset(0, 60),
//             showWhenUnlinked: false,
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: filteredSkills.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredSkills[index]['title']!,
//                       style: TextStyle(fontFamily: 'Poppins'),
//                     ),
//                     onTap: () {
//                       print("Selected: ${filteredSkills[index]['title']}");
//                       _removeSearchDropdown();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(searchOverlay!);
//   }

//   void _removeSearchDropdown() {
//     searchOverlay?.remove();
//     searchOverlay = null;
//   }

//   @override
//   void dispose() {
//     _removeSearchDropdown();
//     super.dispose();
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'Poppins'),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage,
//             ),
//           ],
//           leading: IconButton(
//             icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 30),
//             onPressed: () {},
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CompositedTransformTarget(
//                   link: layerLink,
//                   child: TextField(
//                     onChanged: _updateSearch,
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF21324B), width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                     color: Color(0xFFF7F9FC),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             "Take this test to assess and \nfind out your skills.",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           backgroundColor: Color(0xFF0F3870),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Take Test",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: featuredSkills.map((skill) {
//                       return buildCategoryCard(
//                         context,
//                         skill['icon']!,
//                         skill['title']!,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return buildRecommendationCard(
//                           course["course_name"],
//                           course["course_description"],
//                           course["course_rating"],
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test 10 works

// import 'dart:math';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart';

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   final String userApi = "http://10.0.2.2:5000/get-user";

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;

//   final List<Map<String, String>> skills = [
//     {'title': 'Python', 'icon': 'assets/python (1).png'},
//     {'title': 'Java', 'icon': 'assets/java.png'},
//     {'title': 'C Programming', 'icon': 'assets/c-sharp.png'},
//     {'title': 'JavaScript', 'icon': 'assets/javascript.png'},
//     {'title': 'Flutter', 'icon': 'assets/mobile-development.png'},
//     {'title': 'Data Science', 'icon': 'assets/data-science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'Cybersecurity', 'icon': 'assets/cyber-security.png'},
//     {'title': 'Blockchain', 'icon': 'assets/bitcoin.png'},
//     {'title': 'UI/UX Design', 'icon': 'assets/ux-design.png'},
//     {'title': 'Cloud Computing', 'icon': 'assets/server.png'},
//     {'title': 'DevOps', 'icon': 'assets/devops.png'},
//     {'title': 'Game Development', 'icon': 'assets/game-development.png'},
//     {
//       'title': 'Mobile App Development',
//       'icon': 'assets/mobile-development.png'
//     },
//     {'title': 'Software Testing', 'icon': 'assets/testing.png'},
//     {'title': 'Digital Marketing', 'icon': 'assets/bullhorn.png'},
//     {'title': 'Artificial Intelligence', 'icon': 'assets/ai.png'},
//     {'title': 'Augmented Reality', 'icon': 'assets/virtual-tour.png'},
//     {'title': 'Web Development', 'icon': 'assets/coding.png'},
//     {'title': 'SQL Databases', 'icon': 'assets/sql.png'},
//   ];

//   List<Map<String, String>> featuredSkills = [];
//   List<Map<String, String>> remainingSkills = [];
//   String searchQuery = "";
//   List<Map<String, String>> filteredSkills = [];
//   OverlayEntry? searchOverlay;
//   final LayerLink layerLink = LayerLink();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//     _randomizeSkills();
//   }

//   void _randomizeSkills() {
//     final random = Random();
//     final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
//     featuredSkills = shuffled.take(5).toList();
//     remainingSkills = shuffled.skip(5).toList();
//     filteredSkills = List.from(remainingSkills);
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User"; // Fallback if fetching name fails
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User"; // Fallback if there is an error
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredSkills = remainingSkills
//           .where((skill) =>
//               skill['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//     if (query.isNotEmpty) {
//       _showSearchDropdown();
//     } else {
//       _removeSearchDropdown();
//     }
//   }

//   void _showSearchDropdown() {
//     if (searchOverlay != null) {
//       _removeSearchDropdown();
//     }
//     searchOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: layerLink,
//             offset: Offset(0, 60),
//             showWhenUnlinked: false,
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: filteredSkills.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredSkills[index]['title']!,
//                       style: TextStyle(fontFamily: 'Poppins'),
//                     ),
//                     onTap: () {
//                       print("Selected: ${filteredSkills[index]['title']}");
//                       _removeSearchDropdown();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(searchOverlay!);
//   }

//   void _removeSearchDropdown() {
//     searchOverlay?.remove();
//     searchOverlay = null;
//   }

//   @override
//   void dispose() {
//     _removeSearchDropdown();
//     super.dispose();
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   Future<void> _openCourseUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Cannot open URL: $url")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'Poppins'),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage,
//             ),
//           ],
//           leading: IconButton(
//             icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 30),
//             onPressed: () {},
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CompositedTransformTarget(
//                   link: layerLink,
//                   child: TextField(
//                     onChanged: _updateSearch,
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF21324B), width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                     color: Color(0xFFF7F9FC),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             "Take this test to assess and \nfind out your skills.",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           backgroundColor: Color(0xFF0F3870),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Take Test",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: featuredSkills.map((skill) {
//                       return buildCategoryCard(
//                         context,
//                         skill['icon']!,
//                         skill['title']!,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return GestureDetector(
//                           onTap: () => _openCourseUrl(course["course_url"]),
//                           child: buildRecommendationCard(
//                             course["course_name"],
//                             course["course_description"],
//                             course["course_rating"],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//test  11 works

// import 'dart:math';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://10.0.2.2:5001/generate-recommendations";
//   final String userApi = "http://10.0.2.2:5000/get-user";

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;

//   final List<Map<String, String>> skills = [
//     {'title': 'Python', 'icon': 'assets/python (1).png'},
//     {'title': 'Java', 'icon': 'assets/java.png'},
//     {'title': 'C Programming', 'icon': 'assets/c-sharp.png'},
//     {'title': 'JavaScript', 'icon': 'assets/javascript.png'},
//     {'title': 'Flutter', 'icon': 'assets/mobile-development.png'},
//     {'title': 'Data Science', 'icon': 'assets/data-science.png'},
//     {'title': 'Machine Learning', 'icon': 'assets/machine_learning.png'},
//     {'title': 'Cybersecurity', 'icon': 'assets/cyber-security.png'},
//     {'title': 'Blockchain', 'icon': 'assets/bitcoin.png'},
//     {'title': 'UI/UX Design', 'icon': 'assets/ux-design.png'},
//     {'title': 'Cloud Computing', 'icon': 'assets/server.png'},
//     {'title': 'DevOps', 'icon': 'assets/devops.png'},
//     {'title': 'Game Development', 'icon': 'assets/game-development.png'},
//     {
//       'title': 'Mobile App Development',
//       'icon': 'assets/mobile-development.png'
//     },
//     {'title': 'Software Testing', 'icon': 'assets/testing.png'},
//     {'title': 'Digital Marketing', 'icon': 'assets/bullhorn.png'},
//     {'title': 'Artificial Intelligence', 'icon': 'assets/ai.png'},
//     {'title': 'Augmented Reality', 'icon': 'assets/virtual-tour.png'},
//     {'title': 'Web Development', 'icon': 'assets/coding.png'},
//     {'title': 'SQL Databases', 'icon': 'assets/sql.png'},
//   ];

//   List<Map<String, String>> featuredSkills = [];
//   List<Map<String, String>> remainingSkills = [];
//   String searchQuery = "";
//   List<Map<String, String>> filteredSkills = [];
//   OverlayEntry? searchOverlay;
//   final LayerLink layerLink = LayerLink();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//     _randomizeSkills();
//   }

//   void _randomizeSkills() {
//     final random = Random();
//     final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
//     featuredSkills = shuffled.take(5).toList();
//     remainingSkills = shuffled.skip(5).toList();
//     filteredSkills = List.from(remainingSkills);
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User"; // Fallback if fetching name fails
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User"; // Fallback if there is an error
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations: ${response.body}";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service: $e";
//         isLoading = false;
//       });
//     }
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredSkills = remainingSkills
//           .where((skill) =>
//               skill['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//     if (query.isNotEmpty) {
//       _showSearchDropdown();
//     } else {
//       _removeSearchDropdown();
//     }
//   }

//   void _showSearchDropdown() {
//     if (searchOverlay != null) {
//       _removeSearchDropdown();
//     }
//     searchOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: layerLink,
//             offset: Offset(0, 60),
//             showWhenUnlinked: false,
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: filteredSkills.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredSkills[index]['title']!,
//                       style: TextStyle(fontFamily: 'Poppins'),
//                     ),
//                     onTap: () {
//                       print("Selected: ${filteredSkills[index]['title']}");
//                       _removeSearchDropdown();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(searchOverlay!);
//   }

//   void _removeSearchDropdown() {
//     searchOverlay?.remove();
//     searchOverlay = null;
//   }

//   @override
//   void dispose() {
//     _removeSearchDropdown();
//     super.dispose();
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   Future<void> _openCourseUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Cannot open URL: $url")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'Poppins'),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage,
//             ),
//           ],
//           leading: IconButton(
//             icon: Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 30),
//             onPressed: () {},
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CompositedTransformTarget(
//                   link: layerLink,
//                   child: TextField(
//                     onChanged: _updateSearch,
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF21324B), width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                     color: Color(0xFFF7F9FC),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             "Take this test to assess and \nfind out your skills.",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           backgroundColor: Color(0xFF0F3870),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Take Test",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: featuredSkills.map((skill) {
//                       return buildCategoryCard(
//                         context,
//                         skill['icon']!,
//                         skill['title']!,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return GestureDetector(
//                           onTap: () => _openCourseUrl(course["course_url"]),
//                           child: buildRecommendationCard(
//                             course["course_name"],
//                             course["course_description"],
//                             course["course_rating"],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildCategoryCard(
//       BuildContext context, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         print('$title card tapped!');
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: Color(0xFFF7F9FC),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xFFF7F9FC),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// test 12 pass works

// import 'dart:math';
// import 'package:coderaiders/frontend/pages/assessment.dart';
// import 'package:coderaiders/frontend/pages/categories.dart';
// import 'package:coderaiders/frontend/pages/chatbot.dart';
// import 'package:coderaiders/frontend/pages/leaderboard.dart';
// import 'package:coderaiders/frontend/pages/loginpg.dart';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:coderaiders/frontend/pages/reminders.dart';
// import 'package:coderaiders/frontend/pages/analyticspg.dart';
// import 'package:coderaiders/frontend/pages/settings.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
// import 'package:flutter_tts/flutter_tts.dart';

// void main() {
//   runApp(MaterialApp(
//     home: HomePage(email: "john@gmail.com"),
//   ));
// }

// class HomePage extends StatefulWidget {
//   final String email;

//   const HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// //http://192.168.137.1:5003/generate_mcqs
// class _HomePageState extends State<HomePage> {
//   final String recommendationsApi =
//       "http://192.168.137.1:5001/generate-recommendations";
//   final String userApi = "http://192.168.137.1:5000/get-user";

//   final FlutterTts flutterTts = FlutterTts(); // Initialize TTS

//   void _speakPageIntro() {
//     final String welcomeMessage = "Good morning, ${userName ?? "User"}!";

//     // Sidebar details
//     const String sidebarMessage =
//         "There is a sidebar menu on the top left corner. "
//         "The sidebar includes options like Analytics, Feedbacks, Reminders, "
//         "Leaderboard, Settings, Exam Categories, and AI Assistant.";

//     // Featured categories
//     final String featuredCategoriesMessage =
//         "Here are your featured categories: "
//         "${featuredSkills.map((skill) => skill['title']).join(", ")}, and more.";

//     // Recommendations
//     final String recommendationsMessage = recommendations.isNotEmpty
//         ? "Here are some recommended courses: " +
//             recommendations.map((course) => course["course_name"]).join(", ")
//         : "No recommendations available at the moment.";

//     // Combine all messages
//     final String pageIntro =
//         "$welcomeMessage $sidebarMessage $featuredCategoriesMessage $recommendationsMessage";

//     // Speak the message
//     _speak(pageIntro);
//   }

//   void _speakPageIntroOnEnter() {
//     final String welcomeMessage =
//         "Good morning, ${userName ?? "User"}! The speaker icon is in the top right corner, left of the user profile icon.";

//     // Combine the greeting sections
//     final String pageIntro = "$welcomeMessage";

//     // Speak the message using TTS
//     _speak(pageIntro);
//   }

//   Future<void> _speak(String text) async {
//     try {
//       await flutterTts.speak(text); // Speak the provided text
//     } catch (e) {
//       debugPrint("Error in TTS: $e");
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

//                     // Replace Jason and email with user details
//                     Text(
//                       userName ?? "User", // Replace with current user's name
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       widget.email, // Replace with current user's email
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
//                       width: double
//                           .infinity, // Makes the card take the full width of the parent
//                       child: Card(
//                         color: const Color(0xFF0A0C90), // Background color
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
//                                   color: Colors.white, // Text color
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
//                               Text(
//                                 "• Quality AI-Assessments",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.white),
//                               ),
//                               Text(
//                                 "• Feedbacks",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.white),
//                               ),
//                               Text(
//                                 "• Chatbot",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // Logout Button
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()),
//                         ); // Handle logout logic here
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: const Color(0xFF0A0C90), // Dark blue color
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
//           // Navigate to ChatScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ChatScreen(email: widget.email)),
//           );
//         } else if (title == "Analytics") {
//           // Navigate to ChatScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Analyticspg(email: widget.email)),
//           );
//         } else if (title == "Reminders") {
//           // Navigate to ChatScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CalendarApp(email: widget.email)),
//           );
//         } else if (title == "Settings") {
//           // Navigate to ChatScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => SettingsPage(
//                       email: widget.email,
//                     )),
//           );
//         } else if (title == "Exam Categories") {
//           // Navigate to ChatScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CategoriesPage(
//                       email: widget.email,
//                     )),
//           );
//         } else if (title == "LeaderBoard") {
//           // Navigate to ChatScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => LeaderboardPage()),
//           );
//         } else {
//           // Default behavior for other items
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

//   List<dynamic> recommendations = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String? userName;
//   int _currentIndex = 1; // Default selected tab is Home.

//   void _onNavigationTap(int index) {
//     if (_currentIndex == index) {
//       // If already on the current tab, do nothing.
//       return;
//     }

//     setState(() {
//       _currentIndex = index;
//     });

//     // Navigate to the selected page
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 CalendarApp(email: widget.email), // Pass email
//           ),
//         );
//         break;
//       case 1:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(email: widget.email),
//           ),
//         );
//         break;
//       case 2:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LeaderboardPage(), // Pass email
//           ),
//         );
//         break;
//     }
//   }

//   final List<Map<String, String>> skills = [
//     {
//       'title': 'Python',
//       'icon': 'assets/python (1).png',
//       'overview':
//           'Python is a versatile, high-level programming language known for its simplicity and readability. It is widely used in web development, data analysis, artificial intelligence, and more due to its extensive libraries and community support. Pythons design philosophy emphasizes code readability, allowing developers to write concise, elegant solutions to complex problems.',
//       'content':
//           "Python Overview: Python is a versatile, high-level programming language known for its simplicity and readability. It is widely used in web development, data analysis, artificial intelligence, and more due to its extensive libraries and community support. Pythons design philosophy emphasizes code readability, allowing developers to write concise, elegant solutions to complex problems.| Key Types or Categories: Python includes data types such as integers, floats, strings, and complex numbers. It supports sequence types like lists, tuples, and dictionaries, which allow for efficient data manipulation. Python s standard library includes modules for networking, file handling, and mathematical operations, among other functionalities.|Operations or Functions: Python supports arithmetic, logical, and comparison operations. Functions such as print() and input() handle basic I/O operations, while libraries like NumPy and Pandas enable advanced computations and data manipulation. Python s object-oriented and functional programming paradigms enhance its flexibility.| Applications and Use Cases: Python is used in web development frameworks like Django, data analysis tools like Pandas, and machine learning libraries like TensorFlow. It powers applications in diverse fields, including finance, education, and healthcare.Advanced Python includes multi-threading, decorators, and metaprogramming. Tools like Flask, PyTorch, and PySpark extend Python s capabilities for web development, deep learning, and big data processing."
//     },
//     {
//       'title': 'Java',
//       'icon': 'assets/java.png',
//       'overview':
//           'Java is a robust, platform-independent programming language widely used for building enterprise-level applications. Known for its ""write once, run anywhere"" capability, Java�s virtual machine (JVM) allows programs to run seamlessly across different platforms',
//       'content':
//           '''Java Overview: Java is a robust, platform-independent programming language widely used for building enterprise-level applications. Known for its ""write once, run anywhere"" capability, Java�s virtual machine (JVM) allows programs to run seamlessly across different platforms.
//           Key Types or Categories: Java supports data types such as primitive types (int, float, char) and reference types (objects and arrays). Its class-based, object-oriented structure underpins its extensive API and libraries like Java Collections and JDBC.Core operations include arithmetic, bitwise, and logical operations. Java�s API provides support for networking, concurrency, and GUI development through Swing and JavaFX.
//           Applications and Use Cases: Java is extensively used in web development with frameworks like Spring, mobile app development for Android, and server-side applications in banking and e-commerce.Advanced Java topics include streams, lambda expressions, and multi-threading. Tools like Apache Kafka and Hibernate extend Javas capabilities for big data and ORM.'''
//     },
//     {
//       'title': 'C Programming',
//       'icon': 'assets/c-sharp.png',
//       'overview':
//           'C is a foundational programming language, known for its speed and close-to-hardware capabilities. It is widely used in systems programming, embedded systems, and developing operating systems',
//       'content':
//           '''C Programming Overview: C is a foundational programming language, known for its speed and close-to-hardware capabilities. It is widely used in systems programming, embedded systems, and developing operating systems.
//           Key Types or Categories: Cs data types include int, float, char, and pointers. Its use of arrays, structures, and unions provides powerful tools for memory and data management.C supports low-level operations like bit manipulation and memory allocation using functions such as malloc() and free(). Core libraries like stdio.h and math.h extend functionality.
//           Applications and Use Cases: C is the backbone of operating systems like Linux, firmware for embedded devices, and performance-critical applications like game engines.C offers advanced memory management techniques and assembly code integration. Tools like GCC and Makefiles optimize C development.'''
//     },
//     {
//       'title': 'JavaScript',
//       'icon': 'assets/javascript.png',
//       'overview':
//           'JavaScript is a high-level, interpreted programming language widely used for creating dynamic web applications. It powers interactive features on websites and integrates seamlessly with HTML and CSS.',
//       'content':
//           '''JavaScript Overview: JavaScript is a high-level, interpreted programming language widely used for creating dynamic web applications. It powers interactive features on websites and integrates seamlessly with HTML and CSS.
//           Key Types or Categories: JavaScript supports data types like strings, numbers, and objects. Frameworks like React, Angular, and Vue enhance its functionality for building complex user interfaces.JavaScript provides operations for DOM manipulation, event handling, and asynchronous programming using promises and async/await.
//           Applications and Use Cases: JavaScript is vital for front-end development, building interactive features like form validation, and powering single-page applications (SPAs).Advanced JavaScript concepts include closures, prototype inheritance, and modules. Tools like Node.js and Webpack extend JavaScript to back-end development and build optimization.'''
//     },
//     {
//       'title': 'Flutter',
//       'icon': 'assets/mobile-development.png',
//       'overview':
//           'Flutter is a modern, open-source UI toolkit created by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. Its reactive programming model and rich widget library enable seamless development of visually appealing, high-performance apps.',
//       'content':
//           '''Flutter Overview: Flutter is a modern, open-source UI toolkit created by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. Its reactive programming model and rich widget library enable seamless development of visually appealing, high-performance apps.
//           Key Types or Categories: Flutters primary components include stateless and stateful widgets, layouts like Column and Row, and interactive widgets such as Buttons and TextFields. Flutters Material and Cupertino libraries support cross-platform UI design for Android and iOS.Flutter leverages the Dart programming language and provides widgets like GestureDetector for user interaction, FutureBuilder for asynchronous operations, and Navigator for routing between screens.
//           Applications and Use Cases: Flutter is widely used in mobile app development, enabling rapid prototyping and deployment for apps like e-commerce platforms, chat applications, and social media tools.Advanced Flutter concepts include animations, state management tools like Provider and Riverpod, and integration with native platform APIs using platform channels.'''
//     },
//     {
//       'title': 'Data Science',
//       'icon': 'assets/data-science.png',
//       'overview':
//           'Data Science is the interdisciplinary field that uses scientific methods, algorithms, and tools to extract meaningful insights from structured and unstructured data. It combines statistics, programming, and domain expertise.',
//       'content':
//           '''Data Science Overview: Data Science is the interdisciplinary field that uses scientific methods, algorithms, and tools to extract meaningful insights from structured and unstructured data. It combines statistics, programming, and domain expertise.
//           Key Types or Categories: Key components of data science include data preprocessing, exploratory data analysis (EDA), and machine learning. Tools like Pandas, NumPy, and visualization libraries like Matplotlib facilitate data manipulation and representation.Data Science workflows involve data cleaning, feature engineering, and model training using tools like Scikit-learn and TensorFlow. Statistical tests and predictive analytics play crucial roles.
//           Applications and Use Cases: Applications include customer segmentation, fraud detection, predictive maintenance, and recommendation systems across industries like finance, healthcare, and e-commerce.Advanced topics: Advanced topics include deep learning, reinforcement learning, and big data processing using Apache Spark and Hadoop.'''
//     },
//     {
//       'title': 'Machine Learning',
//       'icon': 'assets/machine_learning.png',
//       'overview':
//           'Machine Learning (ML) is a subset of artificial intelligence where algorithms improve their performance by learning patterns from data. It powers predictive analytics, automation, and intelligent decision-making.',
//       'content':
//           '''Machine Learning Overview: Machine Learning (ML) is a subset of artificial intelligence where algorithms improve their performance by learning patterns from data. It powers predictive analytics, automation, and intelligent decision-making.
//           Key Types or Categories: ML includes supervised learning (e.g., classification, regression), unsupervised learning (e.g., clustering, dimensionality reduction), and reinforcement learning for decision optimization.Core ML processes involve training, validating, and testing models. Tools like Scikit-learn, TensorFlow, and PyTorch support these tasks, enabling tasks like image recognition and natural language processing.
//           Applications and Use Cases: ML applications range from recommendation engines and fraud detection to autonomous vehicles and personalized healthcare.Advanced ML concepts include neural networks, transfer learning, and generative models. Tools like Keras and Hugging Face specialize in deep learning and NLP.'''
//     },
//     {
//       'title': 'Cybersecurity',
//       'icon': 'assets/cyber-security.png',
//       'overview':
//           'Cybersecurity is the practice of protecting systems, networks, and data from digital attacks. It encompasses tools, processes, and strategies to ensure confidentiality, integrity, and availability of information.',
//       'content':
//           '''Cybersecurity Overview: Cybersecurity is the practice of protecting systems, networks, and data from digital attacks. It encompasses tools, processes, and strategies to ensure confidentiality, integrity, and availability of information.
//           Key Types or Categories: Key areas include network security, application security, and endpoint protection. Technologies like firewalls, intrusion detection systems (IDS), and antivirus software are critical.Core operations involve vulnerability assessment, penetration testing, and incident response. Tools like Wireshark, Metasploit, and SIEM systems support these processes.
//           Applications and Use Cases: Cybersecurity is vital in safeguarding sensitive data in sectors like banking, healthcare, and government.Advanced topics include cryptography, ethical hacking, and zero-trust architecture. Certifications like CISSP and tools like Splunk are valuable for professionals.'''
//     },
//     {
//       'title': 'Blockchain',
//       'icon': 'assets/bitcoin.png',
//       'overview':
//           'Blockchain is a decentralized, distributed ledger technology that records transactions across a network of computers. It underpins cryptocurrencies and ensures transparency and security.',
//       'content':
//           '''Blockchain Overview: Blockchain is a decentralized, distributed ledger technology that records transactions across a network of computers. It underpins cryptocurrencies and ensures transparency and security.
//           Key Types or Categorie :Blockchains include public (Bitcoin, Ethereum), private (Hyperledger), and hybrid networks, each suited for specific use cases like cryptocurrencies, supply chain management, and enterprise solutions.Core functions include transaction validation, consensus mechanisms (e.g., proof of work, proof of stake), and smart contracts for automated processes.
//           Applications and Use Cases :Blockchain applications extend to digital currencies, decentralized finance (DeFi), and supply chain transparency.Advanced blockchain topics include interoperability, Layer-2 scaling, and privacy coins. Tools like Solidity and Web3.js facilitate development.'''
//     },
//     {
//       'title': 'UI/UX Design',
//       'icon': 'assets/ux-design.png',
//       'overview':
//           'UI/UX Design focuses on creating intuitive, visually appealing, and user-centric digital interfaces. UI emphasizes aesthetics, while UX prioritizes usability and user satisfaction.',
//       'content':
//           '''UI/UX Design Overview: UI/UX Design focuses on creating intuitive, visually appealing, and user-centric digital interfaces. UI emphasizes aesthetics, while UX prioritizes usability and user satisfaction.
//           Key Types or Categories:UI elements include typography, color schemes, and layout designs. UX involves user research, wireframing, and usability testing.Design tools like Adobe XD, Figma, and Sketch enable UI/UX creation. Processes include prototyping, user feedback collection, and iterative improvements.
//           Applications and Use Cases: UI/UX design is critical in app development, website creation, and software interfaces to ensure user engagement and satisfaction.Advanced design includes motion design, accessibility features, and design systems. Tools like Framer and Axure enhance prototyping.'''
//     },
//     {
//       'title': 'Cloud Computing',
//       'icon': 'assets/server.png',
//       'overview':
//           'Cloud computing delivers computing services such as storage, databases, networking, and software over the internet. It eliminates the need for physical hardware, offering scalability, cost-efficiency, and flexibility.',
//       'content':
//           '''Cloud Computing Overview: Cloud computing delivers computing services such as storage, databases, networking, and software over the internet. It eliminates the need for physical hardware, offering scalability, cost-efficiency, and flexibility.
//           Key Types or Categories: Cloud services are categorized as IaaS (Infrastructure as a Service), PaaS (Platform as a Service), and SaaS (Software as a Service). Deployment models include public, private, and hybrid clouds.Core operations involve virtual machine provisioning, data storage, and service scaling. Tools like AWS, Microsoft Azure, and Google Cloud Platform (GCP) manage and automate these tasks.
//           Applications and Use Cases: Applications include hosting websites, big data analytics, and disaster recovery. Cloud computing is fundamental in powering AI, IoT, and mobile applications.Advanced topics include serverless computing, edge computing, and containerization using Kubernetes and Docker.'''
//     },
//     {
//       'title': 'DevOps',
//       'icon': 'assets/devops.png',
//       'overview':
//           'DevOps integrates development and operations teams to streamline the software development lifecycle. It emphasizes collaboration, automation, and continuous delivery for faster, more reliable software deployment.',
//       'content':
//           '''DevOps Overview: DevOps integrates development and operations teams to streamline the software development lifecycle. It emphasizes collaboration, automation, and continuous delivery for faster, more reliable software deployment.
//           Key Types or Categories: Core DevOps practices include CI/CD (Continuous Integration/Continuous Deployment), Infrastructure as Code (IaC), and monitoring. Tools like Jenkins, Ansible, and Prometheus are pivotal.DevOps operations encompass automated testing, deployment pipelines, and version control using Git. Configuration management tools ensure consistency across environments.
//           Applications and Use Cases: DevOps accelerates software releases and reduces downtime. Industries like fintech and e-commerce use DevOps for agile delivery and high system availability.Advanced DevOps involves container orchestration with Kubernetes, microservices architecture, and cloud-native application management.'''
//     },
//     {
//       'title': 'Game Development',
//       'icon': 'assets/game-development.png',
//       'overview':
//           'Game development involves designing, programming, and creating video games. It combines storytelling, graphics, and interactivity, pushing the boundaries of technology and creativity.',
//       'content':
//           '''Game Development Overview: Game development involves designing, programming, and creating video games. It combines storytelling, graphics, and interactivity, pushing the boundaries of technology and creativity.
//           Key Types or Categories: Game types include 2D and 3D games, mobile games, and console games. Engines like Unity and Unreal Engine provide frameworks for game creation.Game development involves asset creation, physics simulation, and character scripting. Tools like Blender for modeling and C# for Unity scripting are widely used.
//           Applications and Use Cases: Applications include entertainment, educational games, and simulations. Game developers also create immersive VR and AR experiences.Advanced game development explores procedural content generation, AI for NPCs, and optimization techniques for rendering performance.'''
//     },
//     {
//       'title': 'Mobile App Development',
//       'icon': 'assets/mobile-development.png',
//       'overview':
//           'Mobile app development focuses on building applications for mobile devices, leveraging platform-specific features for optimized user experiences.',
//       'content':
//           '''Mobile App Development Overview: Mobile app development focuses on building applications for mobile devices, leveraging platform-specific features for optimized user experiences.
//           Key Types or Categories: Mobile apps include native (iOS, Android), hybrid, and cross-platform apps. Technologies like Swift, Kotlin, and frameworks like Flutter and React Native enable their creation.Core tasks include UI design, API integration, and performance optimization. IDEs like Android Studio and Xcode streamline the development process.
//           Applications and Use Cases: Applications range from social networking and e-commerce to fitness tracking and entertainment apps.Advanced topics include app security, offline functionality, and integrating technologies like AR and IoT.'''
//     },
//     {
//       'title': 'Software Testing',
//       'icon': 'assets/testing.png',
//       'overview':
//           'Software testing ensures the reliability, security, and performance of software. It identifies bugs and verifies that applications meet specified requirements.',
//       'content':
//           '''Software Testing Overview: Software testing ensures the reliability, security, and performance of software. It identifies bugs and verifies that applications meet specified requirements.
//           Key Types or Categories: Testing types include manual, automated, functional, and non-functional testing. Frameworks like Selenium and JUnit support automated testing.Testing operations involve writing test cases, executing tests, and analyzing results. Continuous testing integrates with CI/CD pipelines for faster delivery.
//           Applications and Use Cases: Applications include ensuring software quality in web, mobile, and enterprise systems. Testing is critical in industries like healthcare and finance for compliance.Advanced testing involves performance testing using JMeter, security testing, and exploratory testing.'''
//     },
//     {
//       'title': 'Digital Marketing',
//       'icon': 'assets/bullhorn.png',
//       'overview':
//           'Digital marketing uses online platforms to promote products and services, engaging target audiences through various digital channels.',
//       'content':
//           '''Digital Marketing Overview: Digital marketing uses online platforms to promote products and services, engaging target audiences through various digital channels.
//           Key Types or Categories: Categories include content marketing, search engine optimization (SEO), social media marketing, and pay-per-click (PPC) advertising.Digital marketing operations involve creating content, managing campaigns, and analyzing metrics using tools like Google Analytics and HubSpot.
//           Applications and Use Cases: Applications include brand promotion, lead generation, and customer retention. Industries from retail to tech rely on digital marketing for competitive advantage.Advanced techniques involve AI-driven personalization, marketing automation, and performance tracking with A/B testing.'''
//     },
//     {
//       'title': 'Artificial Intelligence',
//       'icon': 'assets/ai.png',
//       'overview':
//           'Artificial Intelligence (AI) enables machines to simulate human intelligence through learning, reasoning, and problem-solving.',
//       'content':
//           '''Artificial Intelligence Overview: Artificial Intelligence (AI) enables machines to simulate human intelligence through learning, reasoning, and problem-solving.
//           Key Types or Categories: AI includes machine learning, natural language processing (NLP), and computer vision. Frameworks like TensorFlow and PyTorch support its development.AI tasks involve training models, building chatbots, and automating decision-making processes. Neural networks and deep learning algorithms are central.
//           Applications and Use Cases: Applications include virtual assistants, predictive analytics, and autonomous vehicles.Advanced AI topics cover reinforcement learning, GANs (Generative Adversarial Networks), and ethical AI.'''
//     },
//     {
//       'title': 'Augmented Reality',
//       'icon': 'assets/virtual-tour.png',
//       'overview':
//           'Augmented reality (AR) overlays digital information onto the real world, enhancing user interaction through immersive experiences.',
//       'content':
//           '''Augmented Reality Overview: Augmented Reality (AR) overlays digital content onto the real world, enhancing user interaction through immersive experiences.
//           Key Types or Categories: AR types include marker-based, markerless, and projection-based AR. Tools like ARKit and ARCore enable development for iOS and Android devices.AR development involves 3D modeling, spatial mapping, and integrating AR SDKs for real-time rendering and interactivity.
//           Applications and Use Cases: Applications include gaming, e-commerce, and education. AR enables virtual try-ons, simulations, and training programs.Advanced AR explores mixed reality, SLAM (Simultaneous Localization and Mapping), and haptic feedback integration.'''
//     },
//     {
//       'title': 'Web Development',
//       'icon': 'assets/coding.png',
//       'overview':
//           'Web development builds websites and web applications for internet and intranet use. It combines programming, design, and user experience.',
//       'content':
//           '''Web Development Overview: Web development builds websites and web applications for internet and intranet use. It combines programming, design, and user experience.
//           Key Types or Categories:Web development includes front-end, back-end, and full-stack development. Languages like HTML, CSS, and JavaScript power the front-end, while frameworks like Django and Node.js support the back-end.Key operations involve coding, testing, and deploying web apps. Web development tools include IDEs, version control systems, and debugging tools.
//           Applications and Use Cases: Web development powers e-commerce platforms, social networks, and content management systems.Advanced web development: includes responsive design, progressive web apps (PWAs), and API integration.'''
//     },
//     {
//       'title': 'SQL Databases',
//       'icon': 'assets/sql.png',
//       'overview':
//           'SQL databases store and manage structured data using SQL (Structured Query Language). They ensure data consistency and integrity in applications.',
//       'content':
//           '''SQL Databases Overview: SQL databases store and manage structured data using SQL (Structured Query Language). They ensure data consistency and integrity in applications.
//           Key Types or Categories: Relational databases like MySQL, PostgreSQL, and Oracle are prominent. Variations include in-memory databases and distributed databases.Core SQL operations include data querying, manipulation, and indexing. Commands like SELECT, INSERT, and JOIN retrieve and modify data efficiently.
//           Applications and Use Cases: SQL databases support e-commerce, financial systems, and content management. They are vital for applications requiring structured data.Advanced SQL involves query optimization, stored procedures, and using ORMs (Object-Relational Mappers) like Hibernate.'''
//     },
//   ];

//   List<Map<String, String>> featuredSkills = [];
//   List<Map<String, String>> remainingSkills = [];
//   String searchQuery = "";
//   List<Map<String, String>> filteredSkills = [];
//   OverlayEntry? searchOverlay;
//   final LayerLink layerLink = LayerLink();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//     _fetchRecommendations();
//     _randomizeSkills();
//     _getRandomSkills(skills, 5);
//   }

//   Future<void> _initializePage() async {
//     await _fetchUserName(); // Fetch username first
//     _fetchRecommendations(); // Fetch recommendations
//     _randomizeSkills(); // Randomize skills
//     _speakPageIntroOnEnter(); // Speak the welcome message with icon info
//   }

//   void _randomizeSkills() {
//     final random = Random();
//     final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
//     featuredSkills = shuffled.take(5).toList();
//     remainingSkills = shuffled.skip(5).toList();
//     filteredSkills = List.from(remainingSkills);
//   }

// //   void _randomizeSkills() {
// //   final random = Random();

// //   // Make sure "Python" is always in the list
// //   final List<Map<String, String>> shuffled = List<Map<String, String>>.from(skills)..shuffle(random);

// //   // Find the "Python" skill and ensure it's included in the featured list
// //   final pythonSkill = shuffled.firstWhere(
// //     (skill) => skill['name'] == 'Python',
// //     orElse: () => null
// //   );

// //   if (pythonSkill != null) {
// //     shuffled.remove(pythonSkill);
// //   }

// //   // Add "Python" as the first element
// //   featuredSkills = [pythonSkill] + shuffled.take(4).toList();
// //   remainingSkills = shuffled.skip(4).toList();
// //   filteredSkills = List.from(remainingSkills);
// // }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));
//       if (response.statusCode == 200) {
//         setState(() {
//           userName = json.decode(response.body)['name'];
//         });
//       } else {
//         setState(() {
//           userName = "User";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         userName = "User";
//       });
//     }
//   }

//   Future<void> _fetchRecommendations() async {
//     try {
//       final response = await http.post(
//         Uri.parse(recommendationsApi),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );
//       if (response.statusCode == 200) {
//         setState(() {
//           recommendations = json.decode(response.body)['recommendations'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = "Failed to load recommendations.";
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = "Error connecting to recommendations service.";
//         isLoading = false;
//       });
//     }
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       filteredSkills = remainingSkills
//           .where((skill) =>
//               skill['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//     if (query.isNotEmpty) {
//       _showSearchDropdown();
//       _speak("Searching for $query.");
//     } else {
//       _removeSearchDropdown();
//     }
//   }

//   void _showSearchDropdown() {
//     if (searchOverlay != null) {
//       _removeSearchDropdown();
//     }
//     searchOverlay = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: MediaQuery.of(context).size.width - 32,
//           child: CompositedTransformFollower(
//             link: layerLink,
//             offset: const Offset(0, 60),
//             showWhenUnlinked: false,
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: filteredSkills.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       filteredSkills[index]['title']!,
//                       style: const TextStyle(fontFamily: 'Poppins'),
//                     ),
//                     onTap: () {
//                       print("Selected: ${filteredSkills[index]['title']}");
//                       _removeSearchDropdown();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     Overlay.of(context).insert(searchOverlay!);
//   }

//   void _removeSearchDropdown() {
//     searchOverlay?.remove();
//     searchOverlay = null;
//   }

//   @override
//   void dispose() {
//     _removeSearchDropdown();
//     super.dispose();
//   }

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   Future<void> _openCourseUrl(String url) async {
//     try {
//       final uri = Uri.parse(url); // Parse the URL
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       } else {
//         // Notify the user if the URL cannot be opened
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Cannot open URL: $url")),
//         );
//       }
//     } catch (e) {
//       // Handle any exceptions
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error opening URL: ${e.toString()}")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'Poppins'),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.volume_up,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _speakPageIntro, // Call the new function
//             ),
//             IconButton(
//               icon: const Icon(Icons.account_circle,
//                   color: Color(0xFF0F3870), size: 36),
//               onPressed: _navigateToProfilePage,
//             ),
//           ],
//           leading: IconButton(
//             icon:
//                 const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
//             onPressed: () {
//               _showSidebar(context);
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi ${userName ?? "User"}!",
//                   style: const TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const Text(
//                   "Good morning",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CompositedTransformTarget(
//                   link: layerLink,
//                   child: TextField(
//                     onChanged: _updateSearch,
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border:
//                         Border.all(color: const Color(0xFF21324B), width: 2),
//                     borderRadius: BorderRadius.circular(12),
//                     color: const Color(0xFFF7F9FC),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             "Take this test to assess and \nfind out your skills.",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           backgroundColor: const Color(0xFF0F3870),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Take Test",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Featured Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 //
//                 const SizedBox(height: 10),
//                 // SingleChildScrollView(
//                 //     scrollDirection: Axis.horizontal,
//                 //     child: Row(
//                 //       children: skills.map((skill) {
//                 //         return buildCategoryCard(
//                 //           context,
//                 //           skill['icon']!,
//                 //           skill['title']!,
//                 //           widget.email, // Pass the user's email dynamically
//                 //           skill['overview']!, // Pass the overview dynamically
//                 //         );
//                 //       }).toList(),
//                 //     ),
//                 //   ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: _getRandomSkills(skills, 5).map((skill) {
//                       return buildCategoryCard(
//                         context,
//                         skill['icon']!,
//                         skill['title']!,
//                         widget.email, // Pass the user's email dynamically
//                         skill['overview']!,
//                         skill['content']!, // Pass the overview dynamically
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Recommendations",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 if (isLoading)
//                   const Center(child: CircularProgressIndicator())
//                 else if (errorMessage != null)
//                   Center(
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 else if (recommendations.isEmpty)
//                   const Center(
//                     child: Text(
//                       "No recommendations available.",
//                     ),
//                   )
//                 else
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: recommendations.map((course) {
//                         return GestureDetector(
//                           onTap: () => _openCourseUrl(course["course_url"]),
//                           child: buildRecommendationCard(
//                             course["course_name"],
//                             course["course_description"],
//                             course["course_rating"],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: const Color(0xFF0A368D), // Dark blue background
//           currentIndex: _currentIndex, // Highlights the selected tab
//           selectedItemColor: Colors.white, // Highlighted item color
//           unselectedItemColor: Colors.grey, // Unselected item color
//           onTap: _onNavigationTap, // Handle tab taps
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.alarm), // Reminder icon
//               label: "Reminders",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home), // Home icon
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.leaderboard), // Leaderboard icon
//               label: "Leaderboard",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Map<String, String>> _getRandomSkills(
//       List<Map<String, String>> skills, int count) {
//     List<Map<String, String>> shuffledSkills = List.from(skills);
//     shuffledSkills.shuffle(); // Shuffle the list
//     return shuffledSkills.take(count).toList(); // Take the first 'count' items
//   }

//   Widget buildCategoryCard(BuildContext context, String imagePath, String title,
//       String email, String overview, String content) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AssessmentPage(
//               title: title,
//               email: email,
//               overview: overview,
//               content: content,
//             ),
//           ),
//         );
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//               color: const Color.fromARGB(255, 240, 246, 255),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRecommendationCard(
//       String title, String description, dynamic rating) {
//     return Container(
//       height: 180,
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: const Color.fromARGB(255, 240, 246, 255),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: const TextStyle(
//                 fontSize: 12,
//                 color: Colors.black,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const Spacer(),
//             Text(
//               "Rating: $rating",
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:evalora/Services/SpeechToTextServices.dart';
import 'package:evalora/frontend/pages/analyticspg.dart';
import 'package:evalora/frontend/pages/assessment.dart';
import 'package:evalora/frontend/pages/categories.dart';
import 'package:evalora/frontend/pages/chatbot.dart';
import 'package:evalora/frontend/pages/leaderboard.dart';
import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:evalora/frontend/pages/profile.dart';
import 'package:evalora/frontend/pages/reminders.dart';
import 'package:evalora/frontend/pages/settings.dart';
import 'package:evalora/frontend/pages/studyplan.dart';
import 'package:evalora/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

import 'package:vibration/vibration.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(email: "john@gmail.com"),
  ));
}

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String recommendationsApi =
      "http://10.0.2.2:5001/generate-recommendations";
  final String userApi = "http://10.0.2.2:5000/get-user";
  final SpeechToTextService _speechService = SpeechToTextService();
  bool _isListening = false;
  String recognizedText = "";
  String searchQuery = "";
  bool _isSidebarOpen = false;
  final FlutterTts flutterTts = FlutterTts(); // Initialize TTS

  void _speakPageIntro() {
    Vibration.vibrate();
    final String welcomeMessage = "Good morning, ${userName ?? "User"}!";

    // Sidebar details
    const String sidebarMessage =
        "There is a sidebar menu on the top left corner. "
        "The sidebar includes options like Analytics, Feedbacks, Reminders, "
        "Leaderboard, Settings, Exam Categories, and AI Assistant.";

    // Featured categories
    final String featuredCategoriesMessage =
        "Here are your featured categories: "
        "${featuredSkills.map((skill) => skill['title']).join(", ")}, and more.";

    // Recommendations
    final String recommendationsMessage = recommendations.isNotEmpty
        ? "Here are some recommended courses: " +
            recommendations.map((course) => course["course_name"]).join(", ")
        : "No recommendations available at the moment.";

    // Combine all messages
    final String pageIntro =
        "$welcomeMessage $sidebarMessage $featuredCategoriesMessage $recommendationsMessage";

    // Speak the message
    _speak(pageIntro);
  }

  void _speakPageIntroOnEnter() {
    final String welcomeMessage =
        "Good morning, ${userName ?? "User"}! The speaker icon is in the top right corner, left of the user profile icon.";

    // Combine the greeting sections
    final String pageIntro = "$welcomeMessage";

    // Speak the message using TTS
    _speak(pageIntro);
  }

  Future<void> _speak(String text) async {
    try {
      await flutterTts.speak(text); // Speak the provided text
    } catch (e) {
      debugPrint("Error in TTS: $e");
    }
  }

  void _hideSidebar() {
    setState(() {
      _isSidebarOpen = false;
    });
    // Your existing code to hide the sidebar
  }

  @override
  void initState() {
    super.initState();
    _fetchUserName();
    _initializeSpeechService();
    _fetchRecommendations();
    _randomizeSkills();
    _getRandomSkills(skills, 5);
  }

  // Initialize Speech-to-Text
  void _initializeSpeechService() async {
    bool available = await _speechService.initialize();
    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition unavailable.")),
      );
    }
  }

  // Start listening for voice commands
  void _startListening() {
    setState(() {
      _isListening = true; // Show mic is active
    });

    _speechService.startListening((recognizedWords) {
      print('Recognized words: $recognizedWords'); // Debugging log

      if (recognizedWords.isNotEmpty) {
        recognizedText += " $recognizedWords"; // Keep appending words
      }

      // Use a short delay before stopping, to ensure full command is captured
      Future.delayed(const Duration(seconds: 2), () {
        _stopListening();
        _processCommand(
            recognizedText.trim().toLowerCase()); // Process after delay
        recognizedText = ""; // Clear for next recognition
      });
    });
  }

  // Stop listening
  void _stopListening() {
    _speechService.stopListening();
    setState(() {
      _isListening = false;
    });
  }

  // Process recognized voice commands
  void _processCommand(String command) {
    command = command.trim().toLowerCase(); // Normalize input

    print("Processing command: $command"); // Debugging log

    if (command.contains("search")) {
      String query = command.replaceFirst("search", "").trim();
      if (query.isNotEmpty) {
        setState(() {
          searchQuery = query;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Searching for: $query")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please specify a search query.")),
        );
      }
    } else if (command.contains("test")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Take Test triggered!")),
      );
    } else if (command.contains("sidebar")) {
      _showSidebar(context); // Open Sidebar
    } else if (command.contains("reminders") ||
        command.contains("open reminders")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Navigating to Reminders...")),
      );

      // Navigate to the Reminders (CalendarScreen) page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CalendarScreen(email: widget.email),
        ),
      );
    } else if (command.contains("profile") ||
        command.contains("open profile")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Navigating to Profile...")),
      );

      // Navigate to the Profile page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(email: widget.email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unrecognized command: $command")),
      );
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
              onTap: () {
                Vibration.vibrate(duration: 100);
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
                      userName ?? "User", // Replace with current user's name
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
                    _buildSidebarItem(context, Icons.feedback, "Feedbacks"),
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
        Vibration.vibrate(duration: 100);
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
                builder: (context) => CalendarScreen(email: widget.email)),
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

  List<dynamic> recommendations = [];
  bool isLoading = true;
  String? errorMessage;
  String? userName;
  int _currentIndex = 1; // Default selected tab is Home.

  void _onNavigationTap(int index) {
    Vibration.vibrate(duration: 100);
    if (_currentIndex == index) {
      // If already on the current tab, do nothing.
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    // Navigate to the selected page
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CalendarScreen(email: widget.email), // Pass email
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(email: widget.email),
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StudyPlanGenerator(
                email: widget.email), // Pass email dynamically
          ),
        );

        break;
    }
  }

  final List<Map<String, String>> skills = [
    {
      'title': 'python'.tr(),
      'icon': 'assets/python (1).png',
      'overview': 'python_overview'.tr(),
      'content': 'content_Python'.tr()
    },
    {
      'title': 'java'.tr(),
      'icon': 'assets/java.png',
      'overview': 'java_overview'.tr(),
      'content': 'content_Java'.tr()
    },
    {
      'title': 'c_programming'.tr(),
      'icon': 'assets/c-sharp.png',
      'overview': 'c_programming_overview'.tr(),
      'content': 'content_C_Programming'.tr()
    },
    {
      'title': 'javascript'.tr(),
      'icon': 'assets/javascript.png',
      'overview': 'javascript_overview'.tr(),
      'content': 'content_JavaScript'.tr()
    },
    {
      'title': 'flutter'.tr(),
      'icon': 'assets/mobile-development.png',
      'overview': 'flutter_overview'.tr(),
      'content': 'content_Flutter'.tr()
    },
    {
      'title': 'data_science'.tr(),
      'icon': 'assets/data-science.png',
      'overview': 'data_science_overview'.tr(),
      'content': 'content_Data_Science'.tr()
    },
    {
      'title': 'machine_learning'.tr(),
      'icon': 'assets/machine_learning.png',
      'overview': 'machine_learning_overview'.tr(),
      'content': 'content_Machine_Learning'.tr()
    },
    {
      'title': 'cybersecurity'.tr(),
      'icon': 'assets/cyber-security.png',
      'overview': 'cybersecurity_overview'.tr(),
      'content': 'content_Cybersecurity'.tr()
    },
    {
      'title': 'blockchain'.tr(),
      'icon': 'assets/bitcoin.png',
      'overview': 'blockchain_overview'.tr(),
      'content': 'content_Blockchain'.tr()
    },
    {
      'title': 'ui_ux_design'.tr(),
      'icon': 'assets/ux-design.png',
      'overview': 'ui_ux_design_overview'.tr(),
      'content': 'content_ui_UX_Design'.tr()
    },
    {
      'title': 'cloud_computing'.tr(),
      'icon': 'assets/server.png',
      'overview': 'cloud_computing_overview'.tr(),
      'content': 'content_Cloud_Computing'.tr()
    },
    {
      'title': 'devops'.tr(),
      'icon': 'assets/devops.png',
      'overview': 'devops_overview'.tr(),
      'content': 'content_DevOps'.tr()
    },
    {
      'title': 'game_development'.tr(),
      'icon': 'assets/game-development.png',
      'overview': 'game_development_overview'.tr(),
      'content': 'content_Game_Development'.tr()
    },
    {
      'title': 'mobile_app_development'.tr(),
      'icon': 'assets/mobile-development.png',
      'overview': 'mobile_app_development_overview'.tr(),
      'content': 'content_Mobile_App_Development'.tr()
    },
    {
      'title': 'software_testing'.tr(),
      'icon': 'assets/testing.png',
      'overview': 'software_testing_overview'.tr(),
      'content': 'content_Software_Testing'.tr()
    },
    {
      'title': 'digital_marketing'.tr(),
      'icon': 'assets/bullhorn.png',
      'overview': 'digital_marketing_overview'.tr(),
      'content': 'content_Digital_Marketing'.tr()
    },
    {
      'title': 'artificial_intelligence'.tr(),
      'icon': 'assets/ai.png',
      'overview': 'artificial_intelligence_overview'.tr(),
      'content': 'content_Artificial_Intelligence'.tr()
    },
    {
      'title': 'augmented_reality'.tr(),
      'icon': 'assets/virtual-tour.png',
      'overview': 'augmented_reality_overview'.tr(),
      'content': 'content_Augmented_Reality'.tr()
    },
    {
      'title': 'web_development'.tr(),
      'icon': 'assets/coding.png',
      'overview': 'web_development_overview'.tr(),
      'content': 'content_Web_Development'.tr()
    },
    {
      'title': 'sql_databases'.tr(),
      'icon': 'assets/sql.png',
      'overview': 'sql_databases_overview'.tr(),
      'content': 'content_SQL_Databases'.tr()
    }
  ];
  List<Map<String, String>> featuredSkills = [];
  List<Map<String, String>> remainingSkills = [];
  // String searchQuery = "";
  List<Map<String, String>> filteredSkills = [];
  OverlayEntry? searchOverlay;
  final LayerLink layerLink = LayerLink();

  @override
  @override
  @override
  // void initState() {
  //   super.initState();
  //   _initializePage();
  // }

  Future<void> _initializePage() async {
    await _fetchUserName(); // Fetch username first
    _fetchRecommendations(); // Fetch recommendations
    _randomizeSkills(); // Randomize skills
    _speakPageIntroOnEnter(); // Speak the welcome message with icon info
  }

  void _randomizeSkills() {
    final random = Random();
    final shuffled = List<Map<String, String>>.from(skills)..shuffle(random);
    featuredSkills = shuffled.take(5).toList();
    remainingSkills = shuffled.skip(5).toList();
    filteredSkills = List.from(remainingSkills);
  }

  Future<void> _fetchUserName() async {
    try {
      final response =
          await http.get(Uri.parse('$userApi?email=${widget.email}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userName = data['name']; // Assign fetched name
        });
        _speak(
            "Welcome to the Home page, ${userName ?? "User"}!"); // Dynamic greeting
      } else {
        setState(() {
          userName = "User"; // Fallback if fetching name fails
        });
        _speak("Welcome to the Home page, User!");
      }
    } catch (e) {
      setState(() {
        userName = "User"; // Fallback if there is an error
      });
      _speak("An error occurred. Welcome to the Home page, User!");
    }
  }

  Future<void> _fetchRecommendations() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse(recommendationsApi),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': widget.email}),
      );

      if (response.statusCode == 200) {
        setState(() {
          recommendations = json.decode(response.body)['recommendations'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load recommendations: ${response.body}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error connecting to recommendations service: $e";
        isLoading = false;
      });
    }
  }

  void _updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredSkills = remainingSkills
          .where((skill) =>
              skill['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    if (query.isNotEmpty) {
      _showSearchDropdown();
      _speak("Searching for $query.");
    } else {
      _removeSearchDropdown();
    }
  }

  void _showSearchDropdown() {
    if (searchOverlay != null) {
      _removeSearchDropdown();
    }
    searchOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: const Offset(0, 60),
            showWhenUnlinked: false,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(8),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: filteredSkills.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredSkills[index]['title']!,
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                    onTap: () {
                      print("Selected: ${filteredSkills[index]['title']}");
                      _removeSearchDropdown();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(searchOverlay!);
  }

  void _removeSearchDropdown() {
    searchOverlay?.remove();
    searchOverlay = null;
  }

  @override
  void dispose() {
    _removeSearchDropdown();
    super.dispose();
  }

  void _navigateToProfilePage() {
    Vibration.vibrate();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(email: widget.email),
      ),
    );
  }

  Future<void> _openCourseUrl(String url) async {
    try {
      final uri = Uri.parse(url); // Parse the URL
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Notify the user if the URL cannot be opened
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Cannot open URL: $url")),
        );
      }
    } catch (e) {
      // Handle any exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error opening URL: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: _isListening ? Colors.red : Color(0xFF0F3870),
                size: 36,
              ),
              onPressed: () {
                Vibration.vibrate();
                if (_isListening) {
                  _stopListening();
                } else {
                  _startListening();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.volume_up,
                  color: Color(0xFF0F3870), size: 36),
              onPressed: _speakPageIntro, // Call the new function
            ),
            IconButton(
              icon: const Icon(Icons.account_circle,
                  color: Color(0xFF0F3870), size: 36),
              onPressed: _navigateToProfilePage,
            ),
          ],
          leading: IconButton(
            icon:
                const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
            onPressed: () {
              _showSidebar(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi ${userName ?? "User"}!",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Good morning",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                CompositedTransformTarget(
                  link: layerLink,
                  child: TextField(
                    onChanged: _updateSearch,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF21324B), width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFF7F9FC),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Take this test to assess and \nfind out your skills.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          backgroundColor: const Color(0xFF0F3870),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Take Test",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Featured Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getRandomSkills(skills, 5).map((skill) {
                      return buildCategoryCard(
                        context,
                        skill['icon']!,
                        skill['title']!,
                        widget.email, // Pass the user's email dynamically
                        skill['overview']!,
                        skill['content']!, // Pass the overview dynamically
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Recommendations",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (errorMessage != null)
                  Center(
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                else if (recommendations.isEmpty)
                  const Center(
                    child: Text(
                      "No recommendations available.",
                    ),
                  )
                else
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: recommendations.map((course) {
                        return GestureDetector(
                          onTap: () {
                            Vibration.vibrate();
                            _speak(
                                "Course description: ${course["course_description"]}");
                            _openCourseUrl(course["course_url"]);
                          },
                          child: buildRecommendationCard(
                            course["course_name"],
                            course["course_description"],
                            course["course_rating"],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF0A368D), // Dark blue background
          currentIndex: _currentIndex, // Highlights the selected tab
          selectedItemColor: Colors.white, // Highlighted item color
          unselectedItemColor: Colors.grey, // Unselected item color
          onTap: _onNavigationTap, // Handle tab taps
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm), // Reminder icon
              label: "Reminders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Home icon
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book), // Leaderboard icon
              label: "Studyplan",
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> _getRandomSkills(
      List<Map<String, String>> skills, int count) {
    List<Map<String, String>> shuffledSkills = List.from(skills);
    shuffledSkills.shuffle(); // Shuffle the list
    return shuffledSkills.take(count).toList(); // Take the first 'count' items
  }

  Widget buildCategoryCard(BuildContext context, String imagePath, String title,
      String email, String overview, String content) {
    return GestureDetector(
      onTap: () {
        Vibration.vibrate();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssessmentPage(
              title: title,
              email: email,
              overview: overview,
              content: content,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              color: const Color.fromARGB(255, 240, 246, 255),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommendationCard(
      String title, String description, dynamic rating) {
    return Container(
      height: 180,
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 240, 246, 255),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String>(
              future: translateText(context, title),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    "Title...",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    "Error: ${snapshot.error}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Text(
                    snapshot.data.toString() ?? "Translation failed",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                }
              },
            ),
            // Text(
            //   //title,
            //   '${await title.translate(to: 'hi')}',
            //   style: const TextStyle(
            //     fontSize: 14,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            const SizedBox(height: 8),
            FutureBuilder<String>(
              future: translateText(context, description),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    "...",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    "Error: ${snapshot.error}",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Text(
                    snapshot.data.toString() ?? "Translation failed",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                }
              },
            ),
            // Text(
            //   description,
            //   style: const TextStyle(
            //     fontSize: 12,
            //     color: Colors.black,
            //   ),
            //   maxLines: 3,
            //   overflow: TextOverflow.ellipsis,
            // ),
            const Spacer(),
            Text(
              "Rating: $rating",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
