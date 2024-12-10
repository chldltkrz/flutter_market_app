import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/home/_tab/home_tab/widgets/product_list_item.dart';

class HomeTabListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          return ListTile(
            title: ProductListItem(),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
            color: Colors.grey[200],
          );
        },
      ),
    );
  }
}
