import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/common/helpers/app_bottom_dialog_helper.dart';
import 'package:stephanie/common/helpers/path_helper.dart';
import 'package:stephanie/common/helpers/opacity_helper.dart';
import 'package:stephanie/common/helpers/padding_helper.dart';
import 'package:stephanie/data/models/conceal.dart';
import 'package:stephanie/resources/app_theme.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/colors/color_helper.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_cubit.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_state.dart';
import 'package:stephanie/widgets/image_source_dialog.dart';
import 'package:stephanie/widgets/longer_button.dart';
import 'package:stephanie/widgets/longer_outlined_button.dart';
import 'package:stephanie/widgets/secret_source_dialog.dart';

class ConcealForm extends StatelessWidget {
  final Conceal conceal;

  const ConcealForm({Key? key, required this.conceal}) : super(key: key);

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
                                  .conceal_message
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
                              getString(context).conceal_message,
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
                                    getString(context).conceal_pick_image_desc,
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
                    BlocBuilder<ConcealFormCubit, ConcealFormState>(
                      builder: (context, state) {
                        if (state is LoadingContainerImageSucceeded) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 256.0,
                            ),
                            child: Image.file(File(state.imagePath)),
                          );
                        } else if (state is LoadingContainerImage) {
                          return const SizedBox(
                            height: 96.0,
                            width: 96.0,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return conceal.containerImage == null
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
                                  child:
                                      Image.file(File(conceal.containerImage!)),
                                );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    BlocBuilder<ConcealFormCubit, ConcealFormState>(
                        builder: (context, state) {
                      return LongerOutlinedButton(
                        text: conceal.containerImage == null
                            ? getString(context).select_image
                            : getString(context).change_image,
                        onClick: () => AppBottomDialogHelper.show(
                          context,
                          BlocProvider.value(
                            value: context.read<ConcealFormCubit>(),
                            child: ImageSourceDialog(
                              conceal: conceal,
                            ),
                          ),
                        ),
                        isLoading: false,
                      );
                    }),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.lightGray,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          getString(context).conceal_add_secret_title,
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
                                text: getString(context)
                                    .conceal_add_secret_desc_1,
                                style: const TextStyle(
                                  color: AppColors.gray,
                                ),
                              ),
                              TextSpan(
                                text: getString(context).reveal,
                                style: const TextStyle(
                                  color: AppColors.gray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: getString(context)
                                    .conceal_add_secret_desc_2,
                                style: const TextStyle(
                                  color: AppColors.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<ConcealFormCubit, ConcealFormState>(
                      builder: (context, state) {
                        if (state is LoadingSecretSucceeded) {
                          var isImage = PathHelper.isImage(state.secretPath);

                          return Column(
                            children: [
                              const SizedBox(
                                height: 35.0,
                              ),
                              isImage
                                  ? ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxHeight: 256.0,
                                      ),
                                      child: Image.file(File(state.secretPath)),
                                    )
                                  : Container(
                                      height: 164.0,
                                      width: 164.0,
                                      decoration: BoxDecoration(
                                        color: ColorHelper.darken(
                                          Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          0.1,
                                        ).withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(26.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 48.0,
                                              height: 48.0,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.music_note,
                                                  size: 32.0,
                                                  color: AppColors.red,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                            Text(
                                              PathHelper.getFileNameFromPath(
                                                  state.secretPath),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          );
                        } else if (state is LoadingSecret) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 35.0,
                              ),
                              SizedBox(
                                height: 96.0,
                                width: 96.0,
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          );
                        } else {
                          if (conceal.secret == null) {
                            return Container();
                          } else {
                            var isImage = PathHelper.isImage(conceal.secret!);
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 35.0,
                                ),
                                isImage
                                    ? ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxHeight: 256.0,
                                        ),
                                        child:
                                            Image.file(File(conceal.secret!)),
                                      )
                                    : Container(
                                        height: 164.0,
                                        width: 164.0,
                                        decoration: BoxDecoration(
                                          color: ColorHelper.darken(
                                            Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            0.1,
                                          ).withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(26.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 48.0,
                                                height: 48.0,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.music_note,
                                                    size: 32.0,
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              Text(
                                                PathHelper.getFileNameFromPath(
                                                    conceal.secret!),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    BlocBuilder<ConcealFormCubit, ConcealFormState>(
                        builder: (context, state) {
                      return LongerOutlinedButton(
                        text: conceal.secret == null
                            ? getString(context).add_secret
                            : getString(context).change_secret,
                        onClick: () => AppBottomDialogHelper.show(
                          context,
                          BlocProvider.value(
                            value: context.read<ConcealFormCubit>(),
                            child: SecretSourceDialog(
                              conceal: conceal,
                            ),
                          ),
                        ),
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
                    BlocBuilder<ConcealFormCubit, ConcealFormState>(
                      builder: (context, state) {
                        return LongerButton(
                          text: getString(context).conceal,
                          onClick: (conceal.containerImage != null &&
                                  (conceal.secret != null &&
                                      conceal.secret?.trim() != ''))
                              ? () {
                                  context
                                      .read<ConcealFormCubit>()
                                      .concealSecret(conceal);
                                }
                              : null,
                          isLoading: false,
                          customStyle: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor:
                                    (conceal.containerImage != null &&
                                            (conceal.secret != null &&
                                                conceal.secret?.trim() != ''))
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
    );
  }
}
