import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fundflow/controller/AddItemController.dart';
import 'package:fundflow/models/AddItemModel.dart';
import 'package:fundflow/screens/screen2.0/update.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFund extends StatefulWidget {
  final String username;

  const AddFund({Key? key, required this.username}) : super(key: key);

  @override
  State<AddFund> createState() => _AddFundState();
}

class _AddFundState extends State<AddFund> {
  late final AddItemController _addItemController;
  late List<AddItemModel> data = [];

  @override
  void initState() {
    super.initState();
    _addItemController = AddItemController(username: widget.username);
    getData();
  }

  Future<void> getData() async {
    try {
      final newData = await _addItemController.getAllItems();
      setState(() {
        data = newData;
      });
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: Column(
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
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
          SizedBox(
            height: 140,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 199, 199),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
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
              ),
            ),
          ),

          SizedBox(
            height: 525,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
              decoration: BoxDecoration(
                color: Color(0xFF01BA76),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Expenses',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)
                        ),),
                      Text('Rs.5,500',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 205, 38, 26))
                        ),)
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 236, 220, 220),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data[index].allocationName}',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(fontSize:15, fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Text(
                                            'Rs.${data[index].allocatedAmount}',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => UpdateItems(item: data[index], getData: getData,),
                                                ),
                                              );
                                            },
                                            child: Icon(CupertinoIcons.pen)),
                                          SizedBox(width:20),
                                          GestureDetector(
                                            onTap: () async {
                                              // Show confirmation dialog
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text("Confirm Deletion"),
                                                    content: Text("Are you sure you want to delete this item?"),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          // Dismiss the dialog
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text("No"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () async {
                                                          try {
                                                            // Call the method to delete the item
                                                            await _addItemController.deleteItem(data[index].id);

                                                            // Refresh the data after deletion
                                                            getData();

                                                            // Dismiss the dialog
                                                            Navigator.pop(context);
                                                          } catch (e) {
                                                            print('Failed to delete item: $e');
                                                          }
                                                        },
                                                        child: Text("Yes"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(CupertinoIcons.delete, color: Color.fromARGB(255, 0, 0, 0))
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
