import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oioioi/default_body.dart';
import 'package:oioioi/presentation/info2_page.dart';

class MessagePage extends StatefulWidget {
  final Map<String, dynamic> chat;

  const MessagePage({super.key, required this.chat});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      title: 'Martha Craig',
      actions: 'assets/images/albert.png',
      leading: 'Chats',
      lastSeen: 'just now',
      withBackButton: true,
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Info2Page())),
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chat_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.chat['messages'].length,
                itemBuilder: (context, index) {
                  final message = widget.chat['messages'][index];
                  final text = message['message'];
                  final isMe = message['isMe'] == true;
                  final time = message['time'];
                  // final data = message['data'];
                  // final isRead = message['isRead'] == true;

                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 55.w),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Text(time),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            const _InputBar(),
          ],
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: const Color(0xFF000000),
      child: Row(
        children: [
          GestureDetector(
            child: SvgPicture.asset('assets/images/screpka.svg'),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                hintText: 'Message',
                filled: true,
                fillColor: const Color(0xFF7F7F7F),
              ),
            ),
          ),
          GestureDetector(
            child: SvgPicture.asset('assets/images/micro.svg'),
          ),
        ],
      ),
    );
  }
}
