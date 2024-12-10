import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/widgets/id_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/password_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  '안녕하세요\n아이디와 비밀번호로 로그인해주새요',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                IdTextFormField(controller: idController),
                SizedBox(height: 20),
                PasswordTextFormField(controller: passwordController),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                  child: Text('로그인'),
                ),
              ],
            ),
          )),
    );
  }
}
