import 'package:flutter/material.dart';

class AppDialogHelper {
  static showFullScreenDialog(BuildContext context, Widget dialog) {
    Navigator.of(context).push(
      PageRouteBuilder(opaque: false, pageBuilder: (context, _, __) => dialog),
    );
  }
}