import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';

class HomeTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bottom 속성 사용 불가 Scaffold에서 내에서만 사용가능
    return AppBar(
      title: Text('온천동'),
      actions: [
        GestureDetector(
          onTap: () {
            SnackbarUtil.showSnackBar(context, '기능준비중');
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
