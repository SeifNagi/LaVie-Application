import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/apis/models/signin.dart';

import 'package:weather_application/bloc/login_states.dart';
import 'package:weather_application/endpoints/baseurl_for_la_vie.dart';
import 'package:weather_application/local/cachehelepr.dart';
import 'package:weather_application/apis/signin.dart';

class LaVieLoginCubit extends Cubit<LoginStates> {
  LaVieLoginCubit() : super(LogInInititalState());

  static LaVieLoginCubit get(context) => BlocProvider.of(context);
  late LoginModel signInModel;
  void userLogin({required String email, required String password}) {
    emit(
      LogInLoadingState(),
    );
    Diohelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      signInModel = LoginModel.fromJson(value.data);
      print('acesstoken = ${signInModel.data!.accessToken}');
      print('Message = ${signInModel.message}');
      print('User = ${signInModel.data!.user!.email}');
      print(value.data['message']);
      emit(LogInSuccessState(signInModel));
    }).catchError((error) {
      emit(
        LogInErrorState(
          error.toString(),
        ),
      );
      print("error ${error.toString()}");
    });
  }
}
