import 'package:material_ui/material_ui.dart';

import 'e_icon.dart';

final class const EViewSwitcherComboBoxButton({
  super.key,
  required final bool active,
  required final VoidCallback onTap,
  required final List<List<dynamic>> icon,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final surface = Theme.of(context).colorScheme.surface;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const .symmetric(vertical: 6, horizontal: 16),
        duration: const .new(milliseconds: 150),
        decoration: BoxDecoration(
          color: active ? primary : null,
          borderRadius: .circular(6)
        ),
        child: EIcon(
          size: 16,
          icon: icon,
          color: active ? surface : null,
          filled: active,
        ),
      ),
    );
  }
}