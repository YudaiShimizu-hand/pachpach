import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/components/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pachpach/services/postDropdownData.dart';
import 'package:pachpach/services/getDropDownData.dart';
import 'package:pachpach/services/postRecordData.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPage();
}

class _RecordPage extends State<RecordPage> {
  List<String> plList = [];
  List<String> machineList = [];
  List<String> shopList = [];
  String? dropdownPlace;
  String? dropdownShop;
  String? dropdownMachine;

  final controller = TextEditingController();
  final investmentController = TextEditingController();
  final proceedsController = TextEditingController();
  final focusNode = FocusNode();
  late String getToken;

  int? get intInvestmentValue {
    return int.tryParse(investmentController.text);
  }
  int? get intProceedsValue {
    return int.tryParse(proceedsController.text);
  }

  @override
  void initState(){
    super.initState();
    initFirebaseToken();
  }

 void initFirebaseToken() async{
     final _auth = await FirebaseAuth.instance.currentUser;
     if(_auth != null){
       final tokenResult = await _auth.getIdTokenResult();
       getToken = tokenResult.token!;
       print(getToken);
       GetList getList = GetList(getToken: getToken);
       final List<String>? fetchedPlList = await getList.fetchDropDownData('place', 'place_name');
       final List<String>? fetchedShopList = await getList.fetchDropDownData('shop', 'shop_name');
       final List<String>? fetchedMachineList = await getList.fetchDropDownData('machine', 'machine_name');
       setState(() {
         plList = fetchedPlList!;
         dropdownPlace = plList.isNotEmpty ? plList[0] : null;
         shopList = fetchedShopList!;
         dropdownShop = shopList.isNotEmpty ? shopList[0] : null;
         machineList = fetchedMachineList!;
         dropdownMachine = machineList.isNotEmpty ? machineList[0] : null;
       });
     }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarCmp(isBtn: 'Record'),
      body: Container(
          margin: const EdgeInsets.all(50),
          width: 300,
          height: 600,
          // color: Color(KbaseColor),
          decoration: BoxDecoration(
            color: Color(KbaseColor),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Color(KbaseColor).withOpacity(0.5),
                offset: Offset(20, 20),
              )
            ],
          ),
        child: Column(
          children: <Widget>[
            KSecondSpace,
            const Text(
              '本日の記録',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            KSpace,
            Container(
              height: 25,
              margin: EdgeInsets.only(left: 130, right: 70),
                child: Row(
                  children: <Widget>[
                    Text(
                      '場所',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          content: TextFormField(
                            textAlign: TextAlign.center,
                            autofocus: true, // ダイアログが開いたときに自動でフォーカスを当てる
                            focusNode: focusNode,
                            controller: controller,
                            onFieldSubmitted: (_) {
                              // エンターを押したときに実行される
                              setState(() {
                                String placeValue = controller.text;
                                plList.add(placeValue);
                                dropdownPlace = placeValue;
                                final dataInstance = DropDownData(getToken: getToken, otherUrl: 'place', dataName: 'place_name', dataValue: placeValue);
                                dataInstance.postDropdown();
                                controller.clear();
                              });
                              Navigator.pop(context);
                            }
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  String placeValue = controller.text;
                                  plList.add(placeValue);
                                  dropdownPlace = placeValue;
                                  final dataInstance = DropDownData(getToken: getToken, otherUrl: 'place', dataName: 'place_name', dataValue: placeValue);
                                  dataInstance.postDropdown();
                                  controller.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('追加'),
                            )
                          ],
                        );
                      });
                    }, icon: Icon(Icons.add),iconSize: 15,color: Colors.black)
                  ],
                ),
            ),
            SizedBox(
              width: 160,
              child: DropdownButton<String>(
                alignment: Alignment.center,
                dropdownColor: Colors.white,
                value: dropdownPlace,
                icon: const Icon(Icons.arrow_circle_down, color: Colors.white,),
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownPlace = value!;
                  });
                },
                items: plList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            KSpace,
            Container(
              height: 25,
              margin: EdgeInsets.only(left: 120, right: 60),
              child: Row(
                children: <Widget>[
                  Text(
                    '店舗名',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: TextFormField(
                          textAlign: TextAlign.center,
                          autofocus: true, // ダイアログが開いたときに自動でフォーカスを当てる
                          focusNode: focusNode,
                          controller: controller,
                          onFieldSubmitted: (_) {
                            // エンターを押したときに実行される
                            setState(() {
                              String shopValue = controller.text;
                              shopList.add(shopValue);
                              dropdownShop = shopValue;
                              final dataInstance = DropDownData(getToken: getToken, otherUrl: 'shop', dataName: 'shop_name', dataValue: shopValue);
                              dataInstance.postDropdown();
                              controller.clear();
                            });
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                String shopValue = controller.text;
                                shopList.add(shopValue);
                                dropdownShop = shopValue;
                                final dataInstance = DropDownData(getToken: getToken, otherUrl: 'shop', dataName: 'shop_name', dataValue: shopValue);
                                dataInstance.postDropdown();
                                controller.clear();
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('追加'),
                          )
                        ],
                      );
                    });
                  }, icon: Icon(Icons.add),iconSize: 15,color: Colors.black)
                ],
              ),
            ),
            SizedBox(
              width: 160,
              child: DropdownButton<String>(
                alignment: Alignment.center,
                dropdownColor: Colors.white,
                value: dropdownShop,
                icon: const Icon(Icons.arrow_circle_down, color: Colors.white),
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownShop = value!;
                  });
                },
                items: shopList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            KSpace,
            Container(
              height: 25,
              margin: EdgeInsets.only(left: 130, right: 70),
              child: Row(
                children: <Widget>[
                  Text(
                    '機種',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: TextFormField(
                          textAlign: TextAlign.center,
                          autofocus: true, // ダイアログが開いたときに自動でフォーカスを当てる
                          focusNode: focusNode,
                          controller: controller,
                          onFieldSubmitted: (_) {
                            // エンターを押したときに実行される
                            setState(() {
                              String machineValue = controller.text;
                              machineList.add(machineValue);
                              dropdownMachine = machineValue;
                              final dataInstance = DropDownData(getToken: getToken, otherUrl: 'machine', dataName: 'machine_name', dataValue: machineValue);
                              dataInstance.postDropdown();
                              controller.clear();
                            });
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                String machineValue = controller.text;
                                machineList.add(machineValue);
                                dropdownMachine = machineValue;
                                final dataInstance = DropDownData(getToken: getToken, otherUrl: 'machine', dataName: 'machine_name', dataValue: machineValue);
                                dataInstance.postDropdown();
                                controller.clear();
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('追加'),
                          )
                        ],
                      );
                    });
                  }, icon: Icon(Icons.add),iconSize: 15, color: Colors.black,)
                ],
              ),
            ),
            SizedBox(
              width: 160,
              child: DropdownButton<String>(
                alignment: Alignment.center,
                dropdownColor: Colors.white,
                value: dropdownMachine,
                icon: const Icon(Icons.arrow_circle_down, color: Colors.white),
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownMachine = value!;
                  });
                },
                items: machineList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            KSpace,
            const Text(
              '投資額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: TextField(
                textAlign: TextAlign.center,
                controller: investmentController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
            ),
            KSpace,
            const Text(
              '回収額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: TextField(
                textAlign: TextAlign.center,
                controller: proceedsController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
            ),
            KSecondSpace,
            ButtonCmp(clickHand: (){
              final postData = PostRecord(
                  getToken: getToken,
                  placeValue: dropdownPlace,
                  shopValue: dropdownShop,
                  machineValue: dropdownMachine,
                  investmentValue: intInvestmentValue!,
                  proceedsValue: intProceedsValue!,
              );
              Navigator.pushNamed(context, "/");
            }, txt: '記録する', mt: 5),
          ],
        ),
        ),
    );
  }
}
