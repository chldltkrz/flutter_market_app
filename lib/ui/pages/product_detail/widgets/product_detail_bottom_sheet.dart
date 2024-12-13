import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/chat_detail_page.dart';
import 'package:flutter_market_app/ui/pages/home/_tab/home_tab/home_tab_view_model.dart';
import 'package:flutter_market_app/ui/pages/product_detail/product_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  ProductDetailBottomSheet(this.bottomPadding, this.productId);

  final double bottomPadding;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(productDetailViewModel(productId));
      final vm = ref.read(productDetailViewModel(productId).notifier);
      if (state == null) {
        return SizedBox();
      }

      return Container(
        height: 50 + bottomPadding,
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              height: 0,
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await vm.like();
                      if (result) {
                        ref.read(homeTabViewModel.notifier).fetchProducts();
                      }
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.transparent,
                        child: Icon(state.myLlike
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart)),
                  ),
                  VerticalDivider(
                    width: 20,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: Text(NumberFormat('#,###원').format(state.price),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO 구현
                        vm.createChat();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChatDetailPage();
                        }));
                      },
                      child: Text('채팅하기',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: bottomPadding,
            )
          ],
        ),
      );
    });
  }
}
