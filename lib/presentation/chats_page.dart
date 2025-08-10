import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oioioi/default_body.dart';
import 'package:oioioi/presentation/message_page.dart';
import 'package:oioioi/utils/json/chats.dart';

enum ChatTypes { private, group, channel, bot }

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      title: 'Chats',
      actions: 'assets/images/create_chat.svg',
      leading: "Edit",
      currentIndex: 2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
          child: Column(
            children: [
              SizedBox(
                height: 36.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: const Color(0xFF36F4EE),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CaviarDreams',
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF36F4EE),
                      size: 20.w,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF1A1A1A),
                    contentPadding: EdgeInsets.only(top: 12.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    color: const Color(0xFF36F4EE),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ChatsJson.chats.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MessagePage(chat: ChatsJson.chats[index]),
                        ),
                      );
                    },
                    child: Chat(
                      types: ChatsJson.chats[index]['types'],
                      image: ChatsJson.chats[index]['image'],
                      message:
                          ChatsJson.chats[index]['messages'].last['message'],
                      chatName: ChatsJson.chats[index]['chatName'],
                      memberName:
                          ChatsJson.chats[index]['messages'].last['memberName'],
                      isPinned: ChatsJson.chats[index]['isPinned'],
                      date: ChatsJson.chats[index]['messages'].last['date'],
                      isRead: ChatsJson.chats[index]['messages'].last['isRead'],
                      isMute: ChatsJson.chats[index]['isMute'],
                      isOnline: ChatsJson.chats[index]['isOnline'],
                      counter: ChatsJson.chats[index]['counter'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  final ChatTypes types;
  final String image;
  final String chatName;
  final bool isMute;
  final String? memberName;
  final String message;
  final bool isRead;
  final String date;
  final int? counter;
  final bool isPinned;
  final bool? isOnline;

  const Chat({
    super.key,
    required this.types,
    required this.image,
    required this.chatName,
    this.memberName,
    required this.message,
    required this.isRead,
    required this.date,
    required this.isPinned,
    required this.isMute,
    this.counter,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.5,
        children: [
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF666666),
            foregroundColor: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/unread.svg',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Unread',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF08A723),
            foregroundColor: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/pin2.svg',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Pin',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.75,
        children: [
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFCD7800),
            foregroundColor: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/mute2.svg',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Mute',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFC60C0C),
            foregroundColor: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/delete.svg',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF636366),
            foregroundColor: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/archive.svg',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Archive',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      child: Container(
        height: 100.h,
        color: const Color(0xFF1C1C1D),
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 8.h),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    image,
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isOnline != null && isOnline!) ...[
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 15.w,
                      height: 15.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF000000),
                          width: 2.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chatName,
                              style: TextStyle(
                                color: const Color(0xFF36F4EE),
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CaviarDreams',
                              ),
                            ),
                            if (memberName != null) ...[
                              SizedBox(height: 4.h),
                              Text(
                                memberName!,
                                style: TextStyle(
                                  color: const Color(0xFF36F4EE),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'CaviarDreams',
                                ),
                              ),
                            ],
                            SizedBox(height: 4.h),
                            Text(
                              message,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: const Color(0xFF36F4EE),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'CaviarDreams',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              if (isRead) ...[
                                SvgPicture.asset(
                                  'assets/images/read.svg',
                                  width: 17.h,
                                  height: 10.h,
                                ),
                                SizedBox(width: 4.w),
                              ],
                              Text(
                                date,
                                style: TextStyle(
                                  color: const Color(0xFF36F4EE),
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'CaviarDreams',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              if (counter != null) ...[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: isMute
                                        ? const Color(0xFF636366)
                                        : const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    counter.toString(),
                                    style: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'CaviarDreams',
                                    ),
                                  ),
                                ),
                              ],
                              if (isPinned) ...[
                                SvgPicture.asset(
                                  'assets/images/pin.svg',
                                  width: 21.h,
                                  height: 22.h,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 1.h,
                    width: double.infinity,
                    color: const Color(0xFF545458).withOpacity(0.65),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
