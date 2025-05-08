import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly/view/task_view.dart';
import 'package:taskly/viewmodel/task_viewmodel.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      home: ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: Taskview(),
      ),
    );
  }
}