import 'package:flutter/material.dart';

class MachineNotifier extends ChangeNotifier {
  List<String> _machines = [];

  List<String> get machines => _machines;

  void setMachines(List<String> machines) {
    _machines = machines;
    notifyListeners();
  }

  void addMachine(String machine) {
    _machines.add(machine);
    notifyListeners();
  }
}