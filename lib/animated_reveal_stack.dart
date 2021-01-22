import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

/// Use [offset] to decide your starting point,
/// as for [child], you can Column or any other widgets.
/// just keep in mind that [AnimatedRevealStack] is based on
/// [Stack] widget, and nothing should overlap with the [AnimatedBuilder]
class AnimatedRevealStack extends StatelessWidget {
  final Offset offset;
  final Animation<double> animation;
  final Color color;
  final Widget child;

  const AnimatedRevealStack({
    Key key,
    @required this.offset,
    this.animation,
    this.color,
    this.child,
  })  : assert(offset != null),
        super(key: key);

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
    @required this.fraction,
    this.offset,
    this.height,
    this.radius,
    this.topPadding = 50,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCircle(
          center: offset,
          radius: lerpDouble(0, height + topPadding, fraction),
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
