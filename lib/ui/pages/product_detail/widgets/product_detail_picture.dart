import 'package:flutter/material.dart';

class ProductDetailPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      // pageview사용시 부모 height가 존재해야함
      child: PageView.builder(
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
