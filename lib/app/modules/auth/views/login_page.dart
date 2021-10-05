import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    const double radius = 30;
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: FlutterLogo(
            size: 250,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * .1,
            child: Padding(
              padding: const EdgeInsets.only(left: radius, right: radius),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, radius * 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius))),
                child: Text("Login"),
                onPressed: controller.loginFun,
              ),
            ))
      ],
    ));
  }

  RoundedRectangleBorder round() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.red));
  }
}
