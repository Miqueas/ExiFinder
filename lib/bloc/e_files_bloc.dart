import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/e_image.dart';

sealed class const EFileEvent();
final class const EAddFile() extends EFileEvent;
final class const ERemoveFile() extends EFileEvent;

final class EFilesBloc extends Bloc<EFileEvent, List<EImage>> {
  new([super.initialState = const []]) {
    on<EAddFile>((event, emit) => emit(state));
    on<ERemoveFile>((event, emit) => emit(state));
  }
}