import 'package:flutter/material.dart';
import 'package:pachpach/services/riverPod/placeNotifier.dart';
import 'package:pachpach/services/riverPod/shopNotifier.dart';
import 'package:pachpach/services/riverPod/machineNotifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pachpach/services/getDropDownData.dart';
import 'package:firebase_auth/firebase_auth.dart';


final tokenProvider = StateProvider<String?>((ref) => null);

void initFirebaseToken(BuildContext context) async{
  final _auth = await FirebaseAuth.instance.currentUser;
  if (_auth != null) {
    final tokenResult = await _auth.getIdTokenResult();
    context.read(tokenProvider).state = tokenResult.token!;
  }
}

final placeNotifierProvider = ChangeNotifierProvider((ref) => PlaceNotifier());

final placeProvider = FutureProvider<List<String>?>((ref) async{
  final getToken = ref.watch(tokenProvider).state;
  if(getToken != null){
    GetList getList = GetList(getToken: getToken);
    final places =  await getList.fetchDropDownData('place', 'place_name');

    final placeNotifier = ref.read(placeNotifierProvider);
    placeNotifier.setPlaces(places);

    return places;
  }
});

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