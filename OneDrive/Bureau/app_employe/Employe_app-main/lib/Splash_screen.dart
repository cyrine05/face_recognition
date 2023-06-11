import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_employe/login.dart';
import 'package:app_employe/widgets/label.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _animationController.forward().whenComplete(() {
      Get.to(Login(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 800));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [Color(0xff2F58CD), Color(0xff3A1078)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: FadeTransition(
                opacity: _animation,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LabelTxt(
                          text: 'Bee',
                          size: 48.0,
                          fn: FontWeight.w600,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: Get.height * 0.3,
                        ),
                        LabelTxt(
                          text: 'Welcome Back !',
                          size: 40.0,
                          fn: FontWeight.w600,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        LabelTxt(
                          text: 'Connect now and get in touch with HR ',
                          size: 16.0,
                          fn: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
