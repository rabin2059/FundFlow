import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundflow/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  final String username;
  const SettingScreen({Key? key, required this.username}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 150,),
            Row(
              children: [
                Icon(CupertinoIcons.person_crop_circle,
                size: 60,),
                SizedBox(width: 10,),
                Text('Rabin Rai',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )
                ),)
              ],
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 238, 237, 237),),
              height: MediaQuery.of(context).size.height / 1.7 + kBottomNavigationBarHeight,
              width: 390,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Profile',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20
                          )
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Account Setting',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20
                          )
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Help Center',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20
                          )
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('...........',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20
                          )
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('.......',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20
                          )
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text('Log Out',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20
                            )
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
