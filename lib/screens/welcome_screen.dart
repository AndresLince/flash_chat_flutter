import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.forward();

    animation.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
        SizedBox(
          width: 150.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
              color: Colors.black
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Flash chat'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text:'Log In',
              onPressedFunction: () {
                Navigator.pushNamed(context, LoginScreen.id);
              }
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              onPressedFunction: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

