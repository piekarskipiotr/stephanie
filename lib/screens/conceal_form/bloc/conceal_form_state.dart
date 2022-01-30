import 'package:stephanie/data/models/conceal.dart';

abstract class ConcealFormState {}

class InitConcealFormState extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class LoadingContainerImage extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class LoadingContainerImageSucceeded extends ConcealFormState {
  final String imagePath;

  LoadingContainerImageSucceeded(this.imagePath);

  @override
  String toString() => runtimeType.toString();
}

class LoadingContainerImageFailed extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class RefreshContainerImage extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class LoadingSecret extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class LoadingSecretSucceeded extends ConcealFormState {
  final String secretPath;

  LoadingSecretSucceeded(this.secretPath);

  @override
  String toString() => runtimeType.toString();
}

class LoadingSecretFailed extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class Concealing extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}

class ConcealingSucceeded extends ConcealFormState {
  final Conceal conceal;

  ConcealingSucceeded(this.conceal);

  @override
  String toString() => runtimeType.toString();
}

class ConcealingFailed extends ConcealFormState {
  @override
  String toString() => runtimeType.toString();
}
