import 'package:flutter/material.dart';
import 'package:stephanie/resources/colors/app_colors.dart';

class LongerOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;
  final bool isLoading;

  const LongerOutlinedButton({
    Key? key,
    required this.text,
    required this.onClick,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? () {} : onClick,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 55.0,
          top: 15.0,
          right: 55.0,
          bottom: 15.0,
        ),
        child: isLoading
            ? const SizedBox(
          height: 16.0,
          width: 16.0,
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontSize: 17.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
