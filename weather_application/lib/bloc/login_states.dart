import 'package:weather_application/apis/signin.dart';

abstract class LoginStates {}

class LogInInititalState extends LoginStates {}

class LogInSuccessState extends LoginStates {
  final LoginModel loginModel;
  LogInSuccessState(this.loginModel);
}

class LogInErrorState extends LoginStates {
  final String error;
  LogInErrorState(this.error);
}

class LogInLoadingState extends LoginStates {}
