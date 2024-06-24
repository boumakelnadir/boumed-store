import 'package:boumedstore/helper/firebase/sign_in.dart';
import 'package:boumedstore/views/sign_up_view.dart';
import 'package:boumedstore/widgets/custom_botton.dart';
import 'package:boumedstore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static String id = 'Log in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey();
  bool isloading = false;
  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _globalKey,
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Image.asset(
                    'assets/logo/boumed.png',
                    height: 250,
                    width: 250,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Email',
                    mycontroller: email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    showIcon: true,
                    mycontroller: password,
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SignUpView.id, (route) => false);
                        },
                        child: const Text(
                          "I haven't an Account",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  isloading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomBotton(
                          text: 'Sign in',
                          onTap: () async {
                            isloading = true;
                            setState(() {});
                            if (_globalKey.currentState!.validate()) {
                              await singInAcount(
                                context,
                                email: email.text,
                                password: password.text,
                              );
                            }
                            isloading = false;
                            setState(() {});
                          },
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
