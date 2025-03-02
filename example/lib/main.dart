import 'package:flutter/material.dart';
import 'package:animated_reveal_stack/animated_reveal_stack.dart';

import 'page_2.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      // Change this to Page2 to see the other example.
      // home: Page2(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _animation;
  bool toggle = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuint,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedRevealStack(
        // This is the starting point of the circular reveal,
        // for now, it's in the middle of our screen.
        offset: Offset(
          MediaQuery.of(context).size.width / 2,
          MediaQuery.of(context).size.height / 2,
        ),
        color: Colors.teal,
        animation: _animation,
        child: Center(
          child: MaterialButton(
            onPressed: () {
              toggle
                  ? _animationController.reverse()
                  : _animationController.forward();
              setState(() => toggle = !toggle);
            },
            child: Text(toggle ? 'Close' : 'Reveal'),
          ),
        ),
      ),
    );
  }
}
