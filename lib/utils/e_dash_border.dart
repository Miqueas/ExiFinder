import 'package:material_ui/material_ui.dart';

final class const EDashBorder({
  final Color color = Colors.black,
  final double width = 1,
  final double radius = 0,
  final double dashSize = 10,
  final double dashSpacing = 5,
  final Gradient? gradient,
  final BorderRadius borderRadius = .zero,
}) extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => .all(radius + width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => getOuterPath(
    rect.deflate(width),
    textDirection: textDirection,
  );

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Path path = getOuterPath(rect, textDirection: textDirection);
    final Paint paint = Paint()
      ..style = .stroke
      ..shader = gradient?.createShader(rect)
      ..strokeWidth = width;

    if (paint.shader == null) paint.color = color;

    // Create the dashed effect
    var distance = 0.0;

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final length = dashSize;
        if (distance + length > metric.length) break;
        final extractPath = metric.extractPath(distance, distance + length);
        canvas.drawPath(extractPath, paint);
        distance += length + dashSpacing;
      }
      distance = 0.0;
    }
  }

  @override
  ShapeBorder scale(double t) => EDashBorder(
    color: color,
    width: width * t,
    radius: radius * t,
    gradient: gradient,
    dashSize: dashSize * t,
    dashSpacing: dashSpacing * t,
    borderRadius: borderRadius * t,
  );
}