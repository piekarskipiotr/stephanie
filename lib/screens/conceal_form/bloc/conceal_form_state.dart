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
