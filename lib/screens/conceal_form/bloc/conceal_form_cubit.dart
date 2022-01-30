import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stegify/flutter_stegify.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stephanie/data/models/conceal.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_state.dart';

class ConcealFormCubit extends Cubit<ConcealFormState> {
  ConcealFormCubit() : super(InitConcealFormState());

  Future refreshContainerImage(Conceal conceal) async {
    emit(LoadingContainerImage());
    emit(conceal.containerImage != null
        ? LoadingContainerImageSucceeded(conceal.containerImage!)
        : LoadingContainerImageFailed());
  }

  Future refreshSecret(Conceal conceal) async {
    emit(LoadingSecret());
    emit(conceal.secret != null
        ? LoadingSecretSucceeded(conceal.secret!)
        : LoadingSecretFailed());
  }

  Future concealSecret(Conceal conceal) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    await Stegify.encode(conceal.containerImage, conceal.secret, '${appDocPath}/image');
    GallerySaver.saveImage('${appDocPath}/image.jpg', albumName: 'stephanie');
  }

  @override
  void onChange(Change<ConcealFormState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
