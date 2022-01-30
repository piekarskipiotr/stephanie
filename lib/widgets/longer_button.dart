import 'package:flutter/material.dart';

class LongerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;
  final bool isLoading;
  final ButtonStyle? customStyle;

  const LongerButton({
    Key? key,
    required this.text,
    required this.onClick,
    required this.isLoading,
    this.customStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: customStyle,
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
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
