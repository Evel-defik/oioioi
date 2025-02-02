import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C1C1D),
          title: Text(
            'Settings',
            style: TextStyle(
              color: const Color(0xFF36F4EE),
              fontSize: 23.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'CaviarDreams',
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2.w),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: const Color(0xFF36F4EE),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CaviarDreams',
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _ProfileCard(),
              SizedBox(height: 35.h),
              const _Islands(
                children: [
                  _Shablon(
                    icon: 'assets/images/ava2.png',
                    text: 'Jacob Design',
                    isRightArrow: false,
                  ),
                  _Shablon(
                    icon: 'assets/images/plus.svg',
                    text: 'Add Account',
                    isRightArrow: false,
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              const _Islands(
                children: [
                  _Shablon(
                    icon: 'assets/images/notifications.svg',
                    text: 'Saved Messages',
                    isRightArrow: true,
                  ),
                  _Shablon(
                    icon: 'assets/images/recentCalls.svg',
                    text: 'Recent Calls',
                    isRightArrow: true,
                  ),
                  _Shablon(
                    icon: 'assets/images/stickers.svg',
                    text: 'Stickers',
                    isRightArrow: true,
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              const _Islands(
                children: [
                  _Shablon(
                    icon: 'assets/images/and.svg',
                    text: 'Notifications and Sounds',
                    isRightArrow: true,
                  ),
                  _Shablon(
                    icon: 'assets/images/privacy.svg',
                    text: 'Privacy and Security',
                    isRightArrow: true,
                  ),
                  _Shablon(
                    icon: 'assets/images/data.svg',
                    text: 'Data and Storage',
                    isRightArrow: true,
                  ),
                  _Shablon(
                    icon: 'assets/images/appear.svg',
                    text: 'Appearance',
                    isRightArrow: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C1C1D),
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
      child: Row(
        children: [
          Image.asset(
            'assets/images/ava.png',
            width: 66.w,
            height: 66.w,
          ),
          SizedBox(width: 13.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Justin Bebrik',
                style: TextStyle(
                  color: const Color(0xFF36F4EE),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'CaviarDreams',
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '+14046653410',
                style: TextStyle(
                  color: const Color(0xFF36F4EE),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'CaviarDreams',
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                '@pdd',
                style: TextStyle(
                  color: const Color(0xFF36F4EE),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'CaviarDreams',
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/images/arrow_right.svg',
            width: 9.w,
            height: 15.w,
          ),
        ],
      ),
    );
  }
}

class _Shablon extends StatelessWidget {
  final String icon;
  final String text;
  final bool isRightArrow;

  const _Shablon({
    required this.icon,
    required this.text,
    this.isRightArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = icon.toLowerCase().endsWith('.svg');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: [
          if (isSvg) ...[
            SvgPicture.asset(
              icon,
              width: 32.r,
              height: 32.r,
            )
          ] else ...[
            Image.asset(
              icon,
              width: 32.r,
              height: 32.r,
            )
          ],
          SizedBox(width: 15.w),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF36F4EE),
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'CaviarDreams',
            ),
          ),
          if (isRightArrow) ...[
            const Spacer(),
            SvgPicture.asset('assets/images/arrow_right.svg'),
          ],
        ],
      ),
    );
  }
}

class _Islands extends StatelessWidget {
  final List<Widget> children;

  const _Islands({required this.children});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (final child in children) {
      widgets.add(child);
      if (children.last != child) {
        widgets.add(
          Row(
            children: [
              Container(width: 59.w),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  height: 1.h,
                  color: const Color(0xFF545458).withOpacity(0.65),
                ),
              ),
            ],
          ),
        );
      }
    }

    return Container(
      color: const Color(0xFF1C1C1D),
      child: Column(children: widgets),
    );
  }
}
