import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

sealed class const EThemeModeEvent();
final class const ESetThemeMode(final ThemeMode mode) extends EThemeModeEvent;

final class EThemeModeBloc extends Bloc<EThemeModeEvent, ThemeMode> {
  new([super.initialState = .system]) {
    on<ESetThemeMode>((event, emit) => emit(event.mode));
  }
}