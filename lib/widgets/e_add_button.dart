import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../utils/pick_files.dart';
import 'e_icon.dart';
import 'e_label.dart';

final class const EAddButton({ super.key, }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final onPrimary = Theme.of(context).colorScheme.onPrimary;

    return GestureDetector(
      onTap: () => pickFiles(context.read),
      child: Container(
        padding: const .symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: primary,
          border: .all(color: primary),
          borderRadius: .circular(12)
        ),
        child: Row(
          spacing: 8,
          mainAxisSize: .min,
          children: [
            EIcon(
              size: 16,
              icon: HugeIcons.strokeRoundedImageAdd02,
              color: onPrimary,
              strokeWidth: 2,
            ),
            ELabel(
              'Add files',
              color: onPrimary,
              weight: .bold,
            ),
          ],
        ),
      ),
    );
  }
}