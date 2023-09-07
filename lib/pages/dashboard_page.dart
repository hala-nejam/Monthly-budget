

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/your_balance_page.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



// import '../json/activity_json.dart';
import '../json/activity_json.dart';
import '../theme/colors.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({Key? key}) : super(key: key);

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350.h,
            child: Stack(
              children: [appBarCurve(), appBarBalance()],
            ),
          ),
           SizedBox(
            height: 35.h,
          ),
          getActivity(),
           SizedBox(
            height: 35.h,
          ),
          getVerification(),
           SizedBox(
            height: 35.h,
          ),
          getNewsPromo(),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
  // -----------------------------------------

  Widget appBarCurve() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [primary, secondary],
            ),
            boxShadow: [
              BoxShadow(
                  color: bgColor.withOpacity(0.1),
                  spreadRadius: 10.r,
                  blurRadius: 10.r)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20).r,
          child: SafeArea(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => YourBalancePage()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // -------------------------------
                        Row(
                          children: [
                            Text("\$",
                                style: TextStyle(
                                    fontSize: 22.sp, color: Colors.white)),
                            Text("1,752",
                                style: TextStyle(
                                    fontSize: 30.sp, color: Colors.white)),
                          ],
                        ),
                        // ------------------------------------------
                        SizedBox(
                          height: 2.h,
                        ),
                        Text("Available",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                      ],
                    ),
                  ),
                  // -----------userimge-----------------
                  Stack(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: 35,
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: primary)),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

// -----------------------------------------------------------
  Widget appBarBalance() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20).r,
        child: Container(
          width: size.width,
          height: 200.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                        ),
                       SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("spent",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black.withOpacity(0.5))),
                             SizedBox(
                              height: 3.h,
                            ),
                            Text("\$,460",
                                style: TextStyle(
                                    fontSize: 22.sp, fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                  // ------------------------
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                              color: primary, shape: BoxShape.circle),
                        ),
                      SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Earned",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black.withOpacity(0.5))),
                            SizedBox(
                              height: 3.h,
                            ),
                             Text("\$3,850",
                                style: TextStyle(
                                    fontSize: 22.sp, fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              // -------------------------------------
            SizedBox(
                height: 15.h,
              ),
              const Divider(),
              SizedBox(
                height: 5.h,
              ),
              // ----------------------------------
               Text(
                "You spent \$1,230 on dining out this month. Let's try to make it lower",
                style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.6.h,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
               Text(
                "Tell me more",
                style: TextStyle(
                    color: primary, fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
    );
  }

// -------------------------------
  Widget getActivity() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Activity",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
           SizedBox(
            height: 15.h,
          ),
          Wrap(
              spacing: 25,
              // items.length
              children: List.generate(3, (index) {
                return Container(
                  width: (size.width / 3) - 30,
                  height: (size.width / 3) - 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 10)
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              gradient:
                                  LinearGradient(colors: [primary, secondary])),
                          child: Center(
                            child: Icon(
                              items[index]['icon'],
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(items[index]["title"],style: TextStyle(
                          fontSize: 12.sp,
                          color: black.withOpacity(0.5)
                        ),)
                      ]),
                );
              })),
        ],
      ),
    );
  }

// --------------------------------------------------

  Widget getVerification() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Complete verification",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
         SizedBox(
            height: 15.h,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.015),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20).r,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "60%",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "3 of 10 completed",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 13.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.black.withOpacity(0.04),
                          ),
                        ),
                        Container(
                          width: size.width * 0.5,
                          height: 8.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primary),
                        )
                      ],
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    const Divider(),
                     SizedBox(
                      height: 10.h,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const Icon(
                        MaterialCommunityIcons.account,
                        color: primary,
                      ),
       
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Personal information",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "When you register for an account.",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "we collect peronal information",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "Continue",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                     Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                     Row(
                      children: [
                        Icon(MaterialCommunityIcons.account_badge,color: primary,),
                                        
                                        
                        
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Verification",
                          style: TextStyle(fontSize: 15.sp, color: black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                     SizedBox(
                      height: 10.h,
                    ),
                     Row(
                      children:  [
                         const Icon(
                        MaterialCommunityIcons.email,
                        color: primary,
                      ),
                       
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Confirm email",
                          style: TextStyle(fontSize: 15.sp, color: black),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

// -------------------------------------------------------
  Widget getNewsPromo() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New and promo ",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.015),
                      spreadRadius: 10,
                      blurRadius: 10)
                ]),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 130.h,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage("assets/images/promo_news.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r))),
              ),
              Padding(
                padding: const EdgeInsets.all(20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "share and invite your friends",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Invite friends to reigster on our  app. for every user you invite, you will earn up  to \$10.",
                      style: TextStyle(fontSize: 14.sp, height: 1.6),
                    ),
                    Text(
                      "Invite Now ",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: primary,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
