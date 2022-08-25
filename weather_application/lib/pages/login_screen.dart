import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_application/apis/signin.dart';
import 'package:weather_application/apis/signin.dart';
import 'package:weather_application/bloc/login_cubit.dart';
import 'package:weather_application/bloc/login_states.dart';
import 'package:weather_application/components/main_button.dart';
import 'package:weather_application/components/main_textfield.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/local/sharedpref_helper.dart';
import 'package:weather_application/pages/first_screen.dart';
import 'package:weather_application/pages/home_screen.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';
import 'package:weather_application/apis/signin.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => LaVieLoginCubit(),
      child: BlocConsumer<LaVieLoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            if (state.loginModel.message == 'Logged in Successfully') {
              sharedhelper
                  .saveData(
                      key: 'token', value: state.loginModel.data!.accessToken)
                  .then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              });
              print("Mytoken : ${state.loginModel.data!.accessToken}");
            }
          } else {
            print('error ocurred');
            Fluttertoast.showToast(
                msg: "Incorrect email or password",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const firstScreen()),
          );*/
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            MainTextField(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'No Email entered';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                keyboardtype: TextInputType.emailAddress,
                                title: "Email",
                                hint: "Example@gmail.com"),
                            MainTextField(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'No Password entered';
                                  }
                                  if (value.length < 7) {
                                    return 'Please write password at least 8 characters';
                                  }
                                  /*if (!RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                                  return 'Password should contain upper lower letters,numbers and special symbols';
                                }*/
                                  else {
                                    return null;
                                  }
                                },
                                controller: passController,
                                keyboardtype: TextInputType.emailAddress,
                                title: "Password",
                                isPass: true,
                                hint: "********"),
                            ConditionalBuilder(
                              condition: state is! LogInLoadingState,
                              builder: (context) => MainButton(
                                  buttonText: 'Login',
                                  onclick: () {
                                    if (formkey.currentState!.validate()) {
                                      LaVieLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passController.text);

                                      /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainScreen(),
                                        ),
                                      );*/
                                    }
                                  }),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: grey,
                                  ),
                                ),
                                TitleText(
                                    title: '   Or continue with   ',
                                    textStyle: ThemeText.subTitle),
                                const Expanded(
                                  child: Divider(
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                      'assets/images/google logo.png'),
                                  iconSize: 40,
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Image.asset(
                                      'assets/images/facebook logo.png'),
                                  iconSize: 50,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
