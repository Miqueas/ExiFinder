import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

import 'e_icon.dart';
import 'e_label.dart';

final class const EGridViewItemInfoDimensions({
  super.key,
  required final int width,
  required final int height,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Row(
      spacing: 8,
      mainAxisSize: .min,
      children: [
        EIcon(
          icon: HugeIcons.strokeRoundedImage02,
          color: onSurface.withAlpha(160),
        ),
        ELabel(
          '$width x $height',
          color: onSurface.withAlpha(160),
        ),
      ],
    );
  }
}
