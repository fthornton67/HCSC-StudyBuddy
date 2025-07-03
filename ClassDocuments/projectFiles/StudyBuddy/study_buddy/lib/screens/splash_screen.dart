import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/images/morehouse-background.mp4',
      )
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });

    // Navigate to main screen after 10 seconds
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Video Background
          _controller.value.isInitialized
              ? FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              )
              : Container(
                color: const Color(0xFF8B0000), // Morehouse Maroon fallback
              ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF8B0000).withOpacity(0.7), // Morehouse Maroon
                  const Color(0xFF8B0000).withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Morehouse Logo
                SvgPicture.asset(
                      'assets/images/morehouse-logo.svg',
                      height: 150,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideX(
                      begin: -1.0,
                      end: 0.0,
                      duration: 800.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .scale(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(1.0, 1.0),
                      duration: 800.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .then()
                    .shake(duration: 600.ms),

                const SizedBox(height: 20),

                // Animated text
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Study Buddy',
                      textStyle: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),

                const SizedBox(height: 20),

                // Subtitle
                Text(
                  'Your Perfect Study Companion',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.3, end: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
