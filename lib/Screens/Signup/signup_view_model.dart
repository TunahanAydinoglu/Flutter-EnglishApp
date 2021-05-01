import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'signup_view_model.g.dart';

class SignupViewModel = _SignupViewModelBase with _$SignupViewModel;

abstract class _SignupViewModelBase with Store {
  @action
  Future<bool> registerPost() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://localhost:5000/api/auth/register'));
    request.body =
        '''{"name":"Dilan Cetinkaya","email":"dilan@cetinkaya.com","password":"070707"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
