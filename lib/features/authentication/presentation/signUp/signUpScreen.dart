import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/authentication/data/profilePictureGenerate.dart';
import 'package:tai/features/authentication/domain/userModel.dart';
import 'package:tai/features/authentication/presentation/login/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool buttonActive = true;

  //  global key for the form on this screen
  final _formKey = GlobalKey<FormState>();

  bool buttonIsDisabled = true;

  void register() async {
    String image = chooseRandomPicture();
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      User? user = userCredential.user;
      await FirebaseFirestore.instance.collection('users').add(UserModel(
              user!.uid,
              userNameController.text.trim(),
              user.email,
              phoneNumberController.text.trim(),
              0.0,
              image)
          .toJson());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } on FirebaseAuthException catch (e) {
      CustomSnackBar.show(context, e.code, true);
      setState(() {
        buttonActive = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: MainButton(
             indicator: buttonActive ? false : true,
            disabled: buttonActive ? false : true,
              //disabled: buttonIsDisabled,
              lightBlue: true,
              text: "Sign Up",
              onpressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                  setState(() {
                    buttonActive = false;
                  });
                  register();

                  
                }
              }),
        ),
        backgroundColor: const Color.fromARGB(154, 0, 0, 0),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),

                const Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Create a short username(max 10 characters)",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        authText: true,
                        onChanged: (p0) {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            setState(() {
                              buttonIsDisabled = false;
                            });
                          } else {
                            setState(() {
                              buttonIsDisabled = true;
                            });
                          }
                        },
                        controller: userNameController,
                        label: "username",
                        labelColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        authText: true,
                        onChanged: (p0) {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            setState(() {
                              buttonIsDisabled = false;
                            });
                          } else {
                            setState(() {
                              buttonIsDisabled = true;
                            });
                          }
                        },
                        controller: emailController,
                        label: "Email",
                        labelColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        authText: true,
                        onChanged: (p0) {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            setState(() {
                              buttonIsDisabled = false;
                            });
                          } else {
                            setState(() {
                              buttonIsDisabled = true;
                            });
                          }
                        },
                        controller: phoneNumberController,
                        label: "Phone number",
                        labelColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        obscureText: true,
                        authText: true,
                        onChanged: (p0) {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            setState(() {
                              buttonIsDisabled = false;
                            });
                          } else {
                            setState(() {
                              buttonIsDisabled = true;
                            });
                          }
                        },
                        controller: passwordController,
                        label: "Password",
                        labelColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 23, 109, 179)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      // MainButton(
                      //     //disabled: buttonIsDisabled,
                      //     lightBlue: true,
                      //     text: "Sign Up",
                      //     onpressed: () {
                      //       if (_formKey.currentState!.validate()) {
                      //         // If the form is valid, display a snackbar. In the real world,
                      //         // you'd often call a server or save the information in a database.
                      //         register();

                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //               content: Text('Processing Data')),
                      //         );
                      //       }
                      //     })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
