import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:window_manager/window_manager.dart';

import 'e_app_bar_window_control_button.dart';
import 'e_label.dart';

final class const EAppBar({ super.key, })
          extends StatelessWidget
       implements PreferredSizeWidget
{
  @override
  Size get preferredSize => .fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => DragToMoveArea(
    child: Row(
      children: [
        const SizedBox(width: 16,),
        const ELabel('ExiFinder', size: 16, weight: .bold,),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: .all(12),
            child: HugeIcon(
              size: 20,
              icon: HugeIcons.strokeRoundedSettings01,
            ),
          ),
        ),
        const SizedBox(width: 8,),
        const SizedBox(
          height: 20,
          child: VerticalDivider()
        ),
        const SizedBox(width: 8,),
        const EAppBarWindowControlButton(action: .min,),
        const EAppBarWindowControlButton(action: .max,),
        const EAppBarWindowControlButton(action: .close,),
      ],
    ),
  );
}