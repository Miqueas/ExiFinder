import 'package:material_ui/material_ui.dart';

import 'e_badge.dart';
import 'e_label.dart';

final class const EGridViewItemInfoNameAndExtension({
  super.key,
  required final String baseName,
  required final String fileExtension,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: ELabel(
            baseName,
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ),
        EBadge(
          child: ELabel(
            fileExtension,
            size: 12,
          ),
        ),
      ],
    );
  }
}