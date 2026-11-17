import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/e_image.dart';

sealed class const EFileEvent();
final class const EAddFiles(final Iterable<EImage> images) extends EFileEvent;
final class const ERemoveFile(final String id) extends EFileEvent;
final class const ERemoveAllFiles() extends EFileEvent;

final class EFilesBloc extends Bloc<EFileEvent, Set<EImage>> {
  new([super.initialState = const {}]) {
    on<EAddFiles>((event, emit) {
      emit({ ...state, ...event.images });
    });

    on<ERemoveFile>((event, emit) {
      state.removeWhere((e) => e.id == event.id);
      emit({ ...state });
    });

    on<ERemoveAllFiles>((event, emit) {
      state.clear();
      emit({});
    });
  }
}