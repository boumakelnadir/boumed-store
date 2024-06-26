import 'package:boumedstore/helper/firebase/create_account.dart';
import 'package:boumedstore/views/sign_in_view.dart';
import 'package:boumedstore/widgets/custom_botton.dart';
import 'package:boumedstore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = 'Log up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/pexels-bhylviu-14464685.jpg'))),
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
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  const CustomTextFormField(
                    hintText: 'Full Name',
                    keyboardType: TextInputType.name,
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
                              SignInView.id, (route) => false);
                        },
                        child: const Text(
                          'I have an Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  isloading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : CustomBotton(
                          text: 'Sign Up',
                          onTap: () async {
                            isloading = true;
                            setState(() {});
                            if (_globalKey.currentState!.validate()) {
                              await createAcount(
                                context,
                                email: email.text,
                                password: password.text,
                              );
                              isloading = false;
                              setState(() {});
                            }
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
