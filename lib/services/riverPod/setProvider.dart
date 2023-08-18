import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pachpach/services/riverPod/placeNotifier.dart';
import 'package:pachpach/services/riverPod/shopNotifier.dart';
import 'package:pachpach/services/riverPod/machineNotifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pachpach/services/getDropDownData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:pachpach/screens/calendar.dart';


final tokenProvider = StateProvider<String?>((ref) => null);

void initFirebaseToken(BuildContext context) async{
  final _auth = await FirebaseAuth.instance.currentUser;
  if (_auth != null) {
    final tokenResult = await _auth.getIdTokenResult();
    context.read(tokenProvider).state = tokenResult.token!;
  }
}

//場所情報取得
final placeNotifierProvider = ChangeNotifierProvider((ref) => PlaceNotifier());

final placeProvider = FutureProvider<List<String>?>((ref) async{
  final getToken = ref.watch(tokenProvider).state;
  print(getToken);
  if(getToken != null){
    GetList getList = GetList(getToken: getToken);
    final places =  await getList.fetchDropDownData('place', 'place_name');

    final placeNotifier = ref.read(placeNotifierProvider);
    placeNotifier.setPlaces(places);

    return places;
  }
});


//店舗情報取得
final shopNotifierProvider = ChangeNotifierProvider((ref) => ShopNotifier());

final shopProvider = FutureProvider<List<String>?>((ref) async{
  final getToken = ref.watch(tokenProvider).state;
  if(getToken != null){
    GetList getList = GetList(getToken: getToken);
    final shops =  await getList.fetchDropDownData('shop', 'shop_name');

    final shopNotifier = ref.read(shopNotifierProvider);
    shopNotifier.setShops(shops);

    return shops;
  }
});


//機種情報取得
final machineNotifierProvider = ChangeNotifierProvider((ref) => MachineNotifier());

final machineProvider = FutureProvider<List<String>?>((ref) async{
  final getToken = ref.watch(tokenProvider).state;
  if(getToken != null){
    GetList getList = GetList(getToken: getToken);
    final machines =  await getList.fetchDropDownData('machine', 'machine_name');

    final machineNotifier = ref.read(machineNotifierProvider);
    machineNotifier.setMachines(machines);

    return machines;
  }
});

final totalProvider = FutureProvider<int>((ref) async{
  final getToken = ref.watch(tokenProvider).state;
  final response = await http.get(
    Uri.parse('http://localhost:8081/api/v1/data/total'),
    headers: {
      'Authorization': 'Bearer $getToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return int.parse(jsonDecode(response.body).toString());
  } else {
    // サーバーがエラーレスポンスを返す場合、エラーをスローします。
    print('HTTP Status Code: ${response.statusCode}');
    throw Exception('Failed to load data');
  }
});

final monthTotalProvider = FutureProvider<int>((ref) async{
  int now = DateTime.now().month;

  final getToken = ref.watch(tokenProvider).state;
  final response = await http.get(
    Uri.parse('http://localhost:8081/api/v1/data/monthTotal?month=$now'),
    headers: {
      'Authorization': 'Bearer $getToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // サーバーが成功のステータスコード200を返す場合、JSONを解析します。
    return int.parse(jsonDecode(response.body).toString());
  } else {
    // サーバーがエラーレスポンスを返す場合、エラーをスローします。
    print('HTTP Status Code: ${response.statusCode}');
    throw Exception('Failed to load data');
  }
});


final eventDataProvider = FutureProvider.autoDispose<List<EventData>>((ref) async {

  final getToken = ref.watch(tokenProvider).state;
  final url = 'http://localhost:8081/api/v1/data/calendar';
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $getToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData
        .map((data) => EventData(
        place: data['place_name'],
        shop: data['shop_name'],
        machine: data['machine_name'],
        score: data['score'].toString(),
        date: DateTime.parse(data['created_at'])
    )).toList();
  } else {
    print('Error: ${response.statusCode} ${response.reasonPhrase}');
    throw Exception('Failed to load events');
  }
});

