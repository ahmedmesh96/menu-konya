import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigatortoMenu();
  }
  navigatortoMenu() async{
    await Future.delayed(const Duration(seconds: 5), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MenuScreen()));
  }
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Container(
        height: heightScreen,
        width: widthScreen,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue, Colors.purple
          ],begin:Alignment.topRight, end: Alignment.bottomLeft )),
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("assets/img/Icon-512.png", height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
      
      
      const SizedBox(height: 100.0),
      DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'Brando-Bold',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText('مرحبا بكم في مطعم كونيا',),
            RotateAnimatedText('Welcome to Konya Restaurant'),
            RotateAnimatedText('Konya Restoran\'a Hoş Geldiniz'),
            RotateAnimatedText('بەخێربێن بۆ چێشتخانەی کۆنیا'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
        ],
      )
          ],),
      ),
    );
  }
}