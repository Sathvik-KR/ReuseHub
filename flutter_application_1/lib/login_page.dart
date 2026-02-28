import 'package:flutter/material.dart';
import 'dart:math';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  bool isFront = true;

  final _loginKey = GlobalKey<FormState>();
  final _registerKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController loginUsername = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  TextEditingController regUsername = TextEditingController();
  TextEditingController regEmail = TextEditingController();
  TextEditingController regPassword = TextEditingController();
  TextEditingController regConfirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation =
        Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void flipCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value * pi;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(angle),
              child: angle <= pi / 2
                  ? buildLogin()
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: buildRegister(),
                    ),
            );
          },
        ),
      ),
    );
  }

  // ================= LOGIN =================
  Widget buildLogin() {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Login",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),

              TextFormField(
                controller: loginUsername,
                decoration: InputDecoration(labelText: "Username"),
                validator: (value) =>
                    value!.isEmpty ? "Enter Username" : null,
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: loginPassword,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) =>
                    value!.isEmpty ? "Enter Password" : null,
              ),

              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_loginKey.currentState!.validate()) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          username: loginUsername.text,
                          email: "Not Provided",
                        ),
                      ),
                    );

                  }
                },
                child: Text("Login"),
              ),

              SizedBox(height: 15),

              TextButton(
                onPressed: flipCard,
                child: Text("Don't have account? Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= REGISTER =================
  Widget buildRegister() {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _registerKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Register",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),

              TextFormField(
                controller: regUsername,
                decoration: InputDecoration(labelText: "Username"),
                validator: (value) =>
                    value!.isEmpty ? "Enter Username" : null,
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: regEmail,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) =>
                    value!.isEmpty ? "Enter Email" : null,
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: regPassword,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) =>
                    value!.length < 6 ? "Minimum 6 characters" : null,
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: regConfirmPassword,
                obscureText: true,
                decoration:
                    InputDecoration(labelText: "Confirm Password"),
                validator: (value) {
                  if (value != regPassword.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_registerKey.currentState!.validate()) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          username: regUsername.text,
                          email: regEmail.text,
                        ),
                      ),
                    );

                  }
                },
                child: Text("Register"),
              ),

              SizedBox(height: 15),

              TextButton(
                onPressed: flipCard,
                child: Text("Already have account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}