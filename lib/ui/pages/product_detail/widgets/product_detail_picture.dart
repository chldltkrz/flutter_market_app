import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_detail/product_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailPicture extends StatelessWidget {
  ProductDetailPicture(this.productId);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (contex, ref, child) {
      final state = ref.watch(productDetailViewModel(productId));
      final imageFiles = state?.imageFiles ?? [];

      return SizedBox(
        height: 500,
        // pageview사용시 부모 height가 존재해야함
        child: PageView.builder(
          itemBuilder: (context, index) {
            return Image.network(
              imageFiles[index].url,
              fit: BoxFit.cover,
            );
          },
          itemCount: imageFiles.length,
        ),
      );
    });
  }
}
