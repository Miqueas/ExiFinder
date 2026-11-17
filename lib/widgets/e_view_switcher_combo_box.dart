import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

import '../bloc/e_view_mode_bloc.dart';
import 'e_view_switcher_combo_box_button.dart';

final class const EViewSwitcherComboBox({ super.key, })
          extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final viewModeBloc = context.watch<EViewModeBloc>();

    return Container(
      padding: const .all(6),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        border: .all(color: Colors.white.withAlpha(60)),
        borderRadius: .circular(12)
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: .min,
        children: [
          EViewSwitcherComboBoxButton(
            icon: HugeIcons.strokeRoundedGridView,
            active: viewModeBloc.state == .grid,
            onTap: () {
              viewModeBloc.add(ESetViewMode(.grid));
            }
          ),
          EViewSwitcherComboBoxButton(
            icon: HugeIcons.strokeRoundedLayoutList,
            active: viewModeBloc.state == .list,
            onTap: () {
              viewModeBloc.add(ESetViewMode(.list));
            }
          ),
        ],
      ),
    );
  }
}