import 'package:flutter/material.dart';
import 'package:stephanie/resources/colors/app_colors.dart';

class SmallOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;
  final bool isLoading;

  const SmallOutlinedButton({
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
        padding: const EdgeInsets.all(15.0),
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
