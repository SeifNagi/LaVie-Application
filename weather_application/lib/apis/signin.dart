String status = 'Failed';

class LoginModel {
  String? type;
  String? message;
  logindata? data;

  LoginModel({this.type, this.message, this.data});
  LoginModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? logindata.fromJson(json['data']) : null;
  }
}

class logindata {
  int? id;
  userDetails? user;
  String? accessToken;
  logindata({this.id, this.user, this.accessToken});

  logindata.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? userDetails.fromJson(json['user']) : null;
    id = json['id'];
    accessToken = json['accessToken'];
  }
}

class userDetails {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  userDetails(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.imageUrl,
      this.address,
      this.role});
  userDetails.fromJson(Map<String, dynamic> json) {
    userId = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}
/*Future<String> signin(String email, String password) async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signin'));
  request.body = json.encode({"password": password, "email": email});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
  return status;
}*/
