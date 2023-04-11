import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/gets/api_controller.dart';
import '../../controllers/utils/colors.dart';
import '../../controllers/utils/helper_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<ApiController>(
            init: ApiController(),
            builder: (authCon) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaHeight(context) * .05,
                    ),
                    SizedBox(
                      width: mediaWidth(context) * .9,
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: mediaHeight(context) * .05,
                    ),
                    SizedBox(
                      width: mediaWidth(context),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: mediaWidth(context) * .9,
                              child: textField(
                                hint: "User Name/User id",
                                controller: authCon.nameController,
                              ),
                            ),
                            SizedBox(
                              height: mediaHeight(context) * .03,
                            ),
                            SizedBox(
                              width: mediaWidth(context) * .9,
                              child: passwordField(
                                hint: "Password",
                                controller: authCon.passwordController,
                                isVisible: authCon.getIsSecure,
                                authCon: authCon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaHeight(context) * .01,
                    ),
                    rememberMe(context),
                    SizedBox(
                      height: mediaHeight(context) * .15,
                    ),
                    authCon.getIsLoading == true
                        ? const SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          )
                        : buttonBig(
                            onClick: () {
                              if (authCon.nameController.text.isNotEmpty &&
                                  authCon.passwordController.text.isNotEmpty) {
                                authCon.login();
                              } else {
                                print("Please fill all the field");
                                Get.snackbar(
                                  "Error",
                                  "Please fill all the field",
                                  colorText: backgroundColor,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: darkRedColor.withOpacity(.8),
                                );
                              }
                            },
                            label: "Log In",
                            context: context,
                          ),
                    SizedBox(
                      height: mediaHeight(context) * .05,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget rememberMe(BuildContext context) {
    return SizedBox(
      width: mediaWidth(context) * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: bodyTextDarkColor,
                      width: 1,
                    )),
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 5,
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: Transform.scale(
                    scale: .8,
                    child: Checkbox(
                      splashRadius: 1,
                      visualDensity: VisualDensity.compact,
                      value: isRemember,
                      checkColor: bodyTextDarkColor,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return primaryColor2;
                        }
                        return backgroundColor;
                      }),
                      onChanged: (value) {
                        print("Pressed $value");

                        if (value == null) {
                          setState(() {
                            isRemember = true;
                          });
                        } else {
                          setState(() {
                            isRemember = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Remember me',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textField({
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      // height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.dmSans(
          fontSize: 12,
          color: headerColorDark,
          height: 1,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: hint,
          fillColor: textFieldBgColor,
          filled: true,
          hintStyle: GoogleFonts.dmSans(
              fontSize: 12,
              color: inactiveDotColor,
              height: 0,
              fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: backgroundColor,
              width: 0.4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: backgroundColor,
              width: 0.4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: backgroundColor,
              width: 0.4,
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordField({
    required String hint,
    required TextEditingController controller,
    required bool isVisible,
    required ApiController authCon,
  }) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5.0), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
          spreadRadius: 0,
          blurStyle: BlurStyle.normal,
        ),
      ]),
      child: TextFormField(
        controller: controller,
        obscureText: isVisible,
        style: GoogleFonts.dmSans(
          fontSize: 12,
          color: headerColorDark,
          height: 0,
        ),
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          hintText: hint,
          hintStyle: GoogleFonts.dmSans(
              fontSize: 12,
              color: inactiveDotColor,
              height: 0,
              fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: backgroundColor,
              width: 0.4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: backgroundColor,
              width: 0.4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: backgroundColor,
              width: 0.4,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                authCon.changeVisibility();
              },
              child: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: buttonColorMain,
                size: 18,
              ),
            ),
          ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      ),
    );
  }

  Widget buttonBig(
      {required Function onClick,
      required String label,
      required BuildContext context}) {
    return Container(
      width: mediaWidth(context) * .9,
      height: 53,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5.0), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.15),
          blurRadius: 10,
          offset: const Offset(0, 4),
          spreadRadius: 0,
          blurStyle: BlurStyle.normal,
        ),
      ]),
      child: MaterialButton(
        elevation: 0,
        height: 53,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: buttonColorMain,
        child: Text(
          label,
          style: const TextStyle(fontSize: 14, color: backgroundColor),
        ),
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}
