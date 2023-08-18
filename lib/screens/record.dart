import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/services/postDropdownData.dart';
import 'package:pachpach/services/postRecordData.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pachpach/services/riverPod/setProvider.dart';


class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPage();
}

class _RecordPage extends State<RecordPage> {
  String? dropdownPlace;
  String? dropdownShop;
  String? dropdownMachine;

  final controller = TextEditingController();
  final investmentController = TextEditingController();
  final proceedsController = TextEditingController();
  final focusNode = FocusNode();

  int? get intInvestmentValue {
    return int.tryParse(investmentController.text);
  }
  int? get intProceedsValue {
    return int.tryParse(proceedsController.text);
  }

  @override
  Widget build(BuildContext context){
    final getToken = context.read(tokenProvider).state;
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
                                String placeValue = controller.text;
                                controller.clear();
                                Navigator.pop(context, placeValue);
                                final placeNotifier = context.read(placeNotifierProvider);
                                placeNotifier.addPlace(placeValue);
                                setState(() {
                                  dropdownPlace = placeValue;
                                  final dataInstance = DropDownData(getToken: getToken!, otherUrl: 'place', dataName: 'place_name', dataValue: placeValue);
                                  dataInstance.postDropdown();
                                });
                            }
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                String placeValue = controller.text;
                                controller.clear();
                                Navigator.pop(context, placeValue);
                                final placeNotifier = context.read(placeNotifierProvider);
                                placeNotifier.addPlace(placeValue);
                                setState(() {
                                  dropdownPlace = placeValue;
                                  final dataInstance = DropDownData(getToken: getToken!, otherUrl: 'place', dataName: 'place_name', dataValue: placeValue);
                                  dataInstance.postDropdown();
                                });
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
              child: Consumer(builder: (context, watch, child){
                final places = watch(placeProvider);
                  return DropdownButton<String>(
                    alignment: Alignment.center,
                    dropdownColor: Colors.white,
                    value: dropdownPlace ?? places.data?.value?.first,
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
                    items: places.when(
                      data: (data) => data?.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                         value: value,
                         child: Text(value)
                        );
                      }).toList(),
                      loading: () {
                        return [
                          DropdownMenuItem<String>(
                            value: null,
                            child: CircularProgressIndicator(),
                          ),
                        ];
                      },
                      error: (Object error, StackTrace? stackTrace) {  },
                    ),
                  );
               })
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
                            String shopValue = controller.text;
                            controller.clear();
                            Navigator.pop(context, shopValue);
                            final shopNotifier = context.read(shopNotifierProvider);
                            shopNotifier.addShop(shopValue);
                            setState(() {
                              dropdownShop = shopValue;
                              final dataInstance = DropDownData(getToken: getToken!, otherUrl: 'shop', dataName: 'shop_name', dataValue: shopValue);
                              dataInstance.postDropdown();
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              String shopValue = controller.text;
                              controller.clear();
                              Navigator.pop(context, shopValue);
                              final shopNotifier = context.read(shopNotifierProvider);
                              shopNotifier.addShop(shopValue);
                              setState(() {
                                dropdownShop = shopValue;
                                final dataInstance = DropDownData(getToken: getToken!, otherUrl: 'shop', dataName: 'shop_name', dataValue: shopValue);
                                dataInstance.postDropdown();
                              });
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
                child: Consumer(builder: (context, watch, child){
                  final shops = watch(shopProvider);
                  return DropdownButton<String>(
                    alignment: Alignment.center,
                    dropdownColor: Colors.white,
                    value: dropdownShop ?? shops.data?.value?.first,
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
                        dropdownShop = value!;
                      });
                    },
                    items: shops.when(
                      data: (data) => data?.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value)
                        );
                      }).toList(),
                      loading: () {
                        return [
                          DropdownMenuItem<String>(
                            value: null,
                            child: CircularProgressIndicator(),
                          ),
                        ];
                      },
                      error: (Object error, StackTrace? stackTrace) {  },
                    ),
                  );
                })
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
                            String machineValue = controller.text;
                            controller.clear();
                            Navigator.pop(context, machineValue);
                            final machineNotifier = context.read(machineNotifierProvider);
                            machineNotifier.addMachine(machineValue);
                            setState(() {
                              dropdownMachine = machineValue;
                              final dataInstance = DropDownData(getToken: getToken!, otherUrl: 'machine', dataName: 'machine_name', dataValue: machineValue);
                              dataInstance.postDropdown();
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              String machineValue = controller.text;
                              controller.clear();
                              Navigator.pop(context, machineValue);
                              final machineNotifier = context.read(machineNotifierProvider);
                              machineNotifier.addMachine(machineValue);
                              setState(() {
                                dropdownMachine = machineValue;
                                final dataInstance = DropDownData(getToken: getToken!, otherUrl: 'machine', dataName: 'machine_name', dataValue: machineValue);
                                dataInstance.postDropdown();
                              });
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
                child: Consumer(builder: (context, watch, child){
                  final machines = watch(machineProvider);
                  return DropdownButton<String>(
                    alignment: Alignment.center,
                    dropdownColor: Colors.white,
                    value: dropdownMachine ?? machines.data?.value?.first,
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
                        dropdownMachine = value!;
                      });
                    },
                    items: machines.when(
                      data: (data) => data?.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value)
                        );
                      }).toList(),
                      loading: () {
                        return [
                          DropdownMenuItem<String>(
                            value: null,
                            child: CircularProgressIndicator(),
                          ),
                        ];
                      },
                      error: (Object error, StackTrace? stackTrace) {  },
                    ),
                  );
                })
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
                getToken: getToken!,
                placeValue: dropdownPlace,
                shopValue: dropdownShop,
                machineValue: dropdownMachine,
                investmentValue: intInvestmentValue!,
                proceedsValue: intProceedsValue!,
              );
              postData.postDropdown();
              context.refresh(totalProvider);
              context.refresh(monthTotalProvider);
              Navigator.pushNamed(context, "/");
            }, txt: '記録する', mt: 5),
          ],
        ),
        ),
    );
  }
}
