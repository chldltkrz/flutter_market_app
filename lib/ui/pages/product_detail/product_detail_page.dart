import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_detail/widgets/product_detail_actions.dart';
import 'package:flutter_market_app/ui/pages/product_detail/widgets/product_detail_body.dart';
import 'package:flutter_market_app/ui/pages/product_detail/widgets/product_detail_bottom_sheet.dart';
import 'package:flutter_market_app/ui/pages/product_detail/widgets/product_detail_picture.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // scaffold가 있는 위치에서 MediaQUery를 날려야한다
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
        appBar: AppBar(
          actions: [
            ProductDetailActions(),
          ],
        ),
        bottomSheet: ProductDetailBottomSheet(bottom),
        body: ListView(
          children: [
            ProductDetailPicture(),
            ProductDetailBody(),
          ],
        ));
  }
}
