import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/dashboard_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
 runApp(
    ScreenUtilInit(
        child: const Dashboardpage(),
        designSize: const Size(428,926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          );
        }),
  );
}



