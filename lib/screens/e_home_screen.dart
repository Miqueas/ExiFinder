import 'package:material_ui/material_ui.dart';

import '../widgets/e_add_button.dart';
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
          Expanded(child: EFilesDragZone(),),
        ],
      ),
    ),
  );
}