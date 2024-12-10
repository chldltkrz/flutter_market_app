import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_write/product_write_page.dart';

class ProductDetailActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO 자기글 아니면 보여주지 않기
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('삭제버튼 터치');
          },
          child: Container(
            width: 50,
            height: 50,
            child: Icon(Icons.delete),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductWritePage();
                },
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            child: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}
