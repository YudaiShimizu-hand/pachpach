import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRecord {
  PostRecord({
    required this.getToken,
    required this.placeValue,
    required this.shopValue,
    required this.machineValue,
    required this.investmentValue,
    required this.proceedsValue
  });
  String getToken;
  String? placeValue;
  String? shopValue;
  String? machineValue;
  int investmentValue;
  int proceedsValue;

  Future<void> postDropdown() async{
    final url = 'http://localhost:8081/api/v1/data/store';
    final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $getToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "place_name" : placeValue,
          "shop_name" : shopValue,
          "machine_name" : machineValue,
          "investment" : investmentValue,
          "proceeds" : proceedsValue,
        })
    );

    if (response.statusCode == 200) {
      // リクエストが成功した場合の処理
      print('Response data: ${response.body}');
    } else {
      // エラーが発生した場合の処理
      print('Error: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}