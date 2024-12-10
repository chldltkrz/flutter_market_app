import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/validator_util.dart';

class IdTextFormField extends StatelessWidget {
  TextEditingController controller;
  IdTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      decoration: InputDecoration(hintText: 'id를 입력해주세요!'),
      validator: ValidatorUtil.validatorId,
    );
  }
}
