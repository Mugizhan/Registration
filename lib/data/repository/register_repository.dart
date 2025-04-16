import 'package:form1/data/model/register_model.dart';
import 'package:form1/data/service/register_service.dart';

class RegisterRepository {
  final RegisterService _registerService = RegisterService();

  Future<RegisterModel> storeData(RegisterModel data) {
    return _registerService.register(data);
  }
}
