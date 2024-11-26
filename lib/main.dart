import 'package:flutter/material.dart';

import 'package:rebuild/feature/presentations/pages/sign_up_page.dart';
import 'package:rebuild/local_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://nstaduaseyjakvpmgdqn.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zdGFkdWFzZXlqYWt2cG1nZHFuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1OTg0NjcsImV4cCI6MjA0ODE3NDQ2N30.966o-31QNTjQ0JcM3CsnK6vCBp4s9yIe3D4n_R1-_6o');

  init();
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // inputDecorationTheme: InputDecorationTheme(
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         width: 2, color: AppColors.outlineInputBorder),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         width: 2, color: AppColors.outlineInputBorder),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
      ),
      home: const SignUpPage(),
      routes: {
        '/signIn': (context) => const Placeholder(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const Placeholder(),
      },
    );
  }
}
