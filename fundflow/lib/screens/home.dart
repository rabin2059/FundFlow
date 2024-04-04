import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 60, 20, 30),
            decoration: BoxDecoration(
              color: Color(0xFF01BA76),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.person_outlined, size: 50),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi ${widget.username}',
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                      ),
                      Text(
                        'Good Evening',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      color: Color(0xFF01BA76),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 190,
                    width: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF01BA76),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 190,
                    width: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF01BA76),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 190,
                    width: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF01BA76),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 190,
                    width: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF01BA76),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 190,
                    width: 150,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              // color: Color(0xFF01BA76),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Daily Consumption'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('Rs.350'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
