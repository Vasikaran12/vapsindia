import 'package:flutter/material.dart';
import 'package:vapsindia/pages/home.dart';
import 'package:vapsindia/pages/training.dart';
import 'package:vapsindia/pages/programs.dart';

class VapsProvider with ChangeNotifier {
  List<VapsDTO> items = [
    VapsDTO(label: 'Home', widget: const HomeTab(), iconData: Icons.home),
    VapsDTO(
        label: 'Training', widget: const TrainingTab(), iconData: Icons.model_training_rounded),
    VapsDTO(label: 'Programs', widget: const ProgramsTab(), iconData: Icons.apps),
  ];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class VapsDTO {
  Widget? widget;
  String? label;
  IconData? iconData;

  VapsDTO({this.widget, this.label, this.iconData});
}