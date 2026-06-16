// Path: lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
      ),
      cardColor: const Color(0xFF1E1E1E),
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        secondary: Colors.tealAccent,
        surface: Color(0xFF1E1E1E),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.blue;
          return Colors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return Colors.blue.withValues(alpha: 0.5);
          return Colors.grey.withValues(alpha: 0.5);
        }),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      cardColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.teal,
        surface: Colors.white,
      ),
    );
  }
}
