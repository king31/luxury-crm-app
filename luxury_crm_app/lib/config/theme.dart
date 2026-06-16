import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A1A2E),
        primary: const Color(0xFF1A1A2E),
        secondary: const Color(0xFFE94560),
        tertiary: const Color(0xFF0F3460),
        surface: const Color(0xFFF8F9FA),
        background: const Color(0xFFF5F6F8),
        error: const Color(0xFFDC3545),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color(0xFF2C3E50),
        onBackground: const Color(0xFF2C3E50),
      ),
      fontFamily: 'Tajawal',
      textTheme: _buildTextTheme(),
      cardTheme: _buildCardTheme(),
      appBarTheme: _buildAppBarTheme(),
      bottomNavigationBarTheme: _buildBottomNavTheme(),
      floatingActionButtonTheme: _buildFABTheme(),
      inputDecorationTheme: _buildInputTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      chipTheme: _buildChipTheme(),
      dataTableTheme: _buildDataTableTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A1A2E),
        brightness: Brightness.dark,
        primary: const Color(0xFF16213E),
        secondary: const Color(0xFFE94560),
        tertiary: const Color(0xFF0F3460),
        surface: const Color(0xFF1A1A2E),
        background: const Color(0xFF0F0F23),
        error: const Color(0xFFDC3545),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
      ),
      fontFamily: 'Tajawal',
      cardTheme: _buildDarkCardTheme(),
      appBarTheme: _buildDarkAppBarTheme(),
    );
  }

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E)),
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E)),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E)),
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C3E50)),
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF2C3E50)),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6C757D)),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF2C3E50)),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF2C3E50)),
      bodySmall: TextStyle(fontSize: 12, color: Color(0xFF6C757D)),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E)),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6C757D)),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFFADB5BD)),
    );
  }

  static CardTheme _buildCardTheme() {
    return CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
    );
  }

  static CardTheme _buildDarkCardTheme() {
    return CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF16213E),
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF1A1A2E),
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  static AppBarTheme _buildDarkAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF0F0F23),
      foregroundColor: Colors.white,
    );
  }

  static BottomNavigationBarThemeData _buildBottomNavTheme() {
    return const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFE94560),
      unselectedItemColor: Color(0xFF6C757D),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    );
  }

  static FloatingActionButtonThemeData _buildFABTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE94560),
      foregroundColor: Colors.white,
    );
  }

  static InputDecorationTheme _buildInputTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE94560), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDC3545), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      labelStyle: const TextStyle(color: Color(0xFF6C757D)),
    );
  }

  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A1A2E),
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontFamily: 'Tajawal',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFE94560),
        textStyle: const TextStyle(
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static ChipThemeData _buildChipTheme() {
    return ChipThemeData(
      backgroundColor: const Color(0xFFF8F9FA),
      selectedColor: const Color(0xFF1A1A2E),
      labelStyle: const TextStyle(color: Color(0xFF2C3E50)),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  static DataTableThemeData _buildDataTableTheme() {
    return DataTableThemeData(
      headingRowColor: MaterialStateProperty.all(const Color(0xFF1A1A2E)),
      headingTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tajawal',
      ),
      dataRowColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFFE94560).withOpacity(0.1);
        }
        return null;
      }),
    );
  }
}
