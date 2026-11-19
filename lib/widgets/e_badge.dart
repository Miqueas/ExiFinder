import 'package:material_ui/material_ui.dart';

final class const EBadge({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: .symmetric(vertical: 4, horizontal: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer.withAlpha(120),
      border: .all(color: Theme.of(context).colorScheme.primaryContainer),
      borderRadius: .circular(120),
    ),
    child: child,
  );
}