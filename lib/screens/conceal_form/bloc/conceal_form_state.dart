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
