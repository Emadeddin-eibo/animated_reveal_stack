import 'package:flutter/material.dart';
import 'package:animated_reveal_stack/animated_reveal_stack.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
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
        color: Colors.teal,
        offset: Offset(
          MediaQuery.of(context).size.width / 2,
          MediaQuery.of(context).size.height / 2,
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
                  Spacer(),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        _animationController.reverse();
                        setState(() => toggle = !toggle);
                      },
                      child: Text('Whatever, go back'),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              )
            : Align(
                alignment: Alignment.center,
                child: MaterialButton(
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
