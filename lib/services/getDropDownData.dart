import 'dart:convert';
import 'package:http/http.dart' as http;

class GetList {

  GetList({required this.getToken});

  String getToken;

  Future<List<String>> fetchDropDownData(String connectUrl, String itemName) async {
    final response = await http.get(
      Uri.parse('http://localhost:8081/api/v1/$connectUrl'),
      headers: {
        'Authorization': 'Bearer $getToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // サーバーが成功のステータスコード200を返す場合、JSONを解析します。
      List<dynamic> dataList = json.decode(response.body);
      return dataList.map((item) => item['$itemName'] as String).toList();
      // return json.decode(response.body);
    } else {
      // サーバーがエラーレスポンスを返す場合、エラーをスローします。
      throw Exception('Failed to load data');
    }
  }

}

