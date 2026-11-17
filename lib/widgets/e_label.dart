import 'package:material_ui/material_ui.dart';

final class const ELabel(final String text, {
  super.key,
  final int? maxLines,
  final Color? color,
  final double? size,
  final String? family,
  final TextAlign? align,
  final FontWeight? weight,
  final TextOverflow? overflow,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: .new(
      color: color,
      fontSize: size,
      fontWeight: weight,
      fontFamily: family,
    ),
    overflow: overflow,
    maxLines: maxLines,
    textAlign: align,
  );
}