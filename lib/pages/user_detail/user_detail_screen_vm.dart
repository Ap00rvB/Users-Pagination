import 'package:flutter/cupertino.dart';

import '../home_page/user_list_model.dart';

class UserDetailScreenVM extends ChangeNotifier {
  final Person user;

  UserDetailScreenVM(this.user);

  String getFirstName(int index) {
    return user.firstName;
  }

  String getLastName(int index) {
    return user.lastName;
  }

  String getGender(int index) {
    return user.gender;
  }

  String getPhoneNumber(int index) {
    return user.phone;
  }
}
