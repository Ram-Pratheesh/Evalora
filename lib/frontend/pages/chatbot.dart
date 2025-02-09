// import 'package:flutter/material.dart';
// import 'api_service.dart'; // Import the API Service

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, String>> _chatMessages =
//       []; // Start with an empty chat

//   final Map<int, bool> _likeStatus = {}; // Track thumbs-up/down

//   final ApiService apiService = ApiService();

//   void _sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _chatMessages
//             .add({"sender": "user", "message": _messageController.text});
//       });

//       try {
//         final botResponse =
//             await apiService.sendMessage(_messageController.text);
//         setState(() {
//           _chatMessages.add({"sender": "bot", "message": botResponse});
//         });
//       } catch (error) {
//         setState(() {
//           _chatMessages.add({
//             "sender": "bot",
//             "message": "Error: Unable to connect to backend."
//           });
//         });
//       }

//       _messageController.clear();
//     }
//   }

//   void _handleThumbsUp(int index) {
//     setState(() {
//       _likeStatus[index] = true;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "Happy to help! Let me know if there's anything else I can assist you with. 😊"
//       });
//     });
//   }

//   void _handleThumbsDown(int index) {
//     setState(() {
//       _likeStatus[index] = false;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "I'm sorry the response didn't meet your expectations. Could you tell me what went wrong or what you'd like instead?"
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 163, 190, 248),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Gradient Header with AppBar elements
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 163, 190, 248),
//                     Color.fromARGB(255, 0, 39, 121)
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     title: const Text(
//                       "Chatbot",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     centerTitle: true,
//                     leading: IconButton(
//                       icon: const Icon(Icons.grid_view),
//                       onPressed: () {
//                         // Handle grid button action
//                       },
//                     ),
//                     actions: [
//                       IconButton(
//                         icon: const Icon(Icons.account_circle),
//                         onPressed: () {
//                           // Handle profile button action
//                         },
//                       ),
//                     ],
//                   ),
//                   // AI Assistant Header Section
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 8.0), // Adjusted padding
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Color(0xFF7B2CBF),
//                                 shape: BoxShape.circle,
//                               ),
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset(
//                                 'assets/bot.png', // Add your bot image here
//                                 width: 30,
//                                 height: 30,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             const Text(
//                               "AI Assistant",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 2),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const SizedBox(width: 44), // Adjusted spacing
//                             Container(
//                               width: 10,
//                               height: 10,
//                               decoration: const BoxDecoration(
//                                 color: Colors.green,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             const Text(
//                               "Online",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 14),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Chat messages
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _chatMessages.length,
//                 itemBuilder: (context, index) {
//                   final message = _chatMessages[index];
//                   final isBot = message["sender"] == "bot";
//                   return Align(
//                     alignment:
//                         isBot ? Alignment.centerLeft : Alignment.centerRight,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8.0, horizontal: 16.0),
//                       child: Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           // Message box
//                           Container(
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: isBot
//                                   ? Colors.white
//                                   : const Color(0xFF0A368D),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: const Radius.circular(12.0),
//                                 topRight: const Radius.circular(12.0),
//                                 bottomLeft: isBot
//                                     ? const Radius.circular(0)
//                                     : const Radius.circular(12.0),
//                                 bottomRight: isBot
//                                     ? const Radius.circular(12.0)
//                                     : const Radius.circular(0),
//                               ),
//                             ),
//                             child: Text(
//                               message["message"]!,
//                               style: TextStyle(
//                                 color: isBot ? Colors.black : Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           // Reaction Icons
//                           if (isBot)
//                             Positioned(
//                               bottom: -10,
//                               right: -10,
//                               child: Container(
//                                 width: 60,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFF7B2CBF),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () => _handleThumbsUp(index),
//                                       child: Icon(
//                                         Icons.thumb_up,
//                                         size: 12,
//                                         color: _likeStatus[index] == true
//                                             ? Colors.blue
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () => _handleThumbsDown(index),
//                                       child: Icon(
//                                         Icons.thumb_down,
//                                         size: 12,
//                                         color: _likeStatus[index] == false
//                                             ? Colors.blue
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                           content: Text(
//                                               "Message copied to clipboard"),
//                                         ));
//                                       },
//                                       child: const Icon(
//                                         Icons.copy,
//                                         size: 12,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           // Bot image in message
//                           if (isBot)
//                             Positioned(
//                               bottom: -10,
//                               left: -20,
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF7B2CBF),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'assets/bot.png', // Add your bot image here
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                               ),
//                             ),
//                           // User icon
//                           if (!isBot)
//                             const Positioned(
//                               bottom: -10,
//                               right: -20,
//                               child: CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: Colors.white,
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 18,
//                                   color: Color(0xFF0A368D),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Message input
//             Container(
//               color: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       style: const TextStyle(color: Colors.black),
//                       decoration: const InputDecoration(
//                         hintText: "Type your message here...",
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Color(0xFF0A368D)),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'api_service.dart'; // Import the API Service
// import 'profile.dart'; // Import the Profile Page

