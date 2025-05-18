import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// A widget that displays animated waves to represent audio activity
class WaveAnimation extends StatefulWidget {
  /// Whether the animation is active (audio playing or listening)
  final bool isActive;

  /// The intensity of the animation (0.0 to 1.0)
  final double intensity;

  /// The color of the waves
  final Color color;

  /// The number of waves to display
  final int waveCount;

  /// Whether the animation should be subtle (background mode) or prominent
  final bool isSubtle;

  /// Animation duration in milliseconds
  final int animationDuration;

  const WaveAnimation({
    super.key,
    this.isActive = false,
    this.intensity = 0.5,
    this.color = AppTheme.primaryColor,
    this.waveCount = 3,
    this.isSubtle = false,
    this.animationDuration = 1500,
  });

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<double> _randomOffsets = [];
  final List<double> _randomPhases = [];
  final List<double> _randomSpeeds = [];

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    // Initialize random values for the waves
    _initializeRandomValues();

    // Start animation if active
    if (widget.isActive) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(WaveAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update animation state based on isActive property changes
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }

    // Update animation duration if it changed
    if (widget.animationDuration != oldWidget.animationDuration) {
      _controller.duration = Duration(milliseconds: widget.animationDuration);
    }

    // Re-initialize random values if wave count changed
    if (widget.waveCount != oldWidget.waveCount) {
      _initializeRandomValues();
    }
  }

  void _initializeRandomValues() {
    // Clear existing values
    _randomOffsets.clear();
    _randomPhases.clear();
    _randomSpeeds.clear();

    // Generate new random values for each wave
    final random = math.Random();
    for (int i = 0; i < widget.waveCount; i++) {
      _randomOffsets.add(random.nextDouble() * 10);
      _randomPhases.add(random.nextDouble() * 2 * math.pi);
      _randomSpeeds.add(0.5 + random.nextDouble() * 0.5); // Speed variation
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
          painter: _WavePainter(
            animationValue: _controller.value,
            isActive: widget.isActive,
            intensity: widget.intensity,
            color: widget.color,
            waveCount: widget.waveCount,
            isSubtle: widget.isSubtle,
            randomOffsets: _randomOffsets,
            randomPhases: _randomPhases,
            randomSpeeds: _randomSpeeds,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

/// Custom painter that draws the wave animation
class _WavePainter extends CustomPainter {
  final double animationValue;
  final bool isActive;
  final double intensity;
  final Color color;
  final int waveCount;
  final bool isSubtle;
  final List<double> randomOffsets;
  final List<double> randomPhases;
  final List<double> randomSpeeds;

  _WavePainter({
    required this.animationValue,
    required this.isActive,
    required this.intensity,
    required this.color,
    required this.waveCount,
    required this.isSubtle,
    required this.randomOffsets,
    required this.randomPhases,
    required this.randomSpeeds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!isActive && intensity <= 0) return;

    final width = size.width;
    final height = size.height;

    // Calculate effective intensity (reduced if not active)
    final effectiveIntensity = isActive ? intensity : intensity * 0.3;

    // Calculate the amplitude of waves based on intensity
    final baseAmplitude = isSubtle ? height * 0.05 : height * 0.15;
    final amplitude = baseAmplitude * effectiveIntensity;

    // Draw each wave
    for (int i = 0; i < waveCount; i++) {
      final opacity =
          isSubtle ? 0.1 + (i / waveCount) * 0.2 : 0.3 + (i / waveCount) * 0.5;

      final paint =
          Paint()
            ..color = color.withOpacity(opacity)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.0 + (i * 0.5); // Slightly varied stroke width

      // Calculate the current phase of this wave
      final phase =
          randomPhases[i] + (animationValue * 2 * math.pi * randomSpeeds[i]);
      final frequency =
          0.015 + (0.005 * i); // Slightly different frequencies for each wave
      final offsetY = height / 2;

      // Create a path for the wave
      final path = Path();
      path.moveTo(0, offsetY);

      // Draw the wave as a sinusoidal curve
      for (double x = 0; x <= width; x++) {
        final y =
            math.sin(x * frequency + phase + randomOffsets[i]) * amplitude +
            offsetY;
        path.lineTo(x, y);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.isActive != isActive ||
        oldDelegate.intensity != intensity ||
        oldDelegate.color != color;
  }
}
