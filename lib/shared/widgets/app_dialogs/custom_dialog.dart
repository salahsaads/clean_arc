import 'package:clean_arc/core/routes/navigator_push.dart';
import 'package:flutter/material.dart';


Future<void> CustomDialog({Widget? theDialog, bool? dismiss}) {
  return showDialog(
    barrierDismissible: dismiss == true ? true : false,
    context: RouteManager.currentContext,
    builder: (_) => theDialog!,
  );
}
