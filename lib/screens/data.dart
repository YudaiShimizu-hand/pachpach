import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
// import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/services/riverPod/setProvider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPage();
}

class _DataPage extends State<DataPage> {
  String? dropdownPlace;
  String? dropdownShop;
  String? dropdownMachine;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCmp(isBtn: 'Data'),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 230,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Consumer(builder: (context, watch, child){
                              final places = watch(placeProvider);
                              return DropdownButton<String>(
                                alignment: Alignment.center,
                                dropdownColor: Colors.black,
                                value: dropdownPlace ?? places.data?.value?.first,
                                icon: const Icon(Icons.arrow_circle_down, color: Color(KbaseColor),),
                                isExpanded: true,
                                elevation: 16,
                                style: const TextStyle(color: Color(KbaseColor)),
                                underline: Container(
                                  height: 2,
                                  color: Color(KbaseColor),
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
                                  }).toList(), loading: () {  }, error: (Object error, StackTrace? stackTrace) {  },
                                ),
                              );
                            }),
                            Consumer(builder: (context, watch, child){
                              final shops = watch(shopProvider);
                              return DropdownButton<String>(
                                alignment: Alignment.center,
                                dropdownColor: Colors.black,
                                value: dropdownShop ?? shops.data?.value?.first,
                                icon: const Icon(Icons.arrow_circle_down, color: Color(KbaseColor),),
                                isExpanded: true,
                                elevation: 16,
                                style: const TextStyle(color: Color(KbaseColor)),
                                underline: Container(
                                  height: 2,
                                  color: Color(KbaseColor),
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
                                  }).toList(), loading: () {  }, error: (Object error, StackTrace? stackTrace) {  },
                                ),
                              );
                            }),
                            Consumer(builder: (context, watch, child){
                              final machines = watch(machineProvider);
                              return DropdownButton<String>(
                                alignment: Alignment.center,
                                dropdownColor: Colors.black,
                                value: dropdownMachine ?? machines.data?.value?.first,
                                icon: const Icon(Icons.arrow_circle_down, color: Color(KbaseColor),),
                                isExpanded: true,
                                elevation: 16,
                                style: const TextStyle(color: Color(KbaseColor)),
                                underline: Container(
                                  height: 2,
                                  color: Color(KbaseColor),
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
                                  }).toList(), loading: () {  }, error: (Object error, StackTrace? stackTrace) {  },
                                ),
                              );
                            }),
                          ],
                        ),
                  )),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ElevatedButton.icon(
                          onPressed: (){
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(50, 50),
                            backgroundColor: Colors.black,
                          ),
                          label: Text("勝率を見る"),
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Color(KbaseColor),
                          ),
                        ),
                  ))
                ],
              ),
            ),
            KSpace,
            Container(
              width: 300,
              height: 200,
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
                  // Text('渋谷エスパス',style: TextStyle(color: Colors.black),),
                  // Text('エヴァンゲリオン',style: TextStyle(color: Colors.black),),
                  Text('勝率は',style: TextStyle(color: Colors.black, fontSize: 20),),
                  KSpace,
                  Text('  94%',style: TextStyle(fontSize: 60),),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.blueGrey.withOpacity(0.5),
                    offset: Offset(20, 20),
                  )
                ],
              ),
              child: Center(
                child: Text(
                    'この店、この台はいいです',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}