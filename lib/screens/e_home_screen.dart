import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

import '../widgets/e_add_button.dart';
import '../widgets/e_app_bar.dart';
import '../widgets/e_clear_button.dart';
import '../widgets/e_icon.dart';
import '../widgets/e_label.dart';
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
              EAddButton(),
            ],
          ),
          Expanded(
            child: Container(
              alignment: .center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(10),
                border: .all(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                ),
                borderRadius: .circular(16)
              ),
              child: Column(
                mainAxisSize: .min,
                children: [
                  EIcon(
                    size: 48,
                    icon: HugeIcons.strokeRoundedImageAdd02,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16,),
                  const ELabel(
                    'Drop images here to inspect them',
                    size: 20,
                    align: .center,
                    maxLines: 2,
                  ),
                  const ELabel(
                    'Or add them with the button below',
                    align: .center,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16,),
                  const EAddButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}