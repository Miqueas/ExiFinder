import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

import 'e_icon.dart';
import 'e_label.dart';

final class const EGridViewItemInfoSize({
  super.key,
  required final int size,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Row(
      spacing: 8,
      mainAxisSize: .min,
      children: [
        SizedBox(
          height: 16,
          child: VerticalDivider(),
        ),
        EIcon(
          icon: HugeIcons.strokeRoundedFileEmpty02,
          color: onSurface.withAlpha(160),
        ),
        ELabel(
          '${(size / (1024 * 1024)).toStringAsFixed(2)} MB',
          color: onSurface.withAlpha(160),
        ),
      ],
    );
  }
}
