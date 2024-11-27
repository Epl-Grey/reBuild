import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuild/feature/domain/usecases/auth/sign_in_user.dart';
import 'package:rebuild/feature/presentations/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:rebuild/feature/presentations/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:rebuild/local_service.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AppBar(
          backgroundColor: Colors.white,
          
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
                   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        color: Colors.white,
          child: Column(
            
            children: <Widget>[
              
             GradientText(
                'Авторизация',
                style: const TextStyle(
                  fontSize: 35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
                gradientType: GradientType.linear,
                colors: const [
                  Color.fromRGBO(66, 117, 250, 100),
                  Color.fromRGBO(17, 2, 198, 97)
                ], // Ваши цвета градиента,
              ),
              const SizedBox.square(
                dimension: 70,
              ),
              TextField(
                controller: emailController,
               decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: const Color(0xFF4275FA).withOpacity(1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: const Color(0xFF4275FA).withOpacity(1)),
                  ),
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 98, 98, 98),
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
              ),
               const SizedBox.square(
                dimension: 24,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: const Color(0xFF4275FA).withOpacity(1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: const Color(0xFF4275FA).withOpacity(1)),
                  ),
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 98, 98, 98),
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox.square(
                dimension: 380,
              ),
            Align(
                             alignment: Alignment.bottomCenter,
        
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(57),
                      foregroundColor: Color(0xFF4175F9),
                      backgroundColor: Color(0xFF4175F9),
                      surfaceTintColor: Color(0xFF4175F9),
                    ),
                  onPressed: () => context
                      .read<SignInUserCubit>()
                      .auth(emailController.text, passwordController.text),
                  child: const Text(
                    'Вход',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      "/signUp",
                    );
                  },
                  child: const Text(
                    'Создать новый аккаунт',
                    style: TextStyle(
                    color: Color(0xFF4175F9),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    
                  ),
                    )
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
        ),
      ),
    );
  }
}
