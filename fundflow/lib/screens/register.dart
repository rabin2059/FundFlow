import 'package:flutter/material.dart';
import 'package:fundflow/controller/RegisterApiHandler.dart';
import 'package:fundflow/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isObscure = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegisterApiHandler _apiHandler = RegisterApiHandler();

  void _registerUser() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String passwordHash = _passwordController.text;

    try {
      String response = await _apiHandler.registerUser(username, email, passwordHash);

      // Check if registration was successful
      if (response == 'Registration successful') {
        // Show snackbar with success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User registered successfully"),
            duration: Duration(seconds: 2),
          ),
        );
        // Navigate to login page after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      } else {
        // Show snackbar with error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Show snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to register user: $e"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
            children: [
              // Background Image
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/back.png',
                  height: 410,
                ),
              ),
              // Front Image
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 370, // Center vertically
                left: MediaQuery.of(context).size.width / 2 - 140, // Center horizontally
                child: Text('Create Account',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)
                  ),
                )
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 320, // Center vertically
                left: MediaQuery.of(context).size.width / 2 - 70, // Center horizontally
                child: Text('Create a new account',
                style: TextStyle(fontSize: 18),)
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 250, // Center vertically
                child: Container(
                  width: MediaQuery.of(context).size.width, // Add width constraint to the Container
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0), // Set border radius
                              borderSide: BorderSide.none
                            ),
                            filled: true, // Add filled property
                            fillColor: Color.fromARGB(255, 228, 227, 227), // Set background color
                            prefixIcon: Icon(Icons.person), // Add icon
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: TextField(
                        controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0), // Set border radius
                              borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 227, 227),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
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
                      SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: (){
                        if (_usernameController.text != "" && _emailController.text != "" ){
                            _registerUser();
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please fill in all fields"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: Text('Register'),
                    ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                          style: TextStyle(fontSize: 17),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            child: Text(
                              'Login',
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
              ), 
            ],
          )
        ),
    );
  }
}