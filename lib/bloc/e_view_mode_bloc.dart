import 'package:flutter_bloc/flutter_bloc.dart';

enum EViewMode { grid, list }

sealed class const EViewModeEvent();
final class const ESetViewMode(final EViewMode mode) extends EViewModeEvent;

final class EViewModeBloc extends Bloc<EViewModeEvent, EViewMode> {
  new([super.initialState = .grid]) {
    on<ESetViewMode>((event, emit) => emit(event.mode));
  }
}