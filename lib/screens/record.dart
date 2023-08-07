import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/components/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pachpach/services/dropdownData.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPage();
}

class _RecordPage extends State<RecordPage> {
  final List<String> plList = <String>["渋谷", '新宿', '池袋', '品川'];
  final List<String> shopList = <String>["GAIA", 'エスパス', '楽園'];
  final List<String> machineList = <String>["エヴァンゲリオン", 'ジャグラー', 'ウニコーン', '大工の源さん'];
  String dropdownPlace = "渋谷";
  String dropdownShop = "GAIA";
  String dropdownMachine = "エヴァンゲリオン";

  final controller = TextEditingController();
  final focusNode = FocusNode();

  late String getToken;

  @override
  void initState(){
    super.initState();
    initFirebaseToken();
  }

  void initFirebaseToken() async{
     final _auth = await FirebaseAuth.instance.currentUser;
     if(_auth != null){
       final tokenResult = await _auth.getIdTokenResult();
       setState(() {
         getToken = tokenResult.token!;
         print(getToken);
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
                                final dataInstance = DropDownData(getToken: getToken, otherUrl: 'place', dataName: 'place_name', dataValue: placeValue);
                                dataInstance.postDropdownData();
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
                                  final dataInstance = DropDownData(getToken: getToken, otherUrl: 'place', dataName: 'place_name', dataValue: placeValue);
                                  dataInstance.postDropdownData();
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
                              final dataInstance = DropDownData(getToken: getToken, otherUrl: 'shop', dataName: 'shop_name', dataValue: shopValue);
                              dataInstance.postDropdownData();
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
                                final dataInstance = DropDownData(getToken: getToken, otherUrl: 'shop', dataName: 'shop_name', dataValue: shopValue);
                                dataInstance.postDropdownData();
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
                              final dataInstance = DropDownData(getToken: getToken, otherUrl: 'machine', dataName: 'machine_name', dataValue: machineValue);
                              dataInstance.postDropdownData();
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
                                final dataInstance = DropDownData(getToken: getToken, otherUrl: 'machine', dataName: 'machine_name', dataValue: machineValue);
                                dataInstance.postDropdownData();
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
            InputCmp(keyTyp: TextInputType.number),
            KSpace,
            const Text(
              '回収額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InputCmp(keyTyp: TextInputType.number),
            KSecondSpace,
            ButtonCmp(clickHand: (){}, txt: '記録する', mt: 5),
          ],
        ),
        ),
    );
  }
}
