import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ChatTypes {
  private,
  group,
  channel,
}

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          title: Text(
            "Chats",
            style: TextStyle(
              color: const Color(0xFF36F4EE),
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'CaviarDreams',
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF000000),
          leading: Center(
            child: GestureDetector(
              child: Text(
                "Edit",
                style: TextStyle(
                  color: const Color(0xFF36F4EE),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'CaviarDreams',
                ),
              ),
            ),
          ),
          actions: [
            SvgPicture.asset(
              'assets/images/create_chat.svg',
              width: 20.w,
              height: 20.w,
              colorFilter: const ColorFilter.mode(
                Color(0xFF36F4EE),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: const Color(0xFF000000),
        //   items: [],
        // ),
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
                const Chat(
                  types: ChatTypes.private,
                  image: 'assets/images/saved_massages.png',
                  message: 'image.jpeg',
                  chatName: 'Saved Messages',
                  isPinned: true,
                  date: 'Fri',
                  isRead: true,
                  isMute: false,
                  isOnline: true,
                ),
              ],
            ),
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
  final bool isOnline;

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
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            backgroundColor: const Color(0xFFE74C3C),
            foregroundColor: const Color(0xFFFFFFFF),
          ),
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.archive,
            backgroundColor: const Color(0xFF636366),
            foregroundColor: const Color(0xFFFFFFFF),
          ),
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.notifications_off,
            backgroundColor: const Color(0xFF636366),
            foregroundColor: const Color(0xFFFFFFFF),
          ),
        ],
      ),
      child: Container(
        color: const Color(0xFF1C1C1D),
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
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
                if (isOnline) ...[
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
            Column(
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
                  style: TextStyle(
                    color: const Color(0xFF36F4EE),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CaviarDreams',
                  ),
                ),
              ],
            ),
            const Spacer(),
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
            )
          ],
        ),
      ),
    );
  }
}
