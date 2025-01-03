import 'package:flutter/material.dart';

class ChatDetailBottomSheet extends StatefulWidget {
  ChatDetailBottomSheet(this.bottomPadding);

  final double bottomPadding;

  @override
  State<ChatDetailBottomSheet> createState() => _ChatDetailBottomSheetState();
}

class _ChatDetailBottomSheetState extends State<ChatDetailBottomSheet> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onSend() {
    print('OnSend Touched');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: 70 + widget.bottomPadding,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (v) => onSend(),
                      controller: controller,
                    ),
                  ),
                  GestureDetector(
                    onTap: onSend,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.transparent,
                      child: Icon(
                        Icons.send,
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.bottomPadding,
            ),
          ],
        ),
      ),
    );
  }
}