// class ChatScreen extends StatefulWidget {
//   final String email;

//   const ChatScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, String>> _chatMessages = [];
//   final Map<int, bool> _likeStatus = {};
//   final ApiService apiService = ApiService();

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
//   }

//   void _sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _chatMessages
//             .add({"sender": "user", "message": _messageController.text});
//       });

//       try {
//         final botResponse =
//             await apiService.sendMessage(_messageController.text);
//         setState(() {
//           _chatMessages.add({"sender": "bot", "message": botResponse});
//         });
//       } catch (error) {
//         setState(() {
//           _chatMessages.add({
//             "sender": "bot",
//             "message": "Error: Unable to connect to backend."
//           });
//         });
//       }

//       _messageController.clear();
//     }
//   }

//   void _handleThumbsUp(int index) {
//     setState(() {
//       _likeStatus[index] = true;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "Happy to help! Let me know if there's anything else I can assist you with. 😊"
//       });
//     });
//   }

//   void _handleThumbsDown(int index) {
//     setState(() {
//       _likeStatus[index] = false;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "I'm sorry the response didn't meet your expectations. Could you tell me what went wrong or what you'd like instead?"
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 163, 190, 248),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             "Chatbot",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
//           onPressed: () {
//             // Add any functionality for the sidebar here if required
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("Sidebar is not implemented here!")),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle,
//                 color: Color(0xFF0F3870), size: 36),
//             onPressed: _navigateToProfilePage,
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Chat messages
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _chatMessages.length,
//                 itemBuilder: (context, index) {
//                   final message = _chatMessages[index];
//                   final isBot = message["sender"] == "bot";
//                   return Align(
//                     alignment:
//                         isBot ? Alignment.centerLeft : Alignment.centerRight,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8.0, horizontal: 16.0),
//                       child: Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           // Message box
//                           Container(
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: isBot
//                                   ? Colors.white
//                                   : const Color(0xFF0A368D),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: const Radius.circular(12.0),
//                                 topRight: const Radius.circular(12.0),
//                                 bottomLeft: isBot
//                                     ? const Radius.circular(0)
//                                     : const Radius.circular(12.0),
//                                 bottomRight: isBot
//                                     ? const Radius.circular(12.0)
//                                     : const Radius.circular(0),
//                               ),
//                             ),
//                             child: Text(
//                               message["message"]!,
//                               style: TextStyle(
//                                 color: isBot ? Colors.black : Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           // Reaction Icons
//                           if (isBot)
//                             Positioned(
//                               bottom: -10,
//                               right: -10,
//                               child: Container(
//                                 width: 60,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFF7B2CBF),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () => _handleThumbsUp(index),
//                                       child: Icon(
//                                         Icons.thumb_up,
//                                         size: 12,
//                                         color: _likeStatus[index] == true
//                                             ? Colors.blue
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () => _handleThumbsDown(index),
//                                       child: Icon(
//                                         Icons.thumb_down,
//                                         size: 12,
//                                         color: _likeStatus[index] == false
//                                             ? Colors.blue
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                           content: Text(
//                                               "Message copied to clipboard"),
//                                         ));
//                                       },
//                                       child: const Icon(
//                                         Icons.copy,
//                                         size: 12,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           // Bot image in message
//                           if (isBot)
//                             Positioned(
//                               bottom: -10,
//                               left: -20,
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF7B2CBF),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'assets/bot.png', // Add your bot image here
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                               ),
//                             ),
//                           // User icon
//                           if (!isBot)
//                             const Positioned(
//                               bottom: -10,
//                               right: -20,
//                               child: CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: Colors.white,
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 18,
//                                   color: Color(0xFF0A368D),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Message input
//             Container(
//               color: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       style: const TextStyle(color: Colors.black),
//                       decoration: const InputDecoration(
//                         hintText: "Type your message here...",
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Color(0xFF0A368D)),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:coderaiders/frontend/pages/analyticspg.dart';
// import 'package:coderaiders/frontend/pages/categories.dart';
// import 'package:coderaiders/frontend/pages/leaderboard.dart';
// import 'package:coderaiders/frontend/pages/loginpg.dart';
// import 'package:coderaiders/frontend/pages/reminders.dart';
// import 'package:coderaiders/frontend/pages/settings.dart';
// import 'package:flutter/material.dart';
// import 'api_service.dart'; // Import the API Service
// import 'profile.dart'; // Import the Profile Page

