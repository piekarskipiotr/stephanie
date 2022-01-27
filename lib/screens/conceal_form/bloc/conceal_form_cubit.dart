import 'package:flutter_bloc/flutter_bloc.dart';
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
}
