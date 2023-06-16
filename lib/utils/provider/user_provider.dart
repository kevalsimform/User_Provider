import 'package:flutter/material.dart';

import '../../data/user_data.dart';
import '../../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = UserData.users;

  void addUser(User user) {
    UserData.users.add(user);
    notifyListeners();
  }

  void editUserAt(int index, User user) {
    UserData.users[index] = user;
    notifyListeners();
  }

  void deleteUserAt(User value) {
    if (UserData.users.contains(value)) {
      UserData.users.remove(value);
      notifyListeners();
    }
  }
}
