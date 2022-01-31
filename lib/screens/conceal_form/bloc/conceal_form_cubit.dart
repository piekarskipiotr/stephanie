import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stegify/flutter_stegify.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stephanie/common/helpers/path_helper.dart';
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
    emit(Concealing());
    var dir = await getTemporaryDirectory();
    var path = dir.path;
    var fileName = PathHelper.getFileNameWithExtensionFromPath(conceal.containerImage!);
    var finalDestination = '$path/secret_$fileName';

    try {
      // conceal secret into container image
      await Stegify.encode(conceal.containerImage, conceal.secret, finalDestination);

      // save image to gallery
      var extension = PathHelper.getExtensionFromPath(finalDestination);
      var saved = await GallerySaver.saveImage('$finalDestination$extension', albumName: 'stephanie');
      if (saved != null && saved) {
        conceal.output = '$finalDestination$extension';
        emit(ConcealingSucceeded(conceal));
      } else {
        emit(ConcealingFailed(null));
      }
    } catch (e) {
      var message = e.toString();
      log(message);
      emit(ConcealingFailed(message.contains('data file too large for this carrier') ? 'file-too-large' : null));
    }
  }

  @override
  void onChange(Change<ConcealFormState> change) {
    super.onChange(change);
    log(change.toString(), name: runtimeType.toString());
  }
}
