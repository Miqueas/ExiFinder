import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'screens/e_home_screen.dart';

final class const EApp({ super.key, }) extends StatelessWidget {
  ThemeData _buildTheme(Color seedColor, Brightness brightness) {
    final base = ThemeData.from(
      useMaterial3: true,
      colorScheme: .fromSeed(
        seedColor: seedColor,
        brightness: brightness,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.recursiveTextTheme(base.textTheme),
      brightness: brightness,
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'ExiFinder',
    theme: _buildTheme(Colors.deepOrange, .light),
    darkTheme: _buildTheme(Colors.deepOrange, .dark),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (_) => const EHomeScreen(),
    },
  );
}