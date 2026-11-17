import 'package:flutter_bloc/flutter_bloc.dart';

sealed class const EGridItemsSizeEvent();

final class const ESetGridItemsSize(final double size)
          extends EGridItemsSizeEvent;

final class EGridItemsSizeBloc extends Bloc<EGridItemsSizeEvent, double> {
  new([super.initialState = 300]) {
    on<ESetGridItemsSize>((event, emit) {
      final newSize = event.size;
      emit(newSize.clamp(150, 800));
    });
  }
}