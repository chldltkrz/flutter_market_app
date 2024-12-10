import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/join/join_page.dart';

class AddressSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: TextField(
              onSubmitted: (value) {
                print(value);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  hintText: '동명 (읍, 면)을 입력하세요'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('현재 위치로 찾기'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return JoinPage();
                              }),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Colors.transparent,
                            alignment: Alignment.centerLeft,
                            child: Text('Address Search Page'),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
