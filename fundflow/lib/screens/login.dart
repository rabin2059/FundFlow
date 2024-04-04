import 'package:flutter/material.dart';
import 'package:fundflow/button/navigation.dart';
import 'package:fundflow/controller/RegisterApiHandler.dart';
import 'package:fundflow/models/registerModel.dart';
import 'package:fundflow/screens/register.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  final TextEditingController _usernameOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegisterApiHandler _apiHandler = RegisterApiHandler();
  bool _isLoading = false;

  void _loginUser() async {
    String usernameOrEmail = _usernameOrEmailController.text;
    String password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    try {
      User user = await _apiHandler.login(username: usernameOrEmail, email: usernameOrEmail, password: password);

      // Navigate to the home screen and pass the username
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ButtonNavigation(username: user.username),
        ),
      );
    } catch (e) {
      // Error handling...
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to login!"),
          duration: Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/back.png',
              height: 400,
            ),
          ),
          // Front Image
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 370, // Center vertically
            left: MediaQuery.of(context).size.width / 2 - 100, // Center horizontally
            child: Image.asset(
              'assets/img.png',
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 150, // Center vertically
            left: MediaQuery.of(context).size.width / 2 - 120, // Center horizontally
            child: Text(
              'Welcome Back',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 100, // Center vertically
            left: MediaQuery.of(context).size.width / 2 - 68, // Center horizontally
            child: Text(
              'Sign to continue',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 60,
            child: Container(
              width: MediaQuery.of(context).size.width, // Add width constraint to the Container
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextField(
                      controller: _usernameOrEmailController,
                      decoration: InputDecoration(
                        labelText: 'Username or Email', // Change label text
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 227, 227),
                        prefixIcon: Icon(Icons.person), // Change icon to person icon
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 227, 227),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          child: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                        ),
                      ),
                      obscureText: _isObscure,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF01BA76),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _isLoading
                      ? CircularProgressIndicator() // Show loading indicator when loading
                      : Container(
                          padding: EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: _loginUser,
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 70),
                              backgroundColor: Color(0xFF01BA76),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'Create a new account',
                          style: TextStyle(
                            color: Color(0xFF01BA76),
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
