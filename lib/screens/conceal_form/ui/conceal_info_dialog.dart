import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/data/models/conceal.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/resources/routes/app_routes.dart';

class ConcealInfoDialog extends StatelessWidget {
  final Conceal conceal;

  const ConcealInfoDialog({
    Key? key,
    required this.conceal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      getString(context).conceal_info_dialog_header,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    width: 162.0,
                    height: 162.0,
                    child: Lottie.asset(success, repeat: false),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      getString(context).conceal_info_dialog_secondary,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              Container(),
              Container(),
              Column(
                children: [
                  Material(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.home, (route) => false),
                      borderRadius: BorderRadius.circular(12.0),
                      child: const SizedBox(
                        width: 48.0,
                        height: 48.0,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    getString(context).close,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
