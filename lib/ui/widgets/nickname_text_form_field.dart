import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/validator_util.dart';

class NicknameTextFormField extends StatelessWidget {
  TextEditingController controller;
  NicknameTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      decoration: InputDecoration(hintText: '닉네임를 입력해주세요!'),
      validator: ValidatorUtil.validatorNickname,
    );
  }
}
