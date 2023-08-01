import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/constants.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPage();
}

class _DataPage extends State<DataPage> {
  static const List<String> plList = <String>["渋谷", '新宿', '池袋', '品川'];
  static const List<String> machineList = <String>["エヴァンゲリオン", 'ジャグラー', 'ウニコーン', '大工の源さん'];
  String dropdownPlace = plList.first;
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
              height: 200,
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
                                icon: const Icon(Icons.arrow_downward),
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
                              value: dropdownMachine,
                              icon: const Icon(Icons.arrow_downward),
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
                        margin: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text('勝率を見る'),
                        ),
                  ))
                ],
              ),
            ),
            Kspace,
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
                  Kspace,
                  Text('渋谷エスパス',style: TextStyle(color: Colors.black),),
                  Text('エヴァンゲリオン',style: TextStyle(color: Colors.black),),
                  Text('勝率は',style: TextStyle(color: Colors.black),),
                  Kspace,
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
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}