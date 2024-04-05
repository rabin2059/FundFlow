import 'dart:convert';
import 'package:fundflow/models/AddItemModel.dart';
import 'package:http/http.dart' as http;

class AddItemController {
  final String baseUri = "http://localhost:5269/api/users";
  final String username;

  AddItemController({required this.username});

  Future<String> addItem(String allocationName, double allocatedAmount, DateTime allocatedDate) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUri/AddFund?username=$username'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "allocationName": allocationName,
          "allocatedAmount": allocatedAmount,
          "allocatedDate": allocatedDate.toIso8601String(),
        }),
      );

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return 'Added successfully';
      } else if (response.statusCode == 400) {
        throw Exception('Bad request. Please check your data.');
      } else {
        throw Exception('Failed to add item. Server returned ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to add item: $e');
    }
  }

 Future<dynamic> deleteItem(int id) async {
  try {
    final response = await http.delete(
      Uri.parse('$baseUri/RemoveFund?Id=$id'), // Update URI to accept Id instead of allocationName
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.statusCode);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return 'Deleted';
    } else {
      throw Exception('Failed to delete item. Server returned ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to delete item: $e');
  }
}

  Future<dynamic> updateItem(AddItemModel updatedItem) async {
  try {
    final response = await http.put(
      Uri.parse('$baseUri/UpdateFund'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedItem.toJson()), // Convert AddItemModel to JSON
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update item. Server returned ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to update item: $e');
  }
}


  Future<List<AddItemModel>> getAllItems() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUri/GetFunds?username=$username'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => AddItemModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get all items. Server returned ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get all items: $e');
    }
  }
}
