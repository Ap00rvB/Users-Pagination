import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'user_list_model.dart';

class UserListWidgetVM extends ChangeNotifier {
  List<Person> userList = [];
  int currentPage = 0;
  int pageSize = 30;
  final ScrollController controller = ScrollController();
  final Size size;

  UserListWidgetVM(this.size);

  void dataLoaderListener() {
    log("message");
    if (controller.position.atEdge) {
      log("message");
      loadUsers().then((value) {
        notifyListeners();
      });
    }
  }

  Future<void> loadUsers({int? pageOffset}) async {
    try {
      log('inside');
      var dio = Dio();
      var response = await dio.request(
        'https://dummyjson.com/users?limit=$pageSize&skip=$pageOffset',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> rawUsers = jsonDecode(response.toString())['users'];
        for (Map<String, dynamic> user in rawUsers) {
          userList.add(Person.fromJson(user));
        }
      } else {
        // TODO : Show dialog for error.
        throw Exception("Something went wrong");
      }
    } catch (e) {
      rethrow;
    }
  }

  String getFirstName(int index) {
    return userList[index].firstName;
  }

  String getLastName(int index) {
    return userList[index].lastName;
  }

  String getGender(int index) {
    return userList[index].gender;
  }

  String getAge(int index) {
    return userList[index].age.toString();
  }

  String getPhoneNumber(int index) {
    return userList[index].phone;
  }

  Person getUserData(int index) {
    return userList[index];
  }
}
