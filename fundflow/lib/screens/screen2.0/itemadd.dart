import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundflow/controller/AddItemController.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItems extends StatefulWidget {
  final String username;

  const AddItems({Key? key, required this.username}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  TextEditingController _allocationNameController = TextEditingController();
  TextEditingController _allocatedAmountController = TextEditingController();
  DateTime? _selectedDate; // Nullable DateTime

  late final AddItemController _apiHandle;

  @override
  void initState() {
    super.initState();
    _apiHandle = AddItemController(username: widget.username);
  }

  void _addItem() async {
    String name = _allocationNameController.text;
    double allocationAmount = double.parse(_allocatedAmountController.text);
    if (_allocationNameController.text.isEmpty ||
        _allocatedAmountController.text.isEmpty ||
        _selectedDate == null) {
      _showSnackBar("Please fill in all fields");
      return;
    }

    try {
      dynamic response = await _apiHandle.addItem(
          name, allocationAmount, _selectedDate!);

      if (response == "Added successfully") {
        _showSnackBar("Item added successfully");
        // Navigate to another screen after successful item addition
        // For example:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => NextScreen()),
        // );
      } else {
        _showSnackBar(response);
      }
    } catch (e) {
      _showSnackBar("Failed to add item");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  "Add Expenses",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 7, 3, 240),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                TextField(
                  controller: _allocationNameController,
                  decoration: InputDecoration(
                    labelText: 'Fund Allocation Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 228, 227, 227),
                    prefixIcon: Icon(Icons.label),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _allocatedAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Allocation Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 228, 227, 227),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Allocated Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 227, 227),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
