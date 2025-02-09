import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> topThreeUsers = [];
  bool isLoading = true;

  // Simulated logged-in user details
  final String loggedInUserName = "Kohli";
  final int loggedInUserPoints = 200;

  @override
  void initState() {
    super.initState();
    fetchLeaderboardData();
  }

  Future<void> fetchLeaderboardData() async {
    const connectionString =
        "mongodb+srv://ram:ram@nammadhaan.dw7ps.mongodb.net/sih";
    const collectionName = "sih1777";

    try {
      var db = await mongo.Db.create(connectionString);
      await db.open();

      var collection = db.collection(collectionName);
      var data = await collection.find().toList();

      setState(() {
        // Convert database entries to a list of maps
        users = List<Map<String, dynamic>>.from(data);

        // Sort users by points in descending order
        users.sort((a, b) => b['points'].compareTo(a['points']));

        // Assign positions to all users
        for (int i = 0; i < users.length; i++) {
          users[i]['position'] = i + 1;
        }

        // Extract the top 3 users for the bar graph
        topThreeUsers = users.take(3).toList();

        // Determine the logged-in user's actual position
        int userIndex =
            users.indexWhere((user) => user['name'] == loggedInUserName);
        Map<String, dynamic> loggedInUser = userIndex != -1
            ? users.removeAt(userIndex)
            : {
                'name': loggedInUserName,
                'points': loggedInUserPoints,
                'position': users.length + 1,
              };

        // Extract users from 4th to 9th position for the table
        users = users.skip(3).take(6).toList();

        // Add the logged-in user as the 10th row
        users.add(loggedInUser);

        isLoading = false;
      });

      await db.close();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  // Header and Graph Section
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(
                              255, 0, 48, 143), // Blue gradient at the top
                          Color.fromARGB(
                              255, 126, 167, 253), // Transition to white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white, size: 28),
                                onPressed: () {
                                  // Handle back navigation here
                                },
                              ),
                              const Text(
                                "LeaderBoard",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.account_circle,
                                    color: Colors.white, size: 28),
                                onPressed: () {
                                  // Handle profile navigation here
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Bar Graph Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: _buildBar(
                                context,
                                "3",
                                topThreeUsers.length > 2
                                    ? topThreeUsers[2]['points']
                                    : 0,
                                topThreeUsers.length > 2
                                    ? topThreeUsers[2]['name']
                                    : "",
                                avatarAbove: true,
                                height: 120,
                              ),
                            ),
                            Expanded(
                              child: _buildBar(
                                context,
                                "1",
                                topThreeUsers.isNotEmpty
                                    ? topThreeUsers[0]['points']
                                    : 0,
                                topThreeUsers.isNotEmpty
                                    ? topThreeUsers[0]['name']
                                    : "",
                                avatarAbove: true,
                                height: 160,
                              ),
                            ),
                            Expanded(
                              child: _buildBar(
                                context,
                                "2",
                                topThreeUsers.length > 1
                                    ? topThreeUsers[1]['points']
                                    : 0,
                                topThreeUsers.length > 1
                                    ? topThreeUsers[1]['name']
                                    : "",
                                avatarAbove: true,
                                height: 140,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Leaderboard Table Section
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 16.0), // Added bottom margin
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xFFEFEFFF),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:
                            BorderRadius.circular(16), // Curved corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            final isLoggedInUser =
                                user['name'] == loggedInUserName;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                decoration: isLoggedInUser
                                    ? BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 4, 49, 138),
                                            width: 2), // Black border
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      )
                                    : null, // No decoration for other users
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 8.0),
                                  leading: Text(
                                    "${user['position']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: InkWell(
                                    onTap: isLoggedInUser
                                        ? () {
                                            Navigator.pushNamed(
                                              context,
                                              '/newPage',
                                              arguments: {
                                                'name':
                                                    loggedInUserName, // Pass the logged-in user's name dynamically
                                                'position': user[
                                                    'position'], // Pass the position dynamically
                                              },
                                            );
                                            print("${user['name']} tapped!");
                                          }
                                        : null,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade200,
                                          child: Icon(
                                            Icons.account_circle,
                                            color: Colors.blue.shade800,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          user['name'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isLoggedInUser
                                                ? Colors.blue.shade800
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade800,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${user['points']} pts",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildBar(
      BuildContext context, String rank, double points, String name,
      {required double height, bool avatarAbove = false}) {
    return Column(
      children: [
        if (avatarAbove)
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child:
                Icon(Icons.account_circle, size: 40, color: Color(0xFF0A368D)),
          ),
        const SizedBox(height: 8),
        Container(
          height: height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 64, 137),
                Color.fromARGB(255, 145, 179, 251)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rank,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$points pts",
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
