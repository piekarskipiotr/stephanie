import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stephanie/data/models/conceal.dart';
import 'package:stephanie/resources/colors/app_colors.dart';
import 'package:stephanie/resources/l10n/app_localizations_helper.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSourceDialog extends StatelessWidget {
  final Conceal conceal;
  const ImageSourceDialog({Key? key, required this.conceal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
            InkWell(
              onTap: () async {
                var imagePicker = ImagePicker();
                XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  conceal.containerImage = image.path;
                  context.read<ConcealFormCubit>().refreshContainerImage(conceal);
                  Navigator.pop(context);
                }
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Icon(
                      Icons.camera,
                      size: 32.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    getString(context).camera,
                    style: const TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                var imagePicker = ImagePicker();
                XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  conceal.containerImage = image.path;
                  context.read<ConcealFormCubit>().refreshContainerImage(conceal);
                  Navigator.pop(context);
                }
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Icon(Icons.image, size: 32.0),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    getString(context).gallery,
                    style: const TextStyle(fontSize: 16.0),
                  )
                ],
              ),
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
