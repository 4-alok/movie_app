import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:movie_app/app/modules/home/controllers/home_controller.dart';
import 'package:movie_app/app/modules/home/views/home_view.dart';
import 'package:movie_app/app/services/auth.dart';
import 'login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthServices _authServices = Get.find<AuthServices>();
    if (_authServices.user == null) {
      Get.put(AuthController());
      return LoginPage();
    } else {
      Get.put(HomeController());
      return HomeView();
    }
  }
}
