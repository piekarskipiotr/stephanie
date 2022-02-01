import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/common/helpers/file_helper.dart';
import 'package:stephanie/data/models/reveal.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/resources/routes/app_routes.dart';

class RevealInfoDialog extends StatelessWidget {
  final Reveal reveal;

  const RevealInfoDialog({
    Key? key,
    required this.reveal,
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
                      getString(context).reveal_info_dialog_header,
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
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: getString(context).conceal_info_dialog_secondary_part_1,
                          ),
                          TextSpan(
                            text: FileHelper.getSizeOfFileMB(reveal.output!),
                            style: const TextStyle(
                                color: AppColors.red
                            ),
                          ),
                          TextSpan(
                            text: getString(context).conceal_info_dialog_secondary_part_2,
                          ),
                          TextSpan(
                            text: getString(context).conceal_info_dialog_secondary_part_3,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => OpenFile.open(reveal.output!),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor
                            ),
                          ),
                        ],
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
