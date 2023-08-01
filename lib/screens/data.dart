import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPage();
}

class _DataPage extends State<DataPage> {
  static const List<String> plList = <String>["渋谷", '新宿', '池袋', '品川'];
  static const List<String> shopList = <String>["GAIA", 'エスパス', '楽園'];
  static const List<String> machineList = <String>["エヴァンゲリオン", 'ジャグラー', 'ウニコーン', '大工の源さん'];
  String dropdownPlace = plList.first;
  String dropdownShop = shopList.first;
  String dropdownMachine = machineList.first;
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
                              DropdownButton<String>(
                              value: dropdownPlace,
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
                                items: plList.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            DropdownButton<String>(
                              value: dropdownShop,
                              icon: const Icon(Icons.arrow_circle_down, color: Color(KbaseColor)),
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
                              items: shopList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              value: dropdownMachine,
                              icon: const Icon(Icons.arrow_circle_down, color: Color(KbaseColor)),
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
                              items: machineList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
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