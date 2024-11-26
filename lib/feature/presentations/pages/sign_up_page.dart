import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebuild/feature/presentations/widgets/segment_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reapetPasswordController = TextEditingController();
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  const Color(0xFF4275FA)
                      .withOpacity(1), // Первый цвет градиента
                  const Color(0xFF1102C6)
                      .withOpacity(87), // Второй цвет градиента
                ],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: const Text(
              'Регистрация',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Text(
            'Выберите вашу роль, введите почту и ваше ФИ',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 46, 45, 86),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CupertinoSlidingSegmentedControl<int>(
                    groupValue: groupValue,
                    thumbColor: const Color(0xFF78C4A4),
                    backgroundColor: Colors.white,
                    children: {
                      0: buildSegment('Заказчик'),
                      1: buildSegment('Подрядчик')
                    },
                    onValueChanged: (groupValue) {
                      // setState(() => this.groupValue = groupValue);
                    })
              ],
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 98, 98, 98),
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: 'Пароль',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 98, 98, 98),
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          ),
          TextField(
            controller: reapetPasswordController,
            decoration: const InputDecoration(
              hintText: 'Повтор пароля',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 98, 98, 98),
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
