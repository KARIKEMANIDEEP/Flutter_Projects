import 'package:flutter/material.dart';

class AnimationBasicsPage extends StatelessWidget {
  const AnimationBasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animation Basics'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Implicit'),
              Tab(text: 'Explicit'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ImplicitAnimationExample(),
            ExplicitAnimationExample(),
          ],
        ),
      ),
    );
  }
}

//////////////////////////
// Implicit Animation
//////////////////////////
class ImplicitAnimationExample extends StatefulWidget {
  @override
  _ImplicitAnimationExampleState createState() =>
      _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _toggled ? 200 : 100,
          height: _toggled ? 200 : 100,
          color: _toggled ? Colors.teal : Colors.orange,
          curve: Curves.easeInOut,
          child: Center(child: Text("Tap the button")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _toggled = !_toggled;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

//////////////////////////
// Explicit Animation
//////////////////////////
class ExplicitAnimationExample extends StatefulWidget {
  @override
  _ExplicitAnimationExampleState createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isForward = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: 100, end: 200).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.orange, end: Colors.teal)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: _colorAnimation.value,
              child: Center(child: Text("Tap the button")),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _isForward ? _controller.forward() : _controller.reverse();
          _isForward = !_isForward;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
