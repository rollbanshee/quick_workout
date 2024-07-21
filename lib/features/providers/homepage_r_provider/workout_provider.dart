import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:quick_workout/features/models/workout/workout_item.dart';

class WorkoutProvider extends ChangeNotifier {
  var box = Hive.box('workout');

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  bool checkAnyControllerEmpty = true;
  String startOfTraining = '00:00';
  String endOfTraining = '00:00';
  String minutesEdit = '40';
  String minutesAddNew = '40';
  DateTime dateTime = DateTime(2024, 1, 1, 0, 0, 0, 0);

  void clearTextControllers() {
    controllerTitle.clear();
    controllerDescription.clear();
    checkAnyControllerEmpty = true;
    notifyListeners();
  }

  void checkControllerEmpty() {
    final listOfControllers = [
      controllerTitle,
      controllerDescription,
    ];
    checkAnyControllerEmpty = listOfControllers.any((e) => e.text == '');
    notifyListeners();
  }

  void deleteItem(index) {
    box.deleteAt(index);
    notifyListeners();
  }

  void addWorkout() {
    box.add(WorkoutItem(
      minutesAddNew,
      controllerTitle.text,
      controllerDescription.text,
    ));
    notifyListeners();
  }

  void editWorkout(index) {
    WorkoutItem workoutItem = box.getAt(index);
    minutesEdit = workoutItem.minutes;
    controllerTitle.text = workoutItem.title;
    controllerDescription.text = workoutItem.description;
    checkAnyControllerEmpty = false;
    notifyListeners();
  }

  void saveEditWorkout(index) {
    box.putAt(
        index,
        WorkoutItem(
          minutesEdit,
          controllerTitle.text,
          controllerDescription.text,
        ));
    notifyListeners();
  }

  void saveStartOfTraining() async {
    startOfTraining = DateFormat('HH:mm').format(dateTime);
    await box.put('start', startOfTraining);
    notifyListeners();
  }

  void saveEndOfTraining() async {
    endOfTraining = DateFormat('HH:mm').format(dateTime);
    await box.put('end', endOfTraining);
    notifyListeners();
  }

  void saveEditMinutes() {
    minutesEdit = dateTime.minute.toString();
    notifyListeners();
  }

  void saveAddNewMinutes() {
    minutesAddNew = dateTime.minute.toString();
    notifyListeners();
  }
}
