import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuild/feature/presentations/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:rebuild/feature/presentations/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUp2Page extends StatefulWidget {
  final String email;
  final String name;
  final String sername;
  final bool isCustomer;
  const SignUp2Page({
    super.key,
    required this.name,
    required this.sername,
    required this.isCustomer,
    required this.email,
  });

  @override
  State<SignUp2Page> createState() =>
      _SignUp2PageState(this.isCustomer, this.email, this.name, this.sername);
}

class _SignUp2PageState extends State<SignUp2Page> {
  final passwordController = TextEditingController();
  final reapetpasswordController = TextEditingController();
  bool isCustomer;
  String email;
  String name;
  String sername;
  _SignUp2PageState(this.isCustomer, this.email, this.name, this.sername);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GradientText(
            'Регистрация',
            style: const TextStyle(
              fontSize: 45,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
            ),
            gradientType: GradientType.linear,
            colors: const [
              Color.fromRGBO(66, 117, 250, 100),
              Color.fromRGBO(17, 2, 198, 97)
            ], // Ваши цвета градиента,
          ),
          const Text(
            'Придумайте пароль(не менее 8 символов)',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 46, 45, 86),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Пароль',
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
          TextField(
            controller: reapetpasswordController,
            decoration: const InputDecoration(
              hintText: 'Повторите пароль',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 98, 98, 98),
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (passwordController.text.length < 7) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Пароль должен быть больше 8 символов'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
              if (reapetpasswordController.text.length < 7) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Пароль должен быть больше 8 символов'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
              if (passwordController.text == reapetpasswordController.text &&
                  passwordController.text.length > 7 &&
                  reapetpasswordController.text.length > 7) {
                context.read<SignUpUserCubit>().auth(
                    email, passwordController.text, name, sername, isCustomer);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Пароли не совпадают!'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            child: const Text(
              "Продолжить",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          BlocListener<SignUpUserCubit, SignUpUserState>(
            listener: (context, state) {
              if (state is SignUpUserLoaded) {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home", arguments: state.user);
              } else if (state is SignUpUserError) {
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
