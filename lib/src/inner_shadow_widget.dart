import 'package:flutter/material.dart';

/// A widget that paints inner shadows on top of its [child].
///
/// Uses an even-odd path with blur to correctly render shadows
/// inside the widget bounds — including rounded corners.
///
/// ### Basic Example
/// ```dart
/// InnerShadow(
///   shadows: [
///     Shadow(color: Colors.black38, blurRadius: 10, offset: Offset(4, 4)),
///   ],
///   borderRadius: BorderRadius.circular(16),
///   child: Container(
///     width: 150,
///     height: 150,
///     decoration: BoxDecoration(
///       color: Color(0xFFE0E0E0),
///       borderRadius: BorderRadius.circular(16),
///     ),
///   ),
/// )
/// ```
///
/// ### Neumorphism Example
/// ```dart
/// InnerShadow(
///   shadows: [
///     Shadow(color: Colors.black26, blurRadius: 12, offset: Offset(6, 6)),
///     Shadow(color: Colors.white70, blurRadius: 12, offset: Offset(-6, -6)),
///   ],
///   borderRadius: BorderRadius.circular(20),
///   child: Container(
///     width: 150,
///     height: 150,
///     decoration: BoxDecoration(
///       color: Color(0xFFE0E5EC),
///       borderRadius: BorderRadius.circular(20),
///     ),
///   ),
/// )
/// ```
class InnerShadow extends StatelessWidget {
  /// The shadows to paint inside the widget.
  final List<Shadow> shadows;

  /// Must match the [child]'s BorderRadius for proper edge clipping.
  final BorderRadius? borderRadius;

  /// The widget to apply inner shadow on.
  final Widget child;

  const InnerShadow({
    super.key,
    required this.shadows,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _InnerShadowPainter(
        shadows: shadows,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final List<Shadow> shadows;
  final BorderRadius? borderRadius;

  _InnerShadowPainter({
    required this.shadows,
    this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = borderRadius != null
        ? borderRadius!.toRRect(rect)
        : RRect.fromRectAndRadius(rect, Radius.zero);

    for (final shadow in shadows) {
      final sigma = Shadow.convertRadiusToSigma(shadow.blurRadius);
      final offsetDistance = shadow.offset.distance;
      final inflate = sigma * 3 + offsetDistance + 10;

      final paint = Paint()
        ..color = shadow.color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, sigma);

      // Even-odd path: large filled rect minus a "hole" (the shape shifted
      // opposite to the shadow offset). The blur bleeds from the hole edge
      // inward, creating the inner shadow effect.
      final path = Path()
        ..addRect(rect.inflate(inflate))
        ..addRRect(rRect.shift(-shadow.offset))
        ..fillType = PathFillType.evenOdd;

      canvas.save();
      canvas.clipRRect(rRect); // restrict shadow to inside the shape only
      canvas.drawPath(path, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_InnerShadowPainter oldDelegate) {
    return oldDelegate.shadows != shadows || oldDelegate.borderRadius != borderRadius;
  }
}
