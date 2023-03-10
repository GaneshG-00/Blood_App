import 'package:bloodlink/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const Login())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loginicon.png',
              height: MediaQuery.of(context).size.width * 0.50,
              width: MediaQuery.of(context).size.width * 0.50,
            ),
            TyperAnimatedTextKit(
              text: const [
                "BLOODLINK",
              ],
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 116, 17, 10),
              ),
              textAlign: TextAlign.start,
              speed: Duration(milliseconds: 150),
              isRepeatingAnimation: false,
            ),
          ],
        ),
      ),
    );
  }
}
