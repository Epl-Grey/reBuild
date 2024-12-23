import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebuild/feature/presentations/pages/sign_up_2_page.dart';
import 'package:rebuild/feature/presentations/widgets/segment_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final sernameController = TextEditingController();
  int? groupValue = 0;

  bool _validateInput(TextEditingController controller) {
    bool isntempty = false;
    setState(() {
      if (controller.text.isEmpty) {
        isntempty = false;
      } else {
        isntempty = true; // Обнуляем ошибку, если ввод валиден
      }
    });
    return isntempty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GradientText(
                'Регистрация',
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
                dimension: 12,
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
              const SizedBox.square(
                dimension: 70,
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
                          print(groupValue);
                        })
                  ],
                ),
              ),
              const SizedBox.square(
                dimension: 32,
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
                  focusedBorder: OutlineInputBorder(
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
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Имя',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: const Color(0xFF4275FA).withOpacity(1)),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                controller: sernameController,
                decoration: InputDecoration(
                  hintText: 'Фамилия',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: const Color(0xFF4275FA).withOpacity(1)),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                dimension: 130,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(57),
                      foregroundColor: Color(0xFF4175F9),
                      backgroundColor: Color(0xFF4175F9),
                      surfaceTintColor: Color(0xFF4175F9),
                    ),
                    onPressed: () {
                      if (_validateInput(emailController) &
                          _validateInput(nameController) &
                          _validateInput(sernameController)) {
                        bool isCustomer = groupValue == 0 ? true : false;
                         Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUp2Page(
                                  name: nameController.text,
                                  sername: sernameController.text,
                                  email: emailController.text,
                                  isCustomer: isCustomer,
                                )));
                        // Navigator.pushNamed(
                        //   context,
                        //   "/signUp/signUp2",
                        // );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Все поля должны быть заполнены'),
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
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      "/signIn",
                    );
                  },
                  child: const Text(
                    'Уже есть аккаунт? Войди',
                    style: TextStyle(
                      color: Color(0xFF4175F9),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
