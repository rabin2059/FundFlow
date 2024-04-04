import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundflow/controller/AddItemController.dart';
import 'package:fundflow/models/AddItemModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateItems extends StatefulWidget {
  final AddItemModel item;
  final Function getData;

  const UpdateItems({Key? key, required this.item, required this.getData}) : super(key: key);

  @override
  _UpdateItemsState createState() => _UpdateItemsState();
}

class _UpdateItemsState extends State<UpdateItems> {
  final _formKey = GlobalKey<FormBuilderState>();
  DateTime? _selectedDate;
  AddItemController _addItemController = AddItemController(username: '');

  void _updateItem() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      double allocatedAmount = double.tryParse(data['allocatedAmount']) ?? 0.0;

      final updatedItem = AddItemModel(
        id: widget.item.id,
        allocationName: data['allocationName'],
        allocatedAmount: allocatedAmount,
        allocatedDate: _selectedDate ?? widget.item.allocatedDate,
      );

      // Call the method to update the item
      await _addItemController.updateItem(updatedItem);

      // Navigate back and refresh data after a delay
      Timer(Duration(seconds: 1), () {
        Navigator.pop(context);
        // getData from add.dart file
        widget.getData();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: _selectedDate ?? widget.item.allocatedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null && pickedDate != _selectedDate) {
    setState(() {
      _selectedDate = pickedDate;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Expenses"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Update Expense Details",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                key: Key('allocationName'),
                name: 'allocationName',
                initialValue: widget.item.allocationName,
                decoration: InputDecoration(
                  labelText: 'Fund Allocation Name',
                ),
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                key: Key('allocatedAmount'),
                name: 'allocatedAmount',
                initialValue: widget.item.allocatedAmount.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Allocation Amount',
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Allocated Date',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateItem,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
