import 'dart:convert';

class AddItemModel {
    final int id;
    final String allocationName;
    final double allocatedAmount;
    final DateTime allocatedDate;

  var allocationDate;

    AddItemModel({
        required this.id,
        required this.allocationName,
        required this.allocatedAmount,
        required this.allocatedDate,
    });

    factory AddItemModel.fromRawJson(String str) => AddItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddItemModel.fromJson(Map<String, dynamic> json) => AddItemModel(
        id: json["id"],
        allocationName: json["allocationName"],
        allocatedAmount: json["allocatedAmount"]?.toDouble(),
        allocatedDate: DateTime.parse(json["allocatedDate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "allocationName": allocationName,
        "allocatedAmount": allocatedAmount,
        "allocatedDate": allocatedDate.toIso8601String(),
    };
}
