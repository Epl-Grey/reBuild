import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuild/feature/presentations/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:rebuild/feature/presentations/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:rebuild/feature/presentations/pages/customer/home_page.dart';
import 'package:rebuild/feature/presentations/pages/sign_in_page.dart';
import 'package:rebuild/feature/presentations/pages/sign_up_2_page.dart';

import 'package:rebuild/feature/presentations/pages/sign_up_page.dart';
import 'package:rebuild/feature/presentations/pages/splash_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpUserCubit>(
          create: (context) => sl<SignUpUserCubit>(),
        ),
        BlocProvider<SignInUserCubit>(
          create: (context) => sl<SignInUserCubit>(),
        ),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.white,
          
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
        home: const SplashPage(),
        routes: {
          '/signIn': (context) => const SignInPage(),
          '/signUp': (context) => const SignUpPage(),
          // '/signUp/signUp2': (context) => const SignUp2Page(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