// class ChatScreen extends StatefulWidget {
//   final String email;

//   const ChatScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   String? userName;
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, String>> _chatMessages = [];
//   final Map<int, bool> _likeStatus = {};
//   final ApiService apiService = ApiService();

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
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

//   void _sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _chatMessages
//             .add({"sender": "user", "message": _messageController.text});
//       });

//       try {
//         final botResponse =
//             await apiService.sendMessage(_messageController.text);
//         setState(() {
//           _chatMessages.add({"sender": "bot", "message": botResponse});
//         });
//       } catch (error) {
//         setState(() {
//           _chatMessages.add({
//             "sender": "bot",
//             "message": "Error: Unable to connect to backend."
//           });
//         });
//       }

//       _messageController.clear();
//     }
//   }

//   void _handleThumbsUp(int index) {
//     setState(() {
//       _likeStatus[index] = true;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "Happy to help! Let me know if there's anything else I can assist you with. 😊"
//       });
//     });
//   }

//   void _handleThumbsDown(int index) {
//     setState(() {
//       _likeStatus[index] = false;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "I'm sorry the response didn't meet your expectations. Could you tell me what went wrong or what you'd like instead?"
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 19, 56, 150),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             "Chatbot",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
//           onPressed: () {
//             _showSidebar(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle,
//                 color: Color(0xFF0F3870), size: 36),
//             onPressed: _navigateToProfilePage,
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Chat messages
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _chatMessages.length,
//                 itemBuilder: (context, index) {
//                   final message = _chatMessages[index];
//                   final isBot = message["sender"] == "bot";
//                   return Align(
//                     alignment:
//                         isBot ? Alignment.centerLeft : Alignment.centerRight,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8.0, horizontal: 16.0),
//                       child: Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           // Message box
//                           Container(
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: isBot
//                                   ? const Color.fromARGB(255, 255, 255, 255)
//                                   : const Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: const Radius.circular(12.0),
//                                 topRight: const Radius.circular(12.0),
//                                 bottomLeft: isBot
//                                     ? const Radius.circular(0)
//                                     : const Radius.circular(12.0),
//                                 bottomRight: isBot
//                                     ? const Radius.circular(12.0)
//                                     : const Radius.circular(0),
//                               ),
//                             ),
//                             child: Text(
//                               message["message"]!,
//                               style: TextStyle(
//                                 color: isBot
//                                     ? Colors.black
//                                     : const Color.fromARGB(255, 0, 0, 0),
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           // Reaction Icons
//                           if (isBot)
//                             Positioned(
//                               bottom: -10,
//                               right: -10,
//                               child: Container(
//                                 width: 60,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFF7B2CBF),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () => _handleThumbsUp(index),
//                                       child: Icon(
//                                         Icons.thumb_up,
//                                         size: 12,
//                                         color: _likeStatus[index] == true
//                                             ? Colors.blue
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () => _handleThumbsDown(index),
//                                       child: Icon(
//                                         Icons.thumb_down,
//                                         size: 12,
//                                         color: _likeStatus[index] == false
//                                             ? Colors.blue
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                           content: Text(
//                                               "Message copied to clipboard"),
//                                         ));
//                                       },
//                                       child: const Icon(
//                                         Icons.copy,
//                                         size: 12,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           // Bot image in message
//                           if (isBot)
//                             Positioned(
//                               bottom: -10,
//                               left: -20,
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF7B2CBF),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'assets/bot.png', // Add your bot image here
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                               ),
//                             ),
//                           // User icon
//                           if (!isBot)
//                             const Positioned(
//                               bottom: -10,
//                               right: -20,
//                               child: CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: Colors.white,
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 18,
//                                   color: Color(0xFF0A368D),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Message input
//             Container(
//               color: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       style: const TextStyle(color: Colors.black),
//                       decoration: const InputDecoration(
//                         hintText: "Type your message here...",
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Color(0xFF0A368D)),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:evalora/Services/SpeechToTextServices.dart';
import 'package:evalora/frontend/pages/analyticspg.dart';
import 'package:evalora/frontend/pages/categories.dart';
import 'package:evalora/frontend/pages/leaderboard.dart';
import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:evalora/frontend/pages/reminders.dart';
import 'package:evalora/frontend/pages/settings.dart';
import 'package:flutter/material.dart';
import 'api_service.dart'; // Import the API Service
import 'profile.dart'; // Import the Profile Page

