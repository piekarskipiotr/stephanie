import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/common/helpers/opacity_helper.dart';
import 'package:stephanie/common/helpers/padding_helper.dart';
import 'package:stephanie/resources/app_theme.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/widgets/longer_button.dart';
import 'package:stephanie/widgets/longer_outlined_button.dart';

class RevealForm extends StatelessWidget {
  const RevealForm({Key? key}) : super(key: key);

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
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.gray,
                ),
              ),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  var top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsets.only(
                      left: PaddingHelper.calculatePadding(top),
                      right: 25.0,
                      bottom: 13.0,
                    ),
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity:
                      OpacityHelper.calculateHeaderOpacity(top, 81.0, 91.0),
                      child: top < 86
                          ? Text(
                        getString(context)
                            .reveal_message
                            .replaceAll('\n', ' '),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.isDarkMode() ? Colors.white : Colors.black,
                        ),
                      )
                          : Text(
                        getString(context).reveal_message,
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
                    const SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          getString(context).pick_image,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            children: [
                              TextSpan(
                                text: getString(context).reveal_pick_image_desc,
                                style: const TextStyle(
                                  color: AppColors.gray,
                                ),
                              ),
                              TextSpan(
                                text: getString(context).secret_message,
                                style: const TextStyle(
                                    color: AppColors.gray,
                                    fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    SizedBox(
                      width: 96.0,
                      height: 96.0,
                      child: CircleAvatar(
                        backgroundColor: AppColors.lightGray,
                        child: Lottie.asset(mountains),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    LongerOutlinedButton(
                        text: getString(context).select_image,
                        onClick: () {},
                        isLoading: false,
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getString(context).all_done,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    LongerButton(
                      text: getString(context).reveal,
                      onClick: () {},
                      isLoading: false,
                    ),
                    const SizedBox(
                      height: 25.0,
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
