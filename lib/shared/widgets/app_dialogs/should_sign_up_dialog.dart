import 'package:flutter/material.dart';


class ShouldSignUpDialog extends StatelessWidget {
  const ShouldSignUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
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
            // Lottie.asset(getLottie("alert"), height: 100.h, width: 100.h, fit: BoxFit.cover),
            // SizedBox(height: 20.h),
            Text(
              "Sorry, you should login first to Unlock all features",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                // fontFamily: TextFontApp.mediumFont,
                // fontSize: 18.sp,
                // color: ColorApp.black,
              ),
            ),
            // SizedBox(height: 20.h),
            // AppButton(
            //   height: 46,
            //   verText: 0,
            //   title: "Login",
            //   onPressed: () {
            //     RouteManager.navigateAndPopAll(LoginScreen());
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
