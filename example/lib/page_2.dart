import 'package:flutter/material.dart';
import 'package:animated_reveal_stack/animated_reveal_stack.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _animation;
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
        color: Colors.teal,
        offset: Offset(
          MediaQuery.of(context).size.width / 2,
          MediaQuery.of(context).size.height,
        ),
        animation: _animation,
        child: toggle
            ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Text(
              'Hello there!',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'You can place whatever you need here, cool right?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 250),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  _animationController.reverse();
                  setState(() => toggle = !toggle);
                },
                child: Text('Whatever, go back'),
              ),
            ),
          ],
        )
            : Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            onPressed: () {
              _animationController.forward();
              setState(() => toggle = !toggle);
            },
            child: Text('Reveal'),
          ),
        ),
      ),
    );
  }
}
