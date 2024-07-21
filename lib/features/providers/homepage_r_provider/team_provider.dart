import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quick_workout/features/models/team/player_info.dart';

class TeamProvider extends ChangeNotifier {
  var box = Hive.box('team');
 final TextEditingController controllerPlayerName = TextEditingController();
final  TextEditingController controllerPlayerPosition = TextEditingController();
final  TextEditingController controllerAge = TextEditingController();
final  TextEditingController controllerSalary = TextEditingController();
final  TextEditingController controllerDescription = TextEditingController();
  bool checkAnyControllerEmpty = true;
  Uint8List? imageUint8List;

  void clearTextControllers() {
    imageUint8List = null;
    controllerAge.clear();
    controllerDescription.clear();
    controllerPlayerName.clear();
    controllerPlayerPosition.clear();
    controllerSalary.clear();
    checkAnyControllerEmpty = true;
    notifyListeners();
  }

  void checkControllerEmpty() {
    final listOfControllers = [
      controllerPlayerName,
      controllerAge,
      controllerDescription,
      controllerPlayerPosition,
      controllerSalary
    ];
    checkAnyControllerEmpty = listOfControllers.any((e) => e.text == '');
    notifyListeners();
  }

  void deleteItem(index) {
    box.deleteAt(index);
    notifyListeners();
  }

  Future pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return null;
    final List<int> imageBytes = await pickedImage.readAsBytes();
    imageUint8List = Uint8List.fromList(imageBytes);
    notifyListeners();
  }

  void addPlayer() {
    final parsedNumber =
        double.parse(controllerSalary.text.replaceAll(',', ''));
    final formattedNumber =
        NumberFormat('#,##0.00', 'en_US').format(parsedNumber).toString();
    box.add(PlayerInfo(
      imageUint8List,
      controllerPlayerName.text,
      controllerAge.text,
      controllerPlayerPosition.text,
      formattedNumber,
      controllerDescription.text,
    ));
    notifyListeners();
  }

  void editPlayer(index) {
    PlayerInfo playerInfo = box.getAt(index);

    imageUint8List = playerInfo.avatar;
    controllerPlayerName.text = playerInfo.playerName;
    controllerPlayerPosition.text = playerInfo.playerPosition;
    controllerSalary.text = playerInfo.playerSalary;
    controllerDescription.text = playerInfo.description;
    controllerAge.text = playerInfo.playerAge;
    checkAnyControllerEmpty = false;
    notifyListeners();
  }

  void saveEditPlayer(index) {
    final parsedNumber =
        double.parse(controllerSalary.text.replaceAll(',', ''));
    final formattedNumber =
        NumberFormat('#,##0.00', 'en_US').format(parsedNumber).toString();
    box.putAt(
        index,
        PlayerInfo(
          imageUint8List,
          controllerPlayerName.text,
          controllerAge.text,
          controllerPlayerPosition.text,
          formattedNumber,
          controllerDescription.text,
        ));
    notifyListeners();
  }
}
