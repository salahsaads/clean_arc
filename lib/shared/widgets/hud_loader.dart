import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'loader.dart';


class LoaderHud extends StatelessWidget {
  final bool isCall;
  final Widget child;
  const LoaderHud({Key? key, required this.isCall, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
   inAsyncCall: isCall,
    child: child,
    color: Colors.white24,
    progressIndicator: ColorLoader(),

    );
  }
}
