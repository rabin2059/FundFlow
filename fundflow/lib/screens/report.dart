import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fundflow/screens/history.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatefulWidget {
  final String username;
  const ReportScreen({super.key, required this.username});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
            decoration: BoxDecoration(
              color: Color(0xFF01BA76),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 130,
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
                        'Hi Rabin',
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
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: SizedBox(
              height: 180,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 199, 199),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 35,
                          width: MediaQuery.of(context).size.width / 2 - 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.chart_pie_fill,),
                              SizedBox(width: 10,),
                              Text('Report',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800
                                )
                              ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 35,
                          width: MediaQuery.of(context).size.width / 2 - 45,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.clock_solid,),
                              SizedBox(width: 10,),
                              Text('History',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800
                                )
                              ),
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(children: [
                       SizedBox(width: 23,),
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(228, 241, 229,100),
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.arrow_up_right_circle_fill,size: 30,color: Color.fromARGB(255, 8, 195, 11),),
                              SizedBox(height: 5,),
                              Text('Rs.10,000',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w900,)),)
                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(230, 233, 244,100),
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill, size: 30,color: Colors.blue,),
                              SizedBox(height: 5,),
                              Text('Rs.4,500',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800,)),)
                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 228, 234,100),
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.arrow_down_right_circle_fill, size: 30, color: Colors.red,),
                              SizedBox(height: 5,),
                              Text('Rs.5,500',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800,)),)
                            ],
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('per month'),
                      Text('vs previous month')
                    ],
                  ),
                  Container(
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 20,
                            color: Colors.greenAccent
                          ),
                          PieChartSectionData(
                            value: 30,
                            color: Colors.lightBlue
                          ),
                          PieChartSectionData(
                            value: 60,
                            color: Colors.yellow
                          ),
                          PieChartSectionData(
                            value: 40,
                            color: Colors.orange
                          ),
                          PieChartSectionData(
                            value: 200,
                            color: Colors.red
                          ),
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
