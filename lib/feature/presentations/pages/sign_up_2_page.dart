import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUp2Page extends StatefulWidget {
  const SignUp2Page({super.key});

  @override
  State<SignUp2Page> createState() => _SignUp2PageState();
}

class _SignUp2PageState extends State<SignUp2Page> {
  final passwordController = TextEditingController();
  final reapetpasswordController = TextEditingController();
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
              Navigator.pop(context);
              Navigator.pushNamed(context, "/signIn");
            },
            child: const Text(
              "Продолжить",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
