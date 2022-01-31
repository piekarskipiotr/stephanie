import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/common/helpers/app_bottom_dialog_helper.dart';
import 'package:stephanie/common/helpers/opacity_helper.dart';
import 'package:stephanie/common/helpers/url_helper.dart';
import 'package:stephanie/resources/app_theme.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/resources/routes/app_routes.dart';
import 'package:stephanie/screens/home/ui/socials_dialog.dart';
import 'package:stephanie/widgets/longer_button.dart';
import 'package:stephanie/widgets/small_button.dart';
import 'package:stephanie/widgets/small_outlined_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              pinned: true,
              expandedHeight: 180.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  var top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      bottom: 13.0,
                    ),
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity:
                          OpacityHelper.calculateHeaderOpacity(top, 81.0, 91.0),
                      child: top < 86
                          ? Text(
                              'Stephanie',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.isDarkMode() ? Colors.white : Colors.black,
                              ),
                            )
                          : Text(
                              getString(context).welcome_to_stephanie,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.isDarkMode() ? Colors.white : Colors.black,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 192.0,
                        height: 192.0,
                        child: Image.asset(welcomeBoy),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: getString(context).steganography,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.gray,
                            ),
                          ),
                          TextSpan(
                            text: getString(context).welcome_text_part_1,
                            style: const TextStyle(
                              color: AppColors.gray,
                            ),
                          ),
                          TextSpan(
                            text: '\n${getString(context).conceal}',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: AppColors.gray,
                            ),
                          ),
                          TextSpan(
                            text: getString(context).welcome_text_part_2,
                            style: const TextStyle(
                              color: AppColors.gray,
                            ),
                          ),
                          TextSpan(
                            text: getString(context)
                                .reveal
                                .toLowerCase(),
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: AppColors.gray,
                            ),
                          ),
                          TextSpan(
                            text: getString(context).welcome_text_part_3,
                            style: const TextStyle(
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SmallButton(
                            text: getString(context).conceal,
                            isLoading: false,
                            onClick: () => Navigator.pushNamed(
                              context,
                              AppRoutes.concealForm,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: SmallOutlinedButton(
                            text: getString(context).reveal,
                            isLoading: false,
                            onClick: () => Navigator.pushNamed(
                              context,
                              AppRoutes.revealForm,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getString(context).what_steganography_is,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 192.0,
                        height: 192.0,
                        child: Image.asset(boyWithLaptop),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: getString(context).steganography,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.gray,
                            ),
                          ),
                          TextSpan(
                            text: getString(context).what_steganography_is_text,
                            style: const TextStyle(
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SmallOutlinedButton(
                        text: getString(context).read_more,
                        isLoading: false,
                        onClick: () => UrlHelper.openUrl('https://pl.wikipedia.org/wiki/Steganografia'),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      getString(context).want_to_discuss,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 256.0,
                      height: 256.0,
                      child: Image.asset(talk),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    LongerButton(
                      text: getString(context).message_me,
                      isLoading: false,
                      onClick: () async =>
                          UrlHelper.openEmail('ppiekarski8@gmail.com'),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.lightGray,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: getString(context).created_by,
                        style: const TextStyle(color: AppColors.gray),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Piotr Piekarski ',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => AppBottomDialogHelper.show(
                                  context, const SocialsDialog()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                            text: getString(context).with_text,
                          ),
                          TextSpan(
                            text: ' Flutter 💙',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => UrlHelper.openUrl('https://flutter.dev/'),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
