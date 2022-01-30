import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stephanie/common/constants.dart';
import 'package:stephanie/common/helpers/app_bottom_dialog_helper.dart';
import 'package:stephanie/common/helpers/opacity_helper.dart';
import 'package:stephanie/common/helpers/padding_helper.dart';
import 'package:stephanie/data/models/conceal.dart';
import 'package:stephanie/resources/app_theme.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_cubit.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_state.dart';
import 'package:stephanie/widgets/image_source_dialog.dart';
import 'package:stephanie/widgets/longer_button.dart';
import 'package:stephanie/widgets/longer_outlined_button.dart';

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
                          getString(context).select_image,
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
                          return SizedBox(
                            height: 256.0,
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
                          return SizedBox(
                            width: 96.0,
                            height: 96.0,
                            child: CircleAvatar(
                              backgroundColor: AppColors.lightGray,
                              child: Lottie.asset(mountains),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    LongerOutlinedButton(
                      text: getString(context).select_image,
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
                    ),
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
                                    fontWeight: FontWeight.bold),
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
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      onChanged: (secret) => context
                          .read<ConcealFormCubit>()
                          .refreshSecret(conceal, secret),
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: getString(context).secret_message_field,
                        contentPadding: const EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                      ),
                    ),
                    // LongerOutlinedButton(
                    //   text: getString(context).add_secret,
                    //   onClick: () async {
                    //     FilePickerResult? result = await FilePicker.platform
                    //         .pickFiles(type: FileType.any);
                    //     if (result != null) {
                    //       conceal.secret = result.files.single.path;
                    //     }
                    //   },
                    //   isLoading: false,
                    // ),
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
                                  log(conceal.toString());
                                }
                              : null,
                          isLoading: false,
                          customStyle: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: (conceal.containerImage !=
                                            null &&
                                        (conceal.secret != null &&
                                            conceal.secret?.trim() != ''))
                                    ? MaterialStateProperty.all(
                                        AppColors.primary)
                                    : MaterialStateProperty.all(AppColors.gray),
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
