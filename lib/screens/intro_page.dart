import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerytute/screens/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //* logo
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80.0, bottom: 0, top: 80.0),
            child: Image.asset(
              "assets/images/avocado-removebg.png",
              width: 240,
            ),
          ),

          //* we deliver groveries at your doorstep
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          //* fresh items everyday
          Text(
            'Fresh items everyday',
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          //* get start button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
