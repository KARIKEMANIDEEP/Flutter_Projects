import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationHome(),
    );
  }
}

class AnimationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animations')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _navButton(context, '1. Implicit Animation', ImplicitAnimationScreen()),
          _navButton(context, '2. Explicit Animation', ExplicitAnimationScreen()),
          _navButton(context, '3. TweenAnimationBuilder', TweenBuilderScreen()),
          _navButton(context, '4. Hero Animation', HeroFirstScreen()),
          _navButton(context, '5. AnimatedBuilder', AnimatedBuilderScreen()),
          _navButton(context, '6. Lottie Animation', LottieScreen()),
          _navButton(context, '7. Custom Loading Spinner', CustomSpinnerScreen()),
          _navButton(context, '8. Animated Bottom NavBar', AnimatedBottomNavBar()),
          _navButton(context, '9. Scroll Animation', ScrollAnimation()),
          _navButton(context, '10. Staggered Animation', StaggeredAnimationScreen()),
          _navButton(context, '11. Like Button Animation', LikeButtonScreen())


        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => screen)),
        child: Text(title),
      ),
    );
  }
}

// 1. Implicit Animation
class ImplicitAnimationScreen extends StatefulWidget {
  @override
  _ImplicitAnimationScreenState createState() => _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animation')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            width: toggled ? 200 : 100,
            height: 100,
            color: toggled ? Colors.blue : Colors.red,
            curve: Curves.easeInBack,
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: toggled ? 1.0 : 0.2,
            child: Text('Fading Text', style: TextStyle(fontSize: 24)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() => toggled = !toggled),
            child: Text('Toggle'),
          )
        ]),
      ),
    );
  }
}

// 2. Explicit Animation
class ExplicitAnimationScreen extends StatefulWidget {
  @override
  _ExplicitAnimationScreenState createState() => _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explicit Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Container(
            width: _animation.value,
            height: _animation.value,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

// 3. TweenAnimationBuilder
class TweenBuilderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TweenAnimationBuilder')),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(seconds: 2),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: Container(width: 100, height: 100, color: Colors.purple),
              ),
            );
          },
        ),
      ),
    );
  }
}

// 4. Hero Animation
class HeroFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation - Page 1')),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HeroSecondScreen())),
          child: Hero(
            tag: 'hero-img',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/naruto.png', width: 500,height: 500,),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation - Page 2')),
      body: Center(
        child: Hero(
          tag: 'hero-img',
          child: Image.asset('assets/naruto.png', width: 300),
        ),
      ),
    );
  }
}

// 5. AnimatedBuilder
class AnimatedBuilderScreen extends StatefulWidget {
  @override
  _AnimatedBuilderScreenState createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotate;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _rotate = Tween(begin: 0.0, end: 2 * 3.14).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder')),
      body: Center(
        child: AnimatedBuilder(
          animation: _rotate,
          builder: (context, child) => Transform.rotate(
            angle: _rotate.value,
            child: child,
          ),
          child: Icon(Icons.sync, size: 100, color: Colors.orange),
        ),
      ),
    );
  }
}

// 6. Lottie Animation
class LottieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lottie Animation')),
      body: Center(
        child: Lottie.asset('assets/animation/birdAnimation.json'),
      ),
    );
  }
}

// 7. Custom Loading Spinner
class CustomSpinnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Loading Spinner')),
      body: Center(child: CustomLoadingSpinner()),
    );
  }
}

class CustomLoadingSpinner extends StatefulWidget {
  @override
  State<CustomLoadingSpinner> createState() => _CustomLoadingSpinnerState();
}

class _CustomLoadingSpinnerState extends State<CustomLoadingSpinner>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;

  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(_rotationController);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_rotationController, _scaleController]),
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.cyanAccent, width: 6),
              ),
            ),
          ),
        );
      },
    );
  }
}
//8.  Animated Bottom Navigation Bar
class AnimatedBottomNavBar extends StatelessWidget {
  const AnimatedBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Bottom Navigation Bar')),
      body: Center(child: AnimatedNavBarExample()),
    );
  }
}

class AnimatedNavBarExample extends StatefulWidget {
  const AnimatedNavBarExample({super.key});

