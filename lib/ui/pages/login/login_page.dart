import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';
import 'package:flutter_market_app/ui/pages/home/home_page.dart';
import 'package:flutter_market_app/ui/pages/login/login_view_model.dart';
import 'package:flutter_market_app/ui/widgets/id_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/password_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                Consumer(builder: (context, ref, child) {
                  // login 요청 when validation is successful
                  return ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {}
                      final viewModel = ref.read(loginViewModel);
                      final loginResult = await viewModel.login(
                        username: idController.text,
                        password: passwordController.text,
                      );
                      if (loginResult) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                          // 기존 네비게이터 스택에 남아있는 페이지들이 하나씩 route인자로 넘어와서 함수가 실행됨
                          // 페이지 스택에 남길지 여부 리턴;
                        }), (route) {
                          return false;
                        });
                      } else {
                        SnackbarUtil.showSnackBar(
                            context, '아이디 또는 비밀번호가 일치하지 않습니다.');
                      }
                    },
                    child: Text('로그인'),
                  );
                }),
              ],
            ),
          )),
    );
  }
}
