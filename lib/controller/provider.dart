import 'package:flutter/material.dart';
import 'package:machinetask2/model/data_model.dart';
import 'package:machinetask2/service/api_service.dart';

class UserListsProvdier extends ChangeNotifier {
  List<DataModel> userList = [];
  Future<List<DataModel>>getData() async {
    userList = await ApiService().getData();
    return userList;
  }
}
