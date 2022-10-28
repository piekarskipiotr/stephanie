import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/common/helpers/app_dialog_helper.dart';
import 'package:stephanie/common/helpers/opacity_helper.dart';
import 'package:stephanie/data/models/reveal.dart';
import 'package:stephanie/resources/app_theme.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/screens/reveal_form/bloc/reveal_form_cubit.dart';
import 'package:stephanie/screens/reveal_form/bloc/reveal_form_state.dart';
import 'package:stephanie/screens/reveal_form/ui/reveal_info_dialog.dart';
import 'package:stephanie/widgets/longer_button.dart';
import 'package:stephanie/widgets/longer_outlined_button.dart';

class RevealForm extends StatelessWidget {
  final Reveal reveal;

  const RevealForm({Key? key, required this.reveal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RevealFormCubit, RevealFormState>(
      listener: (context, state) {
        if (state is RevealingFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    getString(context).error_during_concealing,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.red,
            ),
          );
        } else if (state is RevealingSucceeded) {
          AppDialogHelper.showFullScreenDialog(
            context,
            RevealInfoDialog(
              reveal: reveal,
            ),
          );
        }
      },
      child: Scaffold(
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
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.gray,
                    ),
                  ),
                ],
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
                        opacity: OpacityHelper.calculateHeaderOpacity(
                            top, 81.0, 91.0),
                        child: top < 86
                            ? Text(
                                getString(context)
                                    .reveal_message
                                    .replaceAll('\n', ' '),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.isDarkMode()
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )
                            : Text(
                                getString(context).reveal_message,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.isDarkMode()
                                      ? Colors.white
                                      : Colors.black,
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
                                  text:
                                      getString(context).reveal_pick_image_desc,
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
                      BlocBuilder<RevealFormCubit, RevealFormState>(
                        builder: (context, state) {
                          if (state is LoadingImageSucceeded) {
                            return ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 256.0,
                              ),
                              child: Image.file(File(state.imagePath)),
                            );
                          } else if (state is LoadingImage) {
                            return const SizedBox(
                              height: 96.0,
                              width: 96.0,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return reveal.image == null
                                ? SizedBox(
                                    width: 96.0,
                                    height: 96.0,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.lightGray,
                                      child: Lottie.asset(mountains),
                                    ),
                                  )
                                : ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 256.0,
                                    ),
                                    child: Image.file(File(reveal.image!)),
                                  );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      BlocBuilder<RevealFormCubit, RevealFormState>(
                          builder: (context, state) {
                        return LongerOutlinedButton(
                          text: reveal.image == null
                              ? getString(context).select_image
                              : getString(context).change_image,
                          onClick: state is Revealing
                              ? null
                              : () async {
                                  var imagePicker = ImagePicker();
                                  XFile? image = await imagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    reveal.image = image.path;
                                    context
                                        .read<RevealFormCubit>()
                                        .refreshImage(reveal);
                                  }
                                },
                          isLoading: false,
                        );
                      }),
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
                      BlocBuilder<RevealFormCubit, RevealFormState>(
                        builder: (context, state) {
                          return LongerButton(
                            text: getString(context).reveal,
                            onClick: reveal.image != null
                                ? () => context
                                    .read<RevealFormCubit>()
                                    .revealSecret(reveal)
                                : null,
                            isLoading: state is Revealing,
                            customStyle: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  backgroundColor: reveal.image != null
                                      ? MaterialStateProperty.all(
                                          Theme.of(context).primaryColor,
                                        )
                                      : MaterialStateProperty.all(
                                          AppColors.gray,
                                        ),
                                ),
                          );
                        },
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
      ),
    );
  }
}
