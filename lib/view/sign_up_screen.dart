import 'package:flutter/material.dart';
import 'package:mvvm/repository/components/round_button.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    emailcontroller.dispose();
    passwordcontroller.dispose();

    emailfocusnode.dispose();
    passwordfocusnode.dispose();

    _obsecurepassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                focusNode: emailfocusnode,
                controller: emailcontroller,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'enter email',
                  labelText: 'Email',
                  icon: Icon(Icons.mail),
                ),
                onFieldSubmitted: ((value) {
                  GeneralUtils.focusnodechange(
                      emailfocusnode, passwordfocusnode, context);
                })),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurepassword,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _obsecurepassword.value,
                  focusNode: passwordfocusnode,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: 'enter password',
                      labelText: 'Password',
                      icon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurepassword.value = !_obsecurepassword.value;
                          },
                          child: _obsecurepassword.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility))),
                );
              },
            ),
            SizedBox(
              height: height * .045,
            ),
            RoundButton(
                title: 'Sign Up',
                onpress: () {
                  if (emailcontroller.text.isEmpty) {
                    GeneralUtils.showflushbarmessage(
                        'Please enter valid email address', context);
                  }
                  if (emailcontroller.text.isEmpty &
                      passwordcontroller.text.isEmpty) {
                    GeneralUtils.showflushbarmessage(
                        'Please enter login details or sign up', context);
                  } else if (passwordcontroller.text.isEmpty) {
                    GeneralUtils.showflushbarmessage(
                        'Please enter password', context);
                  } else if (passwordcontroller.text.length < 6) {
                    GeneralUtils.showflushbarmessage(
                        'Please enter a password containing more than 6 characters',
                        context);
                  } else {
                    // print('api hit');

                    Map data = {
                      'email': emailcontroller.text.toString(),
                      'password': passwordcontroller.text.toString()
                    };
                    authviewmodel.authSignapi(data, context);
                    print('api hit');
                    print(emailcontroller.text.toString());
                    print(passwordcontroller.text.toString());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
