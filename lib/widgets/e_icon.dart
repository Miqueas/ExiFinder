import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

final class const EIcon({
  super.key,
  required final List<List<dynamic>> icon,
  final bool filled = false,
  final bool disableSecondaryOpacity = false,
  final Color? color,
  final Color? secondaryColor,
  final double? size = 24,
  final double? strokeWidth,
}) extends StatelessWidget {
  List<List<dynamic>> _toMutable(List<List<dynamic>> iconData) {
    var result = <List<dynamic>>[];

    for (final list in iconData) {
      final map = list[1] as Map<String, dynamic>;
      result.add([
        'path',
        {
          ...map,
          if (filled) 'fill': 'currentColor',
        }
      ]);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) => HugeIcon(
    size: size,
    icon: _toMutable(icon),
    color: color,
    strokeWidth: strokeWidth,
    secondaryColor: secondaryColor,
    disableSecondaryOpacity: disableSecondaryOpacity,
  );
}