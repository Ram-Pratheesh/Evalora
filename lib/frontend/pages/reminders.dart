// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// import 'leaderboard.dart'; // Dummy leaderboard page

// class CalendarApp extends StatelessWidget {
//   final String email; // Accept email dynamically for user context

//   const CalendarApp({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CalendarScreen(email: email),
//     );
//   }
// }

// class CalendarScreen extends StatefulWidget {
//   final String email; // Pass email to dynamically navigate

//   const CalendarScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _selectedDate = DateTime.now();
//   Map<DateTime, List<String>> _events = {};
//   int _currentIndex = 0; // Default selected tab is Reminders.

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
//             builder: (context) => CalendarApp(email: widget.email),
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
//             builder: (context) => LeaderboardPage(),
//           ),
//         );
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.grid_view,
//             color: const Color(0xFF0A368D),
//             size: 32,
//           ),
//         ),
//         title: const Text(
//           'Calendar',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.person_outline,
//               color: Colors.black,
//               size: 40,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: TableCalendar(
//                   focusedDay: _selectedDate,
//                   firstDay: DateTime(2020),
//                   lastDay: DateTime(2030),
//                   calendarFormat: _calendarFormat,
//                   selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
//                   onDaySelected: (selectedDay, focusedDay) {
//                     setState(() {
//                       _selectedDate = selectedDay;
//                     });
//                   },
//                   eventLoader: (date) => _events[date] ?? [],
//                   headerStyle: HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                     titleTextStyle: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                   calendarStyle: const CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedTextStyle: TextStyle(color: Colors.blue),
//                     defaultTextStyle: TextStyle(color: Colors.white),
//                     weekendTextStyle: TextStyle(color: Colors.white),
//                   ),
//                   daysOfWeekStyle: const DaysOfWeekStyle(
//                     weekendStyle: TextStyle(color: Colors.white),
//                     weekdayStyle: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Reminders',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 200,
//                       child: _selectedDateEvents(),
//                     ),
//                     const SizedBox(height: 8),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: _showAddScheduleDialog,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(25),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: const Text(
//                             'Add one!',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white, // White background
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.black, // Black selected icon
//         unselectedItemColor: Colors.grey, // Grey unselected icon
//         onTap: _onNavigationTap,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.alarm),
//             label: "Reminders",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.leaderboard),
//             label: "Leaderboard",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _selectedDateEvents() {
//     List<String> events = _events[_selectedDate] ?? [];
//     if (events.isEmpty) {
//       return const Center(
//         child: Text(
//           'No Reminders',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontFamily: 'Poppins',
//           ),
//         ),
//       );
//     }
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (context, index) => Container(
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF0A368D),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               events[index],
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () => _deleteEvent(index),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAddScheduleDialog() {
//     final TextEditingController _eventController = TextEditingController();
//     TimeOfDay? _selectedTime;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: const Color(0xFFEBF1FD),
//           title: const Text(
//             'Add Schedule',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               color: Colors.black,
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _eventController,
//                 decoration: InputDecoration(
//                   labelText: 'We will remind you when it\'s time',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(
//                       width: 2,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   _selectedTime = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4567AC),
//                 ),
//                 child: const Text(
//                   'Pick a Time',
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (_eventController.text.isNotEmpty && _selectedTime != null) {
//                   final String event =
//                       '${_eventController.text} at ${_selectedTime!.format(context)}';
//                   setState(() {
//                     _events[_selectedDate] = [
//                       ..._events[_selectedDate] ?? [],
//                       event,
//                     ];
//                   });
//                   Navigator.pop(context);
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteEvent(int index) {
//     setState(() {
//       _events[_selectedDate]?.removeAt(index);
//     });
//   }
// }

//test 2

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// import 'homepage.dart'; // Home page with email navigation
// import 'leaderboard.dart'; // Dummy leaderboard page
// import 'profile.dart'; // Profile page

// class CalendarApp extends StatelessWidget {
//   final String email; // Accept email dynamically for user context

//   const CalendarApp({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CalendarScreen(email: email),
//     );
//   }
// }

// class CalendarScreen extends StatefulWidget {
//   final String email; // Pass email to dynamically navigate

//   const CalendarScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _selectedDate = DateTime.now();
//   Map<DateTime, List<String>> _events = {};
//   int _currentIndex = 0; // Default selected tab is Reminders.

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
//             builder: (context) => CalendarApp(email: widget.email),
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
//             builder: (context) => const LeaderboardPage(),
//           ),
//         );
//         break;
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
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.grid_view,
//             color: const Color(0xFF0A368D),
//             size: 32,
//           ),
//         ),
//         title: const Text(
//           'Calendar',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           GestureDetector(
//             onTap: _navigateToProfilePage, // Navigate to Profile page
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.account_circle,
//                 color: const Color(0xFF0F3870),
//                 size: 36, // Profile circle icon
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: TableCalendar(
//                   focusedDay: _selectedDate,
//                   firstDay: DateTime(2020),
//                   lastDay: DateTime(2030),
//                   calendarFormat: _calendarFormat,
//                   selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
//                   onDaySelected: (selectedDay, focusedDay) {
//                     setState(() {
//                       _selectedDate = selectedDay;
//                     });
//                   },
//                   eventLoader: (date) => _events[date] ?? [],
//                   headerStyle: HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                     titleTextStyle: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                   calendarStyle: const CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedTextStyle: TextStyle(color: Colors.blue),
//                     defaultTextStyle: TextStyle(color: Colors.white),
//                     weekendTextStyle: TextStyle(color: Colors.white),
//                   ),
//                   daysOfWeekStyle: const DaysOfWeekStyle(
//                     weekendStyle: TextStyle(color: Colors.white),
//                     weekdayStyle: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Reminders',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 200,
//                       child: _selectedDateEvents(),
//                     ),
//                     const SizedBox(height: 8),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: _showAddScheduleDialog,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(25),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: const Text(
//                             'Add one!',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white, // White background
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.black, // Black selected icon
//         unselectedItemColor: Colors.grey, // Grey unselected icon
//         onTap: _onNavigationTap,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.alarm),
//             label: "Reminders",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.leaderboard),
//             label: "Leaderboard",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _selectedDateEvents() {
//     List<String> events = _events[_selectedDate] ?? [];
//     if (events.isEmpty) {
//       return const Center(
//         child: Text(
//           'No Reminders',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontFamily: 'Poppins',
//           ),
//         ),
//       );
//     }
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (context, index) => Container(
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF0A368D),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               events[index],
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () => _deleteEvent(index),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAddScheduleDialog() {
//     final TextEditingController _eventController = TextEditingController();
//     TimeOfDay? _selectedTime;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: const Text(
//             'Add Schedule',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               color: Colors.black,
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _eventController,
//                 decoration: InputDecoration(
//                   labelText: 'We will remind you when it\'s time',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       width: 6,
//                       color: Color.fromARGB(255, 8, 54, 122),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   _selectedTime = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 9, 43, 113),
//                 ),
//                 child: const Text(
//                   'Pick a Time',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (_eventController.text.isNotEmpty && _selectedTime != null) {
//                   final String event =
//                       '${_eventController.text} at ${_selectedTime!.format(context)}';
//                   setState(() {
//                     _events[_selectedDate] = [
//                       ..._events[_selectedDate] ?? [],
//                       event,
//                     ];
//                   });
//                   Navigator.pop(context);
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteEvent(int index) {
//     setState(() {
//       _events[_selectedDate]?.removeAt(index);
//     });
//   }
// }

// test 3
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:http/http.dart' as http;

// import 'homepage.dart'; // Home page with email navigation
// import 'leaderboard.dart'; // Dummy leaderboard page
// import 'profile.dart'; // Profile page

// class CalendarApp extends StatelessWidget {
//   final String email;

//   const CalendarApp({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CalendarScreen(email: email),
//     );
//   }
// }

// class CalendarScreen extends StatefulWidget {
//   final String email;

//   const CalendarScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _selectedDate = DateTime.now();
//   Map<DateTime, List<String>> _events = {};
//   int _currentIndex = 0;

//   final String baseUrl = "http://10.0.2.2:5000";

//   @override
//   void initState() {
//     super.initState();
//     _fetchReminders();
//   }

//   void _onNavigationTap(int index) {
//     if (_currentIndex == index) return;

//     setState(() {
//       _currentIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CalendarApp(email: widget.email),
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
//             builder: (context) => const LeaderboardPage(),
//           ),
//         );
//         break;
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

//   Future<void> _fetchReminders() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/get-reminders?email=${widget.email}'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['reminders'];
//         setState(() {
//           _events = {
//             for (var reminder in data)
//               DateTime.parse(reminder['date']): [
//                 ..._events[DateTime.parse(reminder['date'])] ?? [],
//                 reminder['content']
//               ]
//           };
//         });
//       } else {
//         throw Exception('Failed to fetch reminders');
//       }
//     } catch (e) {
//       print("Error fetching reminders: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Error fetching reminders')),
//       );
//     }
//   }

//   Future<void> _addReminder(String content, DateTime date) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/add-reminder'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'email': widget.email, // The logged-in user's email
//           'date': date.toIso8601String(), // ISO 8601 date string
//           'content': content, // Reminder content
//         }),
//       );

//       if (response.statusCode == 201) {
//         setState(() {
//           _events[date] = [..._events[date] ?? [], content];
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Reminder added successfully')),
//         );
//       } else {
//         print(
//             'Server responded with: ${response.statusCode}, ${response.body}');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to add reminder: ${response.body}')),
//         );
//       }
//     } catch (e) {
//       print("Error adding reminder: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Error adding reminder')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.grid_view,
//             color: const Color(0xFF0A368D),
//             size: 32,
//           ),
//         ),
//         title: const Text(
//           'Calendar',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           GestureDetector(
//             onTap: _navigateToProfilePage,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.account_circle,
//                 color: const Color(0xFF0F3870),
//                 size: 36,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: TableCalendar(
//                   focusedDay: _selectedDate,
//                   firstDay: DateTime(2020),
//                   lastDay: DateTime(2030),
//                   calendarFormat: _calendarFormat,
//                   selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
//                   onDaySelected: (selectedDay, focusedDay) {
//                     setState(() {
//                       _selectedDate = selectedDay;
//                     });
//                   },
//                   eventLoader: (date) => _events[date] ?? [],
//                   headerStyle: HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                     titleTextStyle: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                   calendarStyle: const CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedTextStyle: TextStyle(color: Colors.blue),
//                     defaultTextStyle: TextStyle(color: Colors.white),
//                     weekendTextStyle: TextStyle(color: Colors.white),
//                   ),
//                   daysOfWeekStyle: const DaysOfWeekStyle(
//                     weekendStyle: TextStyle(color: Colors.white),
//                     weekdayStyle: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Reminders',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 200,
//                       child: _selectedDateEvents(),
//                     ),
//                     const SizedBox(height: 8),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: _showAddScheduleDialog,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(25),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: const Text(
//                             'Add one!',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         onTap: _onNavigationTap,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.alarm),
//             label: "Reminders",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.leaderboard),
//             label: "Leaderboard",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _selectedDateEvents() {
//     List<String> events = _events[_selectedDate] ?? [];
//     if (events.isEmpty) {
//       return const Center(
//         child: Text(
//           'No Reminders',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontFamily: 'Poppins',
//           ),
//         ),
//       );
//     }
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (context, index) => Container(
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF0A368D),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               events[index],
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () => _deleteEvent(index),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAddScheduleDialog() {
//     final TextEditingController _eventController = TextEditingController();
//     TimeOfDay? _selectedTime;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: const Text(
//             'Add Schedule',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               color: Colors.black,
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _eventController,
//                 decoration: InputDecoration(
//                   labelText: 'We will remind you when it\'s time',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       width: 6,
//                       color: Color.fromARGB(255, 8, 54, 122),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   _selectedTime = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 9, 43, 113),
//                 ),
//                 child: const Text(
//                   'Pick a Time',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (_eventController.text.isNotEmpty && _selectedTime != null) {
//                   final String event =
//                       '${_eventController.text} at ${_selectedTime!.format(context)}';
//                   _addReminder(event, _selectedDate);
//                   Navigator.pop(context);
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteEvent(int index) {
//     setState(() {
//       _events[_selectedDate]?.removeAt(index);
//     });
//   }
// }

//test 4
// import 'dart:convert';
// import 'package:coderaiders/frontend/pages/homepage.dart';
// import 'package:coderaiders/frontend/pages/leaderboard.dart';
// import 'package:coderaiders/frontend/pages/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:http/http.dart' as http;

// class CalendarApp extends StatelessWidget {
//   final String email;

//   const CalendarApp({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CalendarScreen(email: email),
//     );
//   }
// }

// class CalendarScreen extends StatefulWidget {
//   final String email;

//   const CalendarScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _selectedDate = DateTime.now();
//   Map<DateTime, List<String>> _events = {};
//   int _currentIndex = 0;

//   final String baseUrl = "http://10.0.2.2:5000";

//   @override
//   void initState() {
//     super.initState();
//     _fetchReminders(); // Fetch reminders when the page loads for the first time
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _fetchReminders(); // Refetch reminders whenever the page is rebuilt
//   }

//   void _onNavigationTap(int index) {
//     if (_currentIndex == index) return;

//     setState(() {
//       _currentIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CalendarApp(email: widget.email),
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
//             builder: (context) => const LeaderboardPage(),
//           ),
//         );
//         break;
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

//   Future<void> _fetchReminders() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/get-reminders?email=${widget.email}'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['reminders'];
//         setState(() {
//           _events = {
//             for (var reminder in data)
//               DateTime.parse(reminder['date']): [
//                 ..._events[DateTime.parse(reminder['date'])] ?? [],
//                 reminder['content'],
//               ]
//           };
//         });
//       } else {
//         throw Exception('Failed to fetch reminders');
//       }
//     } catch (e) {
//       print("Error fetching reminders: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Error fetching reminders')),
//       );
//     }
//   }

//   Future<void> _addReminder(String content, DateTime date) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/add-reminder'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'email': widget.email,
//           'date': date.toIso8601String(),
//           'content': content,
//         }),
//       );

//       if (response.statusCode == 201) {
//         setState(() {
//           _events[date] = [..._events[date] ?? [], content];
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Reminder added successfully')),
//         );
//       } else {
//         throw Exception('Failed to add reminder');
//       }
//     } catch (e) {
//       print("Error adding reminder: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Error adding reminder')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.grid_view,
//             color: const Color(0xFF0A368D),
//             size: 32,
//           ),
//         ),
//         title: const Text(
//           'Calendar',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           GestureDetector(
//             onTap: _navigateToProfilePage,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.account_circle,
//                 color: const Color(0xFF0F3870),
//                 size: 36,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: TableCalendar(
//                   focusedDay: _selectedDate,
//                   firstDay: DateTime(2020),
//                   lastDay: DateTime(2030),
//                   calendarFormat: _calendarFormat,
//                   selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
//                   onDaySelected: (selectedDay, focusedDay) {
//                     setState(() {
//                       _selectedDate = selectedDay;
//                     });
//                   },
//                   eventLoader: (date) => _events[date] ?? [],
//                   headerStyle: HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                     titleTextStyle: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                   calendarStyle: const CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedTextStyle: TextStyle(color: Colors.blue),
//                     defaultTextStyle: TextStyle(color: Colors.white),
//                     weekendTextStyle: TextStyle(color: Colors.white),
//                   ),
//                   daysOfWeekStyle: const DaysOfWeekStyle(
//                     weekendStyle: TextStyle(color: Colors.white),
//                     weekdayStyle: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0A368D),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Reminders',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 200,
//                       child: _selectedDateEvents(),
//                     ),
//                     const SizedBox(height: 8),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: _showAddScheduleDialog,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(25),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: const Text(
//                             'Add one!',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         onTap: _onNavigationTap,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.alarm),
//             label: "Reminders",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.leaderboard),
//             label: "Leaderboard",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _selectedDateEvents() {
//     List<String> events = _events[_selectedDate] ?? [];
//     if (events.isEmpty) {
//       return const Center(
//         child: Text(
//           'No Reminders',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontFamily: 'Poppins',
//           ),
//         ),
//       );
//     }
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (context, index) => Container(
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF0A368D),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               events[index],
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () => _deleteEvent(index),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAddScheduleDialog() {
//     final TextEditingController _eventController = TextEditingController();
//     TimeOfDay? _selectedTime;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.8, // Increased width
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Add Schedule',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: _eventController,
//                     decoration: InputDecoration(
//                       labelText: 'We will remind you when it\'s time',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           _selectedTime = await showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               const Color.fromARGB(255, 9, 43, 113),
//                         ),
//                         child: const Text(
//                           'Pick a Time',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Cancel'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           if (_eventController.text.isNotEmpty &&
//                               _selectedTime != null) {
//                             final String event =
//                                 '${_eventController.text} at ${_selectedTime!.format(context)}';
//                             _addReminder(event, _selectedDate);
//                             Navigator.pop(context);
//                           }
//                         },
//                         child: const Text('Add'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _deleteEvent(int index) {
//     setState(() {
//       _events[_selectedDate]?.removeAt(index);
//     });
//   }
// }

// test 5 pass works

import 'dart:convert';

import 'package:evalora/frontend/pages/analyticspg.dart';
import 'package:evalora/frontend/pages/categories.dart';
import 'package:evalora/frontend/pages/chatbot.dart';
import 'package:evalora/frontend/pages/homepage.dart';
import 'package:evalora/frontend/pages/leaderboard.dart';
import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:evalora/frontend/pages/profile.dart';
import 'package:evalora/frontend/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class CalendarApp extends StatelessWidget {
  final String email;

  const CalendarApp({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(email: email),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  final String email;

  const CalendarScreen({Key? key, required this.email}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String? userName;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<String>> _events = {};
  int _currentIndex = 0;

  final String baseUrl = "http://10.0.2.2:5000";
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

                    // Logout Button
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
                builder: (context) => CalendarScreen(email: widget.email)),
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
    _fetchReminders();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchReminders();
  }

  void _onNavigationTap(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CalendarApp(email: widget.email),
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
            builder: (context) => const LeaderboardPage(),
          ),
        );
        break;
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

  Future<void> _fetchReminders() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/get-reminders?email=${widget.email}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['reminders'];
        setState(() {
          _events = {
            for (var reminder in data)
              DateTime.parse(reminder['date']): [
                ..._events[DateTime.parse(reminder['date'])] ?? [],
                reminder['content'],
              ]
          };
        });
      } else {
        throw Exception('Failed to fetch reminders');
      }
    } catch (e) {
      print("Error fetching reminders: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error fetching reminders')),
      );
    }
  }

  Future<void> _addReminder(String content, DateTime date) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add-reminder'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': widget.email,
          'date': date.toIso8601String(),
          'content': content,
        }),
      );

      if (response.statusCode == 201) {
        setState(() {
          _events[date] = [..._events[date] ?? [], content];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reminder added successfully')),
        );
      } else {
        throw Exception('Failed to add reminder');
      }
    } catch (e) {
      print("Error adding reminder: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding reminder')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon:
                const Icon(Icons.grid_view, color: Color(0xFF0F3870), size: 32),
            onPressed: () {
              _showSidebar(context);
            },
          ),
        ),
        title: const Text(
          'Reminder',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: _navigateToProfilePage,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle,
                color: const Color(0xFF0F3870),
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A368D),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TableCalendar(
                  focusedDay: _selectedDate,
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                  eventLoader: (date) => _events[date] ?? [],
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.blue),
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.white),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.white),
                    weekdayStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0A368D),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reminders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 200,
                      child: _selectedDateEvents(),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: _showAddScheduleDialog,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Add one!',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onNavigationTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: "Reminders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Leaderboard",
          ),
        ],
      ),
    );
  }

  Widget _selectedDateEvents() {
    List<String> events = _events[_selectedDate] ?? [];
    if (events.isEmpty) {
      return const Center(
        child: Text(
          'No Reminders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF0A368D),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              events[index],
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEvent(index),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddScheduleDialog() {
    final TextEditingController _eventController = TextEditingController();
    TimeOfDay? _selectedTime;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8, // Increased width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Schedule',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _eventController,
                    decoration: InputDecoration(
                      labelText: 'We will remind you when it\'s time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          _selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 9, 43, 113),
                        ),
                        child: const Text(
                          'Pick a Time',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(), // Push Cancel and Add buttons to the right
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_eventController.text.isNotEmpty &&
                              _selectedTime != null) {
                            final String event =
                                '${_eventController.text} at ${_selectedTime!.format(context)}';
                            _addReminder(event, _selectedDate);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _deleteEvent(int index) {
    setState(() {
      _events[_selectedDate]?.removeAt(index);
    });
  }
}
