import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String name; // Name passed from the previous page
  final int position; // Position passed from the previous page

  const NewPage({super.key, required this.name, required this.position});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0A368D), // Dark blue
                  Color(0xFFD6E1F8), // Light blue
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // AppBar Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 28),
                        onPressed: () {
                          Navigator.pop(context);
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
                          // Handle profile navigation
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Gradient Box Section
          Positioned(
            bottom: 0, // Align to the bottom
            left: MediaQuery.of(context).size.width * 0.1, // Gap on the left
            right: MediaQuery.of(context).size.width * 0.1, // Gap on the right
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Gradient box
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0A368D), // Dark blue
                        Color(0xFFD6E1F8), // Light blue
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                ),
                // Positioned Image (adjusted position)
                Positioned(
                  top: -250, // Adjusted to bring the image up
                  left: MediaQuery.of(context).size.width *
                      0.1, // Centered horizontally
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // Further increased width
                    height: MediaQuery.of(context).size.height *
                        0.35, // Further increased height
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/leader.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // Text below the image inside the gradient box
                Positioned(
                  bottom:
                      100, // Position the text above the bottom of the gradient box
                  left: MediaQuery.of(context).size.width *
                      0.1, // Align with the gradient box
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    children: [
                      const Text(
                        "You are in",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily:
                              'Poppins', // Set the font family to Poppins
                          fontWeight: FontWeight.w800, // Extra Bold weight
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "$position",
                          style: const TextStyle(
                            fontSize: 48,
                            fontFamily:
                                'Poppins', // Set the font family to Poppins
                            fontWeight: FontWeight.w800, // Extra Bold weight
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: getOrdinalSuffix(position),
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily:
                                    'Poppins', // Set the font family to Poppins
                                fontWeight:
                                    FontWeight.w800, // Extra Bold weight
                                color: Colors
                                    .white, // Ensure the color is consistent
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Position",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily:
                              'Poppins', // Set the font family to Poppins
                          fontWeight: FontWeight.w800, // Extra Bold weight
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Congratulations!!!",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily:
                              'Poppins', // Set the font family to Poppins
                          fontWeight: FontWeight.bold, // Set to bold
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get the ordinal suffix for a number
  String getOrdinalSuffix(int number) {
    if (number % 10 == 1 && number % 100 != 11) {
      return "st";
    } else if (number % 10 == 2 && number % 100 != 12) {
      return "nd";
    } else if (number % 10 == 3 && number % 100 != 13) {
      return "rd";
    } else {
      return "th";
    }
  }
}
