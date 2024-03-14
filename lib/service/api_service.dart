
import 'package:dio/dio.dart';
import 'package:machinetask2/constants/constants.dart';
import 'package:machinetask2/model/data_model.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<DataModel>> getData() async {
    var response = await dio.get(Constants.baseUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonList = response.data;
      List users = jsonList["data"];
      return users.map((user) => DataModel.fromJson(user)).toList();
    } else {
      print(response.statusCode);
      throw Exception('failed to get data');
    }
  }
}
