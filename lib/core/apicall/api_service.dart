import 'package:first_project/core/apicall/api_constants.dart';
import 'package:first_project/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      print("SUCCESs 1");
      var response = await http.get(url);
      print("SUCCESs 2");

      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
