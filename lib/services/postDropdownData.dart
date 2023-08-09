import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownData {
  DropDownData({required this.getToken, required this.otherUrl, required this.dataName, required this.dataValue});
  String getToken;
  String otherUrl;
  String dataName;
  String dataValue;

  Future<void> postDropdown() async{
    final url = 'http://localhost:8081/api/v1/$otherUrl';
    final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $getToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          '$dataName': dataValue,
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