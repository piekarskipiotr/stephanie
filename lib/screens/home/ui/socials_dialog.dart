import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stephanie/common/helpers/url_helper.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/colors/color_helper.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';

class SocialsDialog extends StatefulWidget {
  const SocialsDialog({Key? key}) : super(key: key);

  @override
  _SocialsDialogState createState() => _SocialsDialogState();
}

class _SocialsDialogState extends State<SocialsDialog> {
  bool showCopiedMessageEmail = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 5.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(28.0),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                SizedBox(
                  width: 96.0,
                  height: 96.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://github.com/piekarskipiotr.png',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              'Piotr Piekarski',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => UrlHelper.openUrl(
                          'https://github.com/piekarskipiotr'),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorHelper.darken(
                            Theme.of(context).scaffoldBackgroundColor,
                            0.1,
                          ).withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14.0),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          top: 15.0,
                          right: 25.0,
                          bottom: 15.0,
                        ),
                        child: const Icon(FontAwesomeIcons.github),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => UrlHelper.openUrl(
                          'https://www.linkedin.com/in/piekarskipiotr/'),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorHelper.darken(
                            Theme.of(context).scaffoldBackgroundColor,
                            0.1,
                          ).withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14.0),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          top: 15.0,
                          right: 25.0,
                          bottom: 15.0,
                        ),
                        child: const Icon(FontAwesomeIcons.linkedinIn),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => UrlHelper.openEmail('ppiekarski8@gmail.com'),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorHelper.darken(
                            Theme.of(context).scaffoldBackgroundColor,
                            0.1,
                          ).withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14.0),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          top: 15.0,
                          right: 25.0,
                          bottom: 15.0,
                        ),
                        child: const Icon(Icons.email),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListTile(
                  onLongPress: () => setState(() {
                    showCopiedMessageEmail = true;
                    Clipboard.setData(
                      const ClipboardData(text: 'ppiekarski8@gmail.com'),
                    );
                    Timer(
                      const Duration(seconds: 2),
                      () => setState(
                        () {
                          showCopiedMessageEmail = false;
                        },
                      ),
                    );
                  }),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.mail),
                      ],
                    ),
                  ),
                  trailing: showCopiedMessageEmail
                      ? Text(
                          getString(context).copied,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.green,
                          ),
                        )
                      : null,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'ppiekarski8@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      getString(context).email_address,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
