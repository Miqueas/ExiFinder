import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:window_manager/window_manager.dart';

import 'bloc/e_files_bloc.dart';
import 'bloc/e_grid_items_size_bloc.dart';
import 'bloc/e_theme_mode_bloc.dart';
import 'bloc/e_view_mode_bloc.dart';
import 'e_app.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EFilesBloc(),
        ),
        BlocProvider(
          create: (_) => EViewModeBloc(),
        ),
        BlocProvider(
          create: (_) => EThemeModeBloc(),
        ),
        BlocProvider(
          create: (_) => EGridItemsSizeBloc()
        ),
      ],
      child: const EApp(),
    ),
  );

  await Future.pause(.new(milliseconds: 200));

  final window = WindowManager.instance.getCurrent();
  window?.titleBarStyle = .hidden;
  window?.setSize(const Size(800, 600).toNative(), true);
  window?.center();
  window?.show();
}