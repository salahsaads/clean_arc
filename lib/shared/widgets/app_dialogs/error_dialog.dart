import 'package:flutter/material.dart';


class ErrorDialog extends StatelessWidget {
  final String msg;

  const ErrorDialog({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        // height: 250.h,
        // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        width: double.infinity,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(getLottie("error"), height: 100.h, width: 100.h, fit: BoxFit.cover),
            // SizedBox(height: 20.h),
            // Text(
            //   msg,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     height: 1.5,
            //     fontFamily: TextFontApp.mediumFont,
            //     fontSize: 18.sp,
            //     color: ColorApp.red,
            //   ),
            // ),
            // SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
