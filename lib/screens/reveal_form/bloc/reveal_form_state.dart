import 'package:stephanie/data/models/reveal.dart';

abstract class RevealFormState {}

class InitRevealFormState extends RevealFormState {
  @override
  String toString() => runtimeType.toString();
}

class LoadingImage extends RevealFormState {
  @override
  String toString() => runtimeType.toString();
}

class LoadingImageSucceeded extends RevealFormState {
  final String imagePath;

  LoadingImageSucceeded(this.imagePath);

  @override
  String toString() => runtimeType.toString();
}

class LoadingImageFailed extends RevealFormState {
  @override
  String toString() => runtimeType.toString();
}

class Revealing extends RevealFormState {
  @override
  String toString() => runtimeType.toString();
}

class RevealingSucceeded extends RevealFormState {
  final Reveal reveal;

  RevealingSucceeded(this.reveal);

  @override
  String toString() => runtimeType.toString();
}

class RevealingFailed extends RevealFormState {
  @override
  String toString() => runtimeType.toString();
}
