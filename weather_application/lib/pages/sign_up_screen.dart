import 'package:flutter/material.dart';
import 'package:weather_application/apis/signup.dart';
import 'package:weather_application/components/main_button.dart';
import 'package:weather_application/components/main_textfield.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/pages/main_screen.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  ///api/v1/auth/signup
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainTextField(
                        width: width / 2.55,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'No Name entered';
                          }
                          if (value.length < 3) {
                            return 'Please write your name correctly';
                          } else {
                            return null;
                          }
                        },
                        controller: firstNameController,
                        keyboardtype: TextInputType.text,
                        title: "First Name",
                        hint: "xxx"),
                    SizedBox(
                      width: 10,
                    ),
                    MainTextField(
                        width: width / 2.55,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'No Name entered';
                          }
                          if (value.length < 3) {
                            return 'Please write your name correctly';
                          } else {
                            return null;
                          }
                        },
                        controller: lastNameController,
                        keyboardtype: TextInputType.text,
                        title: "Last Name",
                        hint: "xxx"),
                  ],
                ),
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
                      } */
                      else {
                        return null;
                      }
                    },
                    controller: passController,
                    keyboardtype: TextInputType.emailAddress,
                    title: "Password",
                    isPass: true,
                    hint: "********"),
                MainTextField(
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'No Password entered';
                      }
                      if (value.length < 7) {
                        return 'Please write password at least 8 characters';
                      }
                      if (confirmPassController.text != passController.text) {
                        return 'Please write same password';
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
                    controller: confirmPassController,
                    keyboardtype: TextInputType.emailAddress,
                    title: "Confirmation Password",
                    isPass: true,
                    hint: "********"), //S@if123456
                MainButton(
                  buttonText: 'Sign up',
                  onclick: () {
                    if (formkey.currentState!.validate()) {
                      signup(
                        firstNameController.text,
                        lastNameController.text,
                        emailController.text,
                        passController.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
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
                      icon: Image.asset('assets/images/google logo.png'),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/facebook logo.png'),
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
    );
  }
}
