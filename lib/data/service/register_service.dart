import 'package:form1/data/model/register_model.dart';

class RegisterService {
  Future<RegisterModel> register(RegisterModel data) async {
    await Future.delayed(Duration(seconds: 5));
    print("service: ${data.toJson()}");
    return data;
  }
}
