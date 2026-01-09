import 'dart:math';
import 'package:flutter/material.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';

class LoginParticles extends StatefulWidget {
  const LoginParticles({super.key});

  @override
  State<LoginParticles> createState() => _LoginParticlesState();
}

class _LoginParticlesState extends State<LoginParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<_Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Create 15 particles
    for (int i = 0; i < 15; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: 2 + _random.nextDouble() * 3,
        speed: 0.2 + _random.nextDouble() * 0.8,
        delay: _random.nextDouble(),
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  double x;
  double y;
  final double size;
  final double speed;
  final double delay;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.delay,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  _ParticlePainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.loginParticle
      ..style = PaintingStyle.fill;

    for (var particle in particles) {
      // Calculate current position
      // Particles move upwards like in the frontend
      double currentProgress = (progress + particle.delay) % 1.0;
      double yPos = (particle.y - (currentProgress * particle.speed)) % 1.0;

      // Opacity fades in and out
      double opacity = 0.0;
      if (currentProgress < 0.2) {
        opacity = currentProgress / 0.2;
      } else if (currentProgress > 0.8) {
        opacity = (1.0 - currentProgress) / 0.2;
      } else {
        opacity = 1.0;
      }

      paint.color = AppColors.loginParticle.withValues(alpha: 0.3 * opacity);

      canvas.drawCircle(
        Offset(particle.x * size.width, yPos * size.height),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
