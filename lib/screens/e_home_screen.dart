import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../bloc/e_files_bloc.dart';
import '../models/e_image.dart';
import '../widgets/e_app_bar.dart';
import '../widgets/e_clear_button.dart';
import '../widgets/e_files_drag_zone.dart';
import '../widgets/e_search_field.dart';
import '../widgets/e_view_switcher_combo_box.dart';

final class const EHomeScreen({ super.key, }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EAppBar(),
    body: Padding(
      padding: .all(12),
      child: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(child: ESearchField(),),
              EViewSwitcherComboBox(),
              EClearButton(),
            ],
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const .new(milliseconds: 200),
              child: BlocBuilder<EFilesBloc, Set<EImage>>(
                builder: (context, state) => switch (state.isEmpty) {
                  true => const EFilesDragZone(),
                  false => const Placeholder(),
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}