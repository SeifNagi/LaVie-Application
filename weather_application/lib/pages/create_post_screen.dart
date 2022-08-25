import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weather_application/components/main_button.dart';
import 'package:weather_application/components/main_textfield.dart';
import 'package:weather_application/components/title_text.dart';
import 'package:weather_application/utils/colors/main_used_colors.dart';
import 'package:weather_application/utils/styles/text_style.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: TitleText(
          title: 'Create New Post',
          textStyle: ThemeText.mainTitle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(color: white),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    //color: white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: green, width: 2),
                    ),
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : MainButton(
                            buttonTextColor: green,
                            buttonBacgroundColor: white,
                            buttonText: '         + \n Add photo',
                            onclick: () {
                              _openImagePicker();
                            },
                          ),
                  ),
                  MainTextField(
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
                      controller: title,
                      keyboardtype: TextInputType.text,
                      title: 'Title',
                      hint: ''),
                  MainTextField(
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
                      height: height / 5,
                      controller: description,
                      keyboardtype: TextInputType.text,
                      title: 'Description',
                      hint: ''),
                  MainButton(buttonText: 'Post', onclick: () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
