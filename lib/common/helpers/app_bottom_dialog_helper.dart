import 'package:flutter/material.dart';

class AppBottomDialogHelper {
  static show(BuildContext context, Widget child) {
    showModalBottomSheet(
      clipBehavior: Clip.antiAlias,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            32.0,
          ),
          topLeft: Radius.circular(
            32.0,
          ),
        ),
      ),
      isScrollControlled: true,
      builder: (builder) => child,
    );
  }
}
