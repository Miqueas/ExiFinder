import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

final class const ESearchField({ super.key }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    final onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;

    return Container(
      padding: const .all(8),
      decoration: BoxDecoration(
        color: primaryContainer.withAlpha(120),
        border: .all(color: primaryContainer, width: 1),
        borderRadius: .circular(12),
      ),
      child: Row(
        spacing: 8,
        children: [
          HugeIcon(
            color: onPrimaryContainer,
            icon: HugeIcons.strokeRoundedSearch02,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: onPrimaryContainer,),
              decoration: const .collapsed(hintText: 'Search'),
              cursorColor: onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}