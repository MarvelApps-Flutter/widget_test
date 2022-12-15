import 'package:flutter/material.dart';
import 'package:loginunittest/constant/constant_value.dart';
import 'package:loginunittest/view/home_view.dart';
import 'package:loginunittest/view/signup.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/common_widget.dart';
import '../helper/email_validation.dart';
import '../helper/password_validation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller_name = TextEditingController();
  final TextEditingController _controller_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(ConstantValue.LOGIN_BUTTON),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Center(
            child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                image(),
                // const SizedBox(
                //   height: 20,
                // ),
                username(),
                const SizedBox(
                  height: 20,
                ),
                password(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final prefs = await SharedPreferences.getInstance();
                        setState(() {
                          var email = prefs.get("email");
                          var password = prefs.get("password");
                          if (email == _controller_name.text &&
                              password == _controller_password.text) {
                            changeRoute() async {
                              await Future.delayed(const Duration(seconds: 1),
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeView()),
                                );
                              });
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Credentials do not match')));
                          }
                        });
                      }
                    },
                    child: Text(ConstantValue.LOGIN_BUTTON)),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Signup())));
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'New User??   '),
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget username() {
    return TextFormField(
      key: const Key('field email'),
      controller: _controller_name,
      //autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Enter professional email id',
        labelText: 'Email *',
      ),

      validator: (value) {
        //return value!.isEmpty ? 'Please enter your name' : null;
        return EmailFieldValidator.validate(value!);
      },
    );
  }

  Widget password() {
    return TextFormField(
      key: const Key('field pass'),
      controller: _controller_password,
      //autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'Strong password?',
        labelText: 'Password *',
      ),

      validator: (value) {
        // return value!.isEmpty ? 'Please enter password' : null;
        return PasswordFieldValidator.validate(value!);
      },
    );
  }
}
