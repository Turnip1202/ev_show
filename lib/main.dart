import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/scan_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScanProvider(),
      child: const EvShowApp(),
    ),
  );
}

class EvShowApp extends StatelessWidget {
  const EvShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '环境管家 · ev_show',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          brightness: Brightness.light,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          margin: EdgeInsets.zero,
        ),
        appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 1),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          brightness: Brightness.dark,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade800),
          ),
          margin: EdgeInsets.zero,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
