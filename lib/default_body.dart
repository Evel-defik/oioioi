import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DefaultBody extends StatefulWidget {
  final Widget body;
  final int? currentIndex;
  final String? title;
  final String? leading;
  final bool withBackButton;
  final String? lastSeen;
  final String? actions;
  final void Function()? onTap;
  final void Function()? onTap2;

  const DefaultBody({
    super.key,
    required this.body,
    this.currentIndex,
    this.title,
    this.leading,
    this.withBackButton = false,
    this.lastSeen,
    this.actions,
    this.onTap,
    this.onTap2,
  });

  @override
  State<DefaultBody> createState() => _DefaultBodyState();
}

class _DefaultBodyState extends State<DefaultBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          leadingWidth: 60.w,
          title: widget.title != null
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        widget.title!,
                        style: TextStyle(
                          color: const Color(0xFF36F4EE),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CaviarDreams',
                        ),
                      ),
                    ),
                    if (widget.lastSeen != null) ...[
                      Text(
                        widget.lastSeen!,
                        style: TextStyle(
                          color: const Color(0xFF36F4EE),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CaviarDreams',
                        ),
                      ),
                    ],
                  ],
                )
              : null,
          centerTitle: true,
          backgroundColor: const Color(0xFF000000),
          leading: Center(
            child: GestureDetector(
              child: widget.leading != null
                  ? Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.withBackButton) ...[
                            SvgPicture.asset(
                              'assets/images/arrow_left.svg',
                              width: 12.w,
                              height: 20.h,
                              color: const Color(0xFF36F4EE),
                            ),
                            SizedBox(width: 2.w),
                          ],
                          Text(
                            widget.leading!,
                            style: TextStyle(
                              color: const Color(0xFF36F4EE),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CaviarDreams',
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          actions: [
            widget.onTap2 != null
                ? GestureDetector(
                    onTap: widget.onTap2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Text(
                        widget.actions!,
                        style: TextStyle(
                          color: const Color(0xFF36F4EE),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CaviarDreams',
                        ),
                      ),
                    ),
                  )
                : widget.actions != null && widget.actions!.endsWith("svg")
                    ? SvgPicture.asset(
                        widget.actions!,
                        width: 20.w,
                        height: 20.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF36F4EE),
                          BlendMode.srcIn,
                        ),
                      )
                    : widget.actions != null
                        ? Image.asset(
                            widget.actions!,
                            width: 20.w,
                            height: 20.w,
                          )
                        : const SizedBox.shrink(),
          ],
        ),
        bottomNavigationBar: widget.currentIndex != null
            ? BottomNavigationBar(
                backgroundColor: const Color(0xFF000000),
                currentIndex: widget.currentIndex!,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/contacts.svg',
                      width: 25.w,
                      height: 25.h,
                    ),
                    label: 'Contacts',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/calls.svg',
                      width: 25.w,
                      height: 25.h,
                    ),
                    label: 'Calls',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/chats.svg',
                      width: 25.w,
                      height: 25.h,
                    ),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/settings.svg',
                      width: 25.w,
                      height: 25.h,
                      color: widget.currentIndex == 3
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFFFFFFF0).withOpacity(0.45),
                    ),
                    label: 'Settings',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color(0xFFFFFFF0).withOpacity(0.45),
                unselectedItemColor: const Color(0xFFFFFFFF),
              )
            : null,
        body: widget.body,
      ),
    );
  }
}
