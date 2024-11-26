import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuild/feature/domain/usecases/auth/sign_in_user.dart';
import 'package:rebuild/feature/presentations/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:rebuild/feature/presentations/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:rebuild/local_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInUser signInUser = sl<SignInUser>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text(
            'Авторизация',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: 'Пароль',
            ),
          ),
          ElevatedButton(
            onPressed: () => context
                .read<SignInUserCubit>()
                .auth(emailController.text, passwordController.text),
            child: const Text(
              'Вход',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          BlocListener<SignInUserCubit, SignInUserState>(
            listener: (context, state) {
              if (state is SignInUserLoaded) {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home", arguments: state.user);
              } else if (state is SignInUserError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ошибка аутентификации!'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
