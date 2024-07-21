import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:quick_workout/features/models/matches/matches_item.dart';

class MatchesProvider extends ChangeNotifier {
  var box = Hive.box('matches');

  final TextEditingController controllerGameScore = TextEditingController();
  final TextEditingController controllerWinningAmount = TextEditingController();
  DateTime dateTime = DateTime.now();
  String date = '19.06.23';
  bool checkAnyControllerEmpty = true;

  void saveDate() {
    date = DateFormat('MM.dd.yy').format(dateTime);
    notifyListeners();
  }

  void clearTextControllers() {
    controllerGameScore.clear();
    controllerWinningAmount.clear();
    checkAnyControllerEmpty = true;
    notifyListeners();
  }

  void checkControllerEmpty() {
    final listOfControllers = [
      controllerGameScore,
      controllerWinningAmount,
    ];
    checkAnyControllerEmpty = listOfControllers.any((e) => e.text == '');
    notifyListeners();
  }

  void deleteItem(index) {
    box.deleteAt(index);
    notifyListeners();
  }

  void addMatches() {
    final parsedNumber =
        double.parse(controllerWinningAmount.text.replaceAll(',', ''));
    final formattedNumber =
        NumberFormat('#,##0.00', 'en_US').format(parsedNumber).toString();
    box.add(MatchesItem(
      date,
      controllerGameScore.text,
      formattedNumber.toString(),
    ));
    notifyListeners();
  }
}
