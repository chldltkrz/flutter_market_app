import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/chat_detail_page.dart';
import 'package:flutter_market_app/ui/widgets/user_profile_image.dart';

class ChatTabListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return item();
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }

  Widget item() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ChatDetailPage();
              },
            ),
          );
        },
        child: Container(
          color: Colors.transparent,
          height: 80,
          child: Row(
            children: [
              UserProfileImage(
                dimension: 50,
                imgUrl: 'https://picsum.photos/200/300',
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('홍길동',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 4),
                        Text('1분전',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Text('네고 가능한가요:'),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
