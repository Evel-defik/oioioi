import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oioioi/default_body.dart';
import 'package:oioioi/presentation/contact_info_page.dart';
import 'package:oioioi/theme/app_text_styles.dart';

class Info2Page extends StatelessWidget {
  const Info2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      title: 'Info',
      leading: 'Back',
      actions: 'Edit',
      onTap2: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactInfoPage()),
        );
      },
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 15.h,
          left: 15.w,
          bottom: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Zack_ava.png',
                  width: 66.h,
                  height: 66.h,
                ),
                SizedBox(width: 13.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text('Zack John', style: CaviarDreams500.s19),
                      ),
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          'online',
                          style: CaviarDreams400.s15
                              .apply(color: const Color(0xFFAB25D3)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Shablon(s1: 'main', s2: '+998 97 444 67 17'),
                  const _Shablon(s1: 'home', s2: '+998 90 934 50 44'),
                  const _Shablon(
                    s1: 'bio',
                    s2: 'Design adds value faster, than it adds cost',
                  ),
                  const _Shablon(s1: 'username', s2: '@zack_life'),
                  SizedBox(height: 10.h),
                  const _Shablon1(s: 'Send Message'),
                  const _Shablon1(s: 'Share Contact'),
                  const _Shablon1(s: 'Start Secret Chat'),
                  const _Shablon1(s: 'Shared Media', f: true),
                  const _Shablon1(s: 'Notifications', s1: 'Enabled', f: true),
                  const _Shablon1(s: 'Groups In Common', s1: '1', f: true),
                  SizedBox(height: 20.h),
                  const _Shablon1(s: 'Block User', c: Color(0xDFD20F9B)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Shablon extends StatelessWidget {
  final String s1;
  final String s2;

  const _Shablon({super.key, required this.s1, required this.s2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s1, style: CaviarDreams400.s14),
          SizedBox(height: 2.h),
          Text(s2, style: CaviarDreams400.s17),
        ],
      ),
    );
  }
}

class _Shablon1 extends StatelessWidget {
  final String s;
  final String? s1;
  final bool f;
  final Color? c;

  const _Shablon1({required this.s, this.s1, this.f = false, this.c});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.w,
        top: 10.h,
        bottom: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(s, style: CaviarDreams400.s17.apply(color: c)),
          Row(
            children: [
              if (f) ...[
                if (s1 != null) ...[
                  Text(s1!, style: CaviarDreams400.s17),
                  SizedBox(width: 12.w),
                ],
                SvgPicture.asset(
                  'assets/images/arrow_right.svg',
                  width: 7.w,
                  height: 12.w,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
