import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (Synchronized with frontend DESIGN_TOKENS)
  static const Color primary = Color(0xFF004831);
  static const Color secondary = Color(0xFFAFCA31);
  static const Color accent = Color(0xFFAFCA31);

  // Semantic Colors (Synchronized with frontend DESIGN_TOKENS)
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Background Colors
  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE5E7EB);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFFFFFFF);

  // Dark Mode Colors (Linear Style - Premium Technical)
  static const Color darkPrimary = Color(0xFF10B981);
  static const Color darkSecondary = Color(0xFFD4EF7B);
  static const Color darkBackground = Color(0xFF0B0C0E); // Deep Neutral
  static const Color darkSurface =
      Color(0xFF16181C); // Distinct Technical Surface
  static const Color darkTextPrimary = Color(0xFFF0F0F0); // Soft White
  static const Color darkTextSecondary = Color(0xFFB0B0B8); // Cool Gray
  static const Color darkDivider = Color(0xFF2E323A); // Structural Gray

  // Login Theme (Matches frontend administrative portal)
  static const Color loginBgStart = Color(0xFF1A1A2E);
  static const Color loginBgMiddle = Color(0xFF3B1E54);
  static const Color loginBgEnd = Color(0xFF1A1A2E);
  static const Color loginParticle =
      Color(0x4D9333EA); // #9333EA with 0.3 opacity

  // Dashboard Gradients (Enhanced for Premium feel)
  static const List<Color> blueGradient = [
    Color(0xFF3B82F6),
    Color(0xFF2DD4BF)
  ];
  static const List<Color> greenGradient = [
    Color(0xFF10B981),
    Color(0xFF34D399)
  ];
  static const List<Color> orangeGradient = [
    Color(0xFFF59E0B),
    Color(0xFFFBBF24)
  ];
  static const List<Color> purpleGradient = [
    Color(0xFF8B5CF6),
    Color(0xFFA78BFA)
  ];

  // Status Colors (Mapping to Semantic Colors)
  static const Color active = success;
  static const Color inactive = error;
  static const Color maintenance = warning;
  static const Color disposed = Color(0xFF9CA3AF);
  static const Color broken = error;
  static const Color pending = warning;
  static const Color processing = info;
  static const Color completed = success;
  static const Color dismissed = Color(0xFFD1D5DB);

  // Shimmer Colors
  static const Color shimmerBase = Color(0xFFE0E0E0); // Colors.grey[300] approx
  static const Color shimmerHighlight =
      Color(0xFFF5F5F5); // Colors.grey[100] approx
}
