import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebuild/feature/presentations/widgets/segment_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reapetPasswordController = TextEditingController();
  int? groupValue = 0;
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
            'Выберите вашу роль, введите почту и ваше ФИ',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 46, 45, 86),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CupertinoSlidingSegmentedControl<int>(
                    groupValue: groupValue,
                    thumbColor: const Color(0xFF4275FA).withOpacity(1),
                    backgroundColor: Colors.white,
                    children: {
                      0: buildSegment('Заказчик',
                          groupValue == 1 ? Colors.black : Colors.white),
                      1: buildSegment('Подрядчик',
                          groupValue == 1 ? Colors.white : Colors.black)
                    },
                    onValueChanged: (groupValue) {
                      setState(() => this.groupValue = groupValue);
                    })
              ],
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
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
