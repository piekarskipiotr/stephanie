import 'package:flutter/material.dart';

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
            ? SizedBox(
                height: 16.0,
                width: 16.0,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
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
