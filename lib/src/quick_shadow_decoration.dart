import 'package:flutter/material.dart';
import 'quick_shadow_widget.dart';

/// A convenient wrapper that combines [BoxDecoration] with [InnerShadow].
///
/// Instead of nesting widgets manually, use [QuickShadowContainer] as a
/// drop-in replacement for [Container] with inner shadow support.
///
/// ### Example
/// ```dart
/// QuickShadowContainer(
///   width: 160,
///   height: 160,
///   decoration: BoxDecoration(
///     color: Color(0xFFE0E0E0),
///     borderRadius: BorderRadius.circular(20),
///   ),
///   shadows: [
///     Shadow(color: Colors.black26, blurRadius: 12, offset: Offset(5, 5)),
///     Shadow(color: Colors.white70, blurRadius: 12, offset: Offset(-5, -5)),
///   ],
///   child: Icon(Icons.favorite, size: 40),
/// )
/// ```
class QuickShadowContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxDecoration decoration;
  final List<Shadow> shadows;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  const QuickShadowContainer({
    super.key,
    this.width,
    this.height,
    required this.decoration,
    required this.shadows,
    this.child,
    this.padding,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        decoration.borderRadius is BorderRadius ? decoration.borderRadius as BorderRadius : null;

    return QuickShadow(
      shadows: shadows,
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
