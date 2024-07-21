import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quick_workout/features/models/strategies/strategies_item.dart';

class StrategiesProvider extends ChangeNotifier {
  var box = Hive.box('strategies');
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerAbbreviation = TextEditingController();
  final TextEditingController controllerText = TextEditingController();
  bool checkAnyControllerEmpty = true;

  void clearTextControllers() {
    controllerTitle.clear();
    controllerAbbreviation.clear();
    controllerText.clear();
    checkAnyControllerEmpty = true;
    notifyListeners();
  }

  void checkControllerEmpty() {
    final listOfControllers = [
      controllerTitle,
      controllerAbbreviation,
      controllerText
    ];
    checkAnyControllerEmpty = listOfControllers.any((e) => e.text == '');
    notifyListeners();
  }

  void deleteItem(index) {
    box.deleteAt(index);
    notifyListeners();
  }

  void addStrategies() {
    box.add(StrategiesItem(
      controllerTitle.text,
      controllerAbbreviation.text,
      controllerText.text,
    ));
    notifyListeners();
  }

  void editStrategies(index) {
    StrategiesItem strategiesItem = box.getAt(index);
    controllerAbbreviation.text = strategiesItem.abbreviation;
    controllerTitle.text = strategiesItem.text;
    controllerText.text = strategiesItem.text;
    checkAnyControllerEmpty = false;
    notifyListeners();
  }

  void saveEditStrategies(index) {
    box.putAt(
        index,
        StrategiesItem(
          controllerTitle.text,
          controllerAbbreviation.text,
          controllerText.text,
        ));
    notifyListeners();
  }
}
