// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';

class MainTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  Function? onSubmit;
  final FormFieldValidator<String> validate;
  Function? onTap;
  final Widget? widget;
  IconData? prefixIcon;
  double width;
  double height;
  bool isbold;
  bool isPass;
  MainTextField({
    Key? key,
    this.widget,
    this.prefixIcon,
    required this.validate,
    required this.controller,
    required this.keyboardtype,
    this.width = double.infinity,
    this.height = 35,
    this.isbold = false,
    required this.title,
    required this.hint,
    this.isPass = false,
    Function? onTap,
    Function? onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: title,
          textStyle: ThemeText.textfieldLabel,
        ),
        Container(
          height: height,
          width: width,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: isPass,
                  controller: controller,
                  validator: validate,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  style: const TextStyle(color: black),
                  decoration: InputDecoration(
                    /*prefix: prefixIcon != null
                        ? Icon(
                            prefixIcon,
                            color: green,
                            size: 20,
                          )
                        : Container(),*/
                    contentPadding: const EdgeInsets.only(left: 12, top: 10),
                    isDense: true,
                    hintText: hint,
                    border: InputBorder.none,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: white,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              widget == null ? Container() : Container(child: widget),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
