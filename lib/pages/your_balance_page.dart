import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/widgets/chart_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_icons/flutter_icons.dart';

import '../json/category_json.dart';
import '../json/merchant_json.dart';
import '../theme/colors.dart';

class YourBalancePage extends StatefulWidget {
  const YourBalancePage({Key? key}) : super(key: key);

  @override
  State<YourBalancePage> createState() => _YourBalancePageState();
}

class _YourBalancePageState extends State<YourBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: black,
          size: 22,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15).r,
          child: Text(
            "Set budget",
            style: TextStyle(
                color: primary, fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

// --------------------------------------------
  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          getBalance(),
          SizedBox(
            height: 20.h,
          ),
          getChartAndBalance(),
          SizedBox(
            height: 30.h,
          ),
          getTopMerchants(),
          SizedBox(
            height: 10.h,
          ),
          getTopCategories(),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }

  Widget getBalance() {
    return Center(
      child: Column(
        children: [
          Text(

            "you balance is \$1,752",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20.sp, color: black),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "By this time last month, you spent\n slightly hgiher (\$2,450) ",
            style: TextStyle(fontSize: 14.sp, height: 1.6),
          )
        ],
      ),
    );
  }

// ---------------------------------------------
  getChartAndBalance() {
    return Container(
      height: 200.h,
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: 150.h,
          child: LineChart(activityData()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120, left: 20, right: 20).r,
          child: Container(
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.15),
                        spreadRadius: 10,
                        blurRadius: 10)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(15.0).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10.w,
                            height: 10.h,
                            decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle),
                          ),
                           SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("spent",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.5))),
                            
                            SizedBox(
                                height: 3.h,
                              ),
                               Text("\$,460",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500)),
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
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        )
      ]),
    );
  }

// -----------------------------------------
  getTopMerchants() {
    return Padding(
      padding:  EdgeInsets.only(left: 20..w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top merchant",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(merchantList.length, (index) {
              return Padding(
                padding:  EdgeInsets.only(bottom: 12.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: black.withOpacity(0.015),
                                        spreadRadius: 10,
                                        blurRadius: 10)
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child:
                                    Image.network(merchantList[index]['img']),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  merchantList[index]['name'],
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  merchantList[index]['transaction'],
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: black.withOpacity(0.5)),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          merchantList[index]['price'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                        )
                      ],
                    ),
                     SizedBox(
                      height: 12.h,
                    ),
                    const Divider()
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

// ---------------------------
  getTopCategories() {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Category",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(categoryList.length, (index) {
              return Padding(
                padding:  EdgeInsets.only(right: 15.w),
                child: Container(
                  width: 150.w,
                  height: 220.h,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 10)
                      ]),
                  child: Padding(
                    padding:  EdgeInsets.only(
                        right: 15.w, left: 15.w, bottom:10.h, top: 20.h),
                    child: Column(
                      children: [
                      SizedBox(
                        height: 80.h,
                        child: CircleProgressBar(
                          foregroundColor: primary,
                          backgroundColor: black.withOpacity(0.1),
                          value: categoryList[index]['percentage'],
                          child: Center(
                          
                                child: Text(
                              categoryList[index]['img'],
                              style: TextStyle(fontSize: 22.sp),
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        categoryList[index]['name'],
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            "on track",
                            style: TextStyle(fontWeight: FontWeight.w600,
                            color: black.withOpacity(0.7)),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              );
            })),
          )
        ],
      ),
    );
  }


}
