import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oioioi/default_body.dart';
import 'package:oioioi/theme/app_text_styles.dart';

class ContactInfoPage extends StatelessWidget {
  const ContactInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: 'Zack');
    TextEditingController surnameController =
        TextEditingController(text: 'Sasak');
    TextEditingController mainController =
        TextEditingController(text: '+998 97 444 67 17');
    TextEditingController homeController =
        TextEditingController(text: '+998 90 934 50 44');
    TextEditingController bioController = TextEditingController(
        text: 'Design adds value faster, than it adds cost');

    return DefaultBody(
      title: 'Info',
      leading: 'Cancel',
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            bottom: 15.h,
            left: 15.w,
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
                  SizedBox(width: 19.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12.w,
                            bottom: 8.h,
                          ),
                          child: TextField(
                            controller: nameController,
                            style: CaviarDreams400.s17,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 1.h,
                          width: double.maxFinite,
                          color: const Color(0xFFB3ADAD),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12.w,
                            bottom: 8.h,
                            top: 8.h,
                          ),
                          child: TextField(
                            controller: surnameController,
                            style: CaviarDreams400.s17,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Shablon(
                s1: 'main',
                s2: mainController,
              ),
              Shablon(s1: 'home', s2: homeController),
              Shablon(s1: 'bio', s2: bioController),
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notifications', style: CaviarDreams400.s17),
                    Row(
                      children: [
                        Text('Enabled', style: CaviarDreams400.s17),
                        SizedBox(
                          width: 13.w,
                        ),
                        SvgPicture.asset(
                          'assets/images/arrow_right.svg',
                          width: 7.w,
                          height: 12.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text('Delete contact',
                  style: CaviarDreams400.s17
                      .apply(color: const Color(0xDFD20F9B))),
            ],
          ),
        ),
      ),
    );
  }
}

class Shablon extends StatelessWidget {
  final String s1;
  final TextEditingController s2;

  const Shablon({super.key, required this.s1, required this.s2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s1, style: CaviarDreams400.s14),
          SizedBox(height: 2.h),
          TextField(
              controller: s2,
              style: CaviarDreams400.s17,
              decoration: const InputDecoration(
                border: InputBorder.none,
              )),
        ],
      ),
    );
  }
}
