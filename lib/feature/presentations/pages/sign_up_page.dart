import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebuild/feature/presentations/widgets/segment_widget.dart';

class SignInPage extends StatelessWidget {
  //final SignInUser signInUser = sl<SignInUser>();

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final reapetPasswordController = TextEditingController();
    int? groupValue = 0;
  
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text(
            'Регистрация',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Text(
            'Выберите вашу роль, введите почту и ваше ФИ',
            style: TextStyle(
              fontSize: 20,
            ),
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
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: 'Пароль',
            ),
          ),
          TextField(
            controller: reapetPasswordController,
            decoration: const InputDecoration(
              hintText: 'Повтор пароля',
            ),
          ),
        ],
      ),
    );
  }
}