class ChatScreen extends StatefulWidget {
  final String email;

  const ChatScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? userName;
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _chatMessages = [];
  final Map<int, bool> _likeStatus = {};
  final ApiService apiService = ApiService();
  final SpeechToTextService _speechToTextService =
      SpeechToTextService(); // Speech-to-Text Service instance
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initializeSpeechToText();
  }

  Future<void> _initializeSpeechToText() async {
    bool initialized = await _speechToTextService.initialize();
    if (!initialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech-to-Text initialization failed")),
      );
    }
  }

  void _toggleMessageListening() {
    if (_isListening) {
      _speechToTextService.stopListening();
      setState(() => _isListening = false);
    } else {
      _speechToTextService.startListening((recognizedText) {
        setState(() {
          _messageController.text = recognizedText;
        });
      });
      setState(() => _isListening = true);
    }
  }

  void _toggleNavigationListening() {
    if (_isListening) {
      _speechToTextService.stopListening();
      setState(() => _isListening = false);
    } else {
      _speechToTextService.startListening((recognizedText) {
        _handleNavigationCommand(recognizedText);
      });
      setState(() => _isListening = true);
    }
  }

  void _handleNavigationCommand(String command) {
    if (command.toLowerCase().contains("analytics")) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Analyticspg(email: widget.email)),
      );
    } else if (command.toLowerCase().contains("reminders")) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CalendarApp(email: widget.email)),
      );
    } else if (command.toLowerCase().contains("leaderboard")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LeaderboardPage()),
      );
    } else if (command.toLowerCase().contains("settings")) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsPage(email: widget.email)),
      );
    } else if (command.toLowerCase().contains("categories")) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoriesPage(email: widget.email)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Command not recognized")),
      );
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

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _chatMessages
            .add({"sender": "user", "message": _messageController.text});
      });

      try {
        final botResponse =
            await apiService.sendMessage(_messageController.text);
        setState(() {
          _chatMessages.add({"sender": "bot", "message": botResponse});
        });
      } catch (error) {
        setState(() {
          _chatMessages.add({
            "sender": "bot",
            "message": "Error: Unable to connect to backend."
          });
        });
      }

      _messageController.clear();
    }
  }

  void _handleThumbsUp(int index) {
    setState(() {
      _likeStatus[index] = true;
      _chatMessages.add({
        "sender": "bot",
        "message":
            "Happy to help! Let me know if there's anything else I can assist you with. 😊"
      });
    });
  }

  void _handleThumbsDown(int index) {
    setState(() {
      _likeStatus[index] = false;
      _chatMessages.add({
        "sender": "bot",
        "message":
            "I'm sorry the response didn't meet your expectations. Could you tell me what went wrong or what you'd like instead?"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 56, 150),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "Chatbot",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
          onPressed: () {
            _showSidebar(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
              color: _isListening ? Colors.red : const Color(0xFF0F3870),
              size: 32,
            ),
            onPressed: _toggleNavigationListening,
          ),
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Color(0xFF0F3870), size: 36),
            onPressed: _navigateToProfilePage,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Chat messages
            Expanded(
              child: ListView.builder(
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  final message = _chatMessages[index];
                  final isBot = message["sender"] == "bot";
                  return Align(
                    alignment:
                        isBot ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Message box
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: isBot
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(12.0),
                                topRight: const Radius.circular(12.0),
                                bottomLeft: isBot
                                    ? const Radius.circular(0)
                                    : const Radius.circular(12.0),
                                bottomRight: isBot
                                    ? const Radius.circular(12.0)
                                    : const Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              message["message"]!,
                              style: TextStyle(
                                color: isBot
                                    ? Colors.black
                                    : const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Reaction Icons
                          if (isBot)
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: Container(
                                width: 60,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7B2CBF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _handleThumbsUp(index),
                                      child: Icon(
                                        Icons.thumb_up,
                                        size: 12,
                                        color: _likeStatus[index] == true
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _handleThumbsDown(index),
                                      child: Icon(
                                        Icons.thumb_down,
                                        size: 12,
                                        color: _likeStatus[index] == false
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Message copied to clipboard"),
                                        ));
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          // Bot image in message
                          if (isBot)
                            Positioned(
                              bottom: -10,
                              left: -20,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFF7B2CBF),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/bot.png', // Add your bot image here
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          // User icon
                          if (!isBot)
                            const Positioned(
                              bottom: -10,
                              right: -20,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 18,
                                  color: Color(0xFF0A368D),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Message input
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Type your message here...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF0A368D)),
                    onPressed: _sendMessage,
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







// import 'package:flutter/material.dart';
// import 'api_service.dart'; // Import the API Service
// import 'profile.dart'; // Import the Profile Page
// import 'loginpg.dart'; // Import the Login Page
// import 'package:http/http.dart' as http; // Import for fetching user name
// import 'dart:convert'; // Import for JSON decoding

// class ChatScreen extends StatefulWidget {
//   final String email;

//   const ChatScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, String>> _chatMessages = [];
//   final Map<int, bool> _likeStatus = {};
//   final ApiService apiService = ApiService();
//   String? userName; // To store the user's name
//   final String userApi = "http://10.0.2.2:5000/get-user"; // Adjust endpoint URL

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserName();
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       final response =
//           await http.get(Uri.parse('$userApi?email=${widget.email}'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           userName = data['name']; // Update userName with fetched data
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

//   void _navigateToProfilePage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfilePage(email: widget.email),
//       ),
//     );
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
//                     // Display the dynamic user name
//                     Text(
//                       userName ?? "User",
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       widget.email,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Divider(color: Colors.grey),
//                     const SizedBox(height: 16),
//                     _buildSidebarItem(context, Icons.analytics, "Analytics"),
//                     _buildSidebarItem(context, Icons.feedback, "Feedbacks"),
//                     _buildSidebarItem(context, Icons.alarm, "Reminders"),
//                     _buildSidebarItem(
//                         context, Icons.leaderboard, "Leaderboard"),
//                     _buildSidebarItem(context, Icons.settings, "Settings"),
//                     _buildSidebarItem(context, Icons.smart_toy, "AI Assistant"),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()),
//                         );
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

//   Widget _buildSidebarItem(BuildContext context, IconData icon, String title) {
//     return GestureDetector(
//       onTap: () {
//         if (title == "AI Assistant") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ChatScreen(email: widget.email),
//             ),
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

//   void _sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _chatMessages
//             .add({"sender": "user", "message": _messageController.text});
//       });

//       try {
//         final botResponse =
//             await apiService.sendMessage(_messageController.text);
//         setState(() {
//           _chatMessages.add({"sender": "bot", "message": botResponse});
//         });
//       } catch (error) {
//         setState(() {
//           _chatMessages.add({
//             "sender": "bot",
//             "message": "Error: Unable to connect to backend."
//           });
//         });
//       }

//       _messageController.clear();
//     }
//   }

//   void _handleThumbsUp(int index) {
//     setState(() {
//       _likeStatus[index] = true;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "Happy to help! Let me know if there's anything else I can assist you with. 😊"
//       });
//     });
//   }

//   void _handleThumbsDown(int index) {
//     setState(() {
//       _likeStatus[index] = false;
//       _chatMessages.add({
//         "sender": "bot",
//         "message":
//             "I'm sorry the response didn't meet your expectations. Could you tell me what went wrong or what you'd like instead?"
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 19, 56, 150),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             "Chatbot",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.black,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
//           onPressed: () {
//             _showSidebar(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle,
//                 color: Color(0xFF0F3870), size: 36),
//             onPressed: _navigateToProfilePage,
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _chatMessages.length,
//                 itemBuilder: (context, index) {
//                   final message = _chatMessages[index];
//                   final isBot = message["sender"] == "bot";
//                   return Align(
//                     alignment:
//                         isBot ? Alignment.centerLeft : Alignment.centerRight,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8.0, horizontal: 16.0),
//                       child: Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: isBot
//                                   ? Colors.white
//                                   : const Color(0xFF0A368D),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               message["message"]!,
//                               style: TextStyle(
//                                 color: isBot ? Colors.black : Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Container(
//               color: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       style: const TextStyle(color: Colors.black),
//                       decoration: const InputDecoration(
//                         hintText: "Type your message here...",
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Color(0xFF0A368D)),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
