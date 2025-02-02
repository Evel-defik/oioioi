import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oioioi/presentation/chats_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String countryName = 'USA';
  String countryCode = '+1';

  bool isSyncContact = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2.w),
                  ),
                  child: Text(
                    'Cancel',
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
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatsPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2.w),
                  ),
                  child: Text(
                    'Next',
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Your Phone",
                    style: TextStyle(
                      color: const Color(0xFF36F4EE),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'CaviarDreams',
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: Center(
                    child: Text(
                      "Please confirm your country code and enter your phone number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF36F4EE),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CaviarDreams',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45.h),
                Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 16.h),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.purple)),
                  ),
                  child: Text(
                    countryName,
                    style: TextStyle(
                      color: const Color(0xFF36F4EE),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CaviarDreams',
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.purple),
                      bottom: BorderSide(color: Colors.purple),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.purple),
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: countryCode,
                          dropdownColor: Colors.black,
                          underline: const SizedBox.shrink(),
                          style: TextStyle(
                            color: const Color(0xFF36F4EE),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CaviarDreams',
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: '+1',
                              child: Text('+1'),
                            ),
                            DropdownMenuItem(
                              value: '+7',
                              child: Text('+7'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              countryCode = value!;
                              countryName =
                                  value == '+1' ? "USA" : "Kazakhstan";
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 16.h),
                          child: TextField(
                            style: TextStyle(
                              color: const Color(0xFF36F4EE),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CaviarDreams',
                            ),
                            decoration: InputDecoration(
                              hintText: "Your phone number",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'CaviarDreams',
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sync Contacts",
                        style: TextStyle(
                          color: const Color(0xFF36F4EE),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CaviarDreams',
                        ),
                      ),
                      Switch(
                        value: isSyncContact,
                        activeTrackColor: Colors.green,
                        onChanged: (isChanged) {
                          setState(() {
                            isSyncContact = !isSyncContact;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
