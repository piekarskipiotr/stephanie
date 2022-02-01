import 'dart:developer';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stegify/flutter_stegify.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stephanie/common/helpers/path_helper.dart';
import 'package:stephanie/data/models/reveal.dart';
import 'package:stephanie/screens/reveal_form/bloc/reveal_form_state.dart';

class RevealFormCubit extends Cubit<RevealFormState> {
  RevealFormCubit() : super(InitRevealFormState());

  Future refreshImage(Reveal reveal) async {
    emit(LoadingImage());
    emit(reveal.image != null
        ? LoadingImageSucceeded(reveal.image!)
        : LoadingImageFailed());
  }

  Future revealSecret(Reveal reveal) async {
    emit(Revealing());

    var dir = await getTemporaryDirectory();
    var path = dir.path;
    var fileName = PathHelper.getFileNameFromPath(reveal.image!);
    var finalDestination = '$path/secret_$fileName';

    try {
      if (await tryToRevealImage(reveal.image!, finalDestination)) {
        // save image to gallery
        finalDestination += '.jpg';
        var saved = await GallerySaver.saveImage(finalDestination,
            albumName: 'stephanie');

        if (saved != null && saved) {
          reveal.output = finalDestination;
          emit(RevealingSucceeded(reveal));
        } else {
          emit(RevealingFailed());
        }
      } else {
        await Stegify.decode(reveal.image!, '$finalDestination.mp3');
        if (File('$finalDestination.mp3').lengthSync() != 0) {
          reveal.output = '$finalDestination.mp3';
          emit(RevealingSucceeded(reveal));
        } else {
          emit(RevealingFailed());
        }
      }
    } catch (e) {
      log(e.toString());
      emit(RevealingFailed());
    }
  }

  Future<bool> tryToRevealImage(String imagePath, String path) async {
    try {
      await Stegify.decode(imagePath, '$path.jpg');
      var bytes = File('$path.jpg').readAsBytesSync();
      var decodedImage = await decodeImageFromList(bytes);

      if (decodedImage.height == 0 && decodedImage.width == 0) {
        return false;
      } else {
        return true;
      }
    } catch (_) {
      return false;
    }
  }

  @override
  void onChange(Change<RevealFormState> change) {
    super.onChange(change);
    log(change.toString(), name: runtimeType.toString());
  }
}
