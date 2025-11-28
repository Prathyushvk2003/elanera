import 'package:elanera/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
// Make sure this file exists in your project

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToNext(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 243, 237),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _navigateToNext(context),
        child: Center(
          child: SlideTransition(
            position: _animation,
            child: Image.asset(
              'assets/logo.jpg', // Ensure the image exists in your assets
              width: 280,
              height: 2800,
            ),
          ),
        ),
      ),
    );
  }
}
