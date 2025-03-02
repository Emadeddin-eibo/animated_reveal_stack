import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

/// Use [offset] to decide your starting point.
/// As for [child], you can use a [Column] or any other widgets.
/// Just keep in mind that [AnimatedRevealStack] is based on
/// a [Stack] widget, and nothing should overlap with the [AnimatedBuilder].
class AnimatedRevealStack extends StatelessWidget {
  final Offset offset;
  final Animation<double> animation;
  final Color color;
  final Widget child;

  const AnimatedRevealStack({
    super.key, // Updated to use null safety
    required this.offset,
    required this.animation,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return ClipPath(
              clipper: _AnimationClipper(
                fraction: animation.value,
                offset: offset,
                height: MediaQuery.of(context).size.height,
              ),
              child: Container(
                color: color,
                child: child,
              ),
            );
          },
        ),
        child,
      ],
    );
  }
}

class _AnimationClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset offset;
  final double height;
  final double radius;
  final double topPadding;

  const _AnimationClipper({
    required this.fraction,
    required this.offset,
    required this.height,
    this.radius = 0,
    this.topPadding = 50,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCircle(
          center: offset,
          radius: lerpDouble(0, height + topPadding, fraction) ?? 0,
        ),
      );
  }

  @override
  bool shouldReclip(covariant _AnimationClipper oldClipper) =>
      fraction != oldClipper.fraction;
}