  @override
  State<AnimatedNavBarExample> createState() => _AnimatedNavBarExampleState();
}

class _AnimatedNavBarExampleState extends State<AnimatedNavBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('🏠 Home Screen',style: TextStyle(fontSize: 24)),),
    Center(child: Text('🔄 Spinner Screen',style: TextStyle(fontSize: 24)),),
    Center(child: Text('⚙️ Settings Screen',style: TextStyle(fontSize: 24)))
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.sync,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: ()=>setState(() {
                _selectedIndex = index;
              }),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected?Colors.blue.withOpacity(0.1):Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                          child: Icon(
                            _icons[index],
                            size: isSelected?30:24,
                            color: isSelected?Colors.blue:Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            color: isSelected?Colors.blue:Colors.grey,
                            fontSize: isSelected?14:12,
                            fontWeight: isSelected?FontWeight.bold:FontWeight.normal
                          ),
                          child: Text(index==0? 'Home':index==1?'Spinner':'Settings'),
                        )
                      ],
                    ),
                  ),
            );
          }

          )
        ),
      ),
    );
  }
}
// 9. Scroll Based Animation
class ScrollAnimation extends StatelessWidget {
  const ScrollAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll-Based Animation')),
      body: ScrollAnimationWidget(),
    );
  }
}
class ScrollAnimationWidget extends StatefulWidget {
  const ScrollAnimationWidget({super.key});

  @override
  State<ScrollAnimationWidget> createState() => _ScrollAnimationWidgetState();
}

class _ScrollAnimationWidgetState extends State<ScrollAnimationWidget> {
  late ScrollController _scrollController;
  double _scrollOffset =0;
  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController()
    ..addListener((){
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double opacity =(1 - _scrollOffset/200).clamp(0.0, 1.0);
    double translateY =(_scrollOffset*0.5).clamp(0.0, 100.0);
    
    return ListView(
      controller: _scrollController,
      children: [
        SizedBox(height: 20),
        AnimatedBuilder(
            animation: _scrollController,
            builder: (context, child){
              return Opacity(
                  opacity: opacity,
                child: Transform.translate(
                    offset: Offset(0,translateY),
                child: child,
                ),
              );
            },
          child: Container(
            margin: EdgeInsets.all(16),
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('Scroll-Animated Box', style: TextStyle(color: Colors.white,fontSize: 24),),
          ),
        ),
        ...List.generate(
        20,
            (i)=>ListTile(title: Text('Item ${i + 1}'),),
        ),
      ],
    );
  }
}

// 10.Staggered Animation

class StaggeredAnimationScreen extends StatefulWidget {
  @override
  _StaggeredAnimationScreenState createState() => _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _widthAnimation = Tween<double>(begin: 100, end: 300).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.3, curve: Curves.easeIn)),
    );

    _heightAnimation = Tween<double>(begin: 100, end: 200).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.6, curve: Curves.easeIn)),
    );

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.6, 0.8, curve: Curves.easeIn)),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.8, 1.0, curve: Curves.easeIn)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staggered Animation')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Container(
                    width: _widthAnimation.value,
                    height: _heightAnimation.value,
                    color: _colorAnimation.value,
                    alignment: Alignment.center,
                    child: Text('Animated Box', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _controller.forward(from: 0),
              child: Text('Start Staggered Animation'),
            )
          ],
        ),
      ),
    );
  }
}
//11. Like Button Animation

class LikeButtonScreen extends StatefulWidget {
  @override
  _LikeButtonScreenState createState() => _LikeButtonScreenState();
}

class _LikeButtonScreenState extends State<LikeButtonScreen> with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        _controller.forward(from: 0.0);
      } else {
        _controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Like Button Animation')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: _handleTap,
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
                size: 60,
              ),
            ),
            Positioned(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: 1 - _controller.value,
                      child: Transform.scale(
                        scale: 1 + _controller.value * 2,
                        child: Icon(Icons.favorite, color: Colors.red, size: 60),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (isLiked)
              Positioned(
                bottom: 100,
                child: Lottie.asset(
                  'assets/animation/likeBurst.json',
                  width: 150,
                  repeat: false,
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                    _controller.forward(from: 0.0);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
