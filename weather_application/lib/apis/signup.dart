import 'dart:convert';
import 'package:http/http.dart' as http;

void signup(String fname, String lname, String email, String password) async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signup'));
  request.body = json.encode({
    "firstName": fname,
    "lastName": lname,
    "email": email,
    "password": password
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
//Seifnagi123@yahoo.com
//password: S@if23&%ghbhj-=

/*

seif.nagi.kozman@gmail.com
Seif@2805522 */