import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String email;

  const HomePage({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),

      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Icon(
                  Icons.account_circle,
                  size: 90,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome to Home Screen 🎉",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  "Name: $username",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Email: $email",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 35),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}