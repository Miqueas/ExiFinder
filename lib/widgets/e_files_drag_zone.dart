import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../utils/e_dash_border.dart';
import '../utils/pick_files.dart';
import 'e_add_button.dart';
import 'e_icon.dart';
import 'e_label.dart';

final class const EFilesDragZone({ super.key, }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => pickFiles(context.read),
    child: Container(
      alignment: .center,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(10),
        shape: EDashBorder(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(60),
          borderRadius: .circular(16),
        ),
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
            weight: .bold,
            maxLines: 2,
          ),
          ELabel(
            'Or add them with the button below',
            align: .center,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
            maxLines: 2,
          ),
          const SizedBox(height: 16,),
          const EAddButton(),
        ],
      ),
    ),
  );
}