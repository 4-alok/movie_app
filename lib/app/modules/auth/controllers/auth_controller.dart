import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/controllers/home_controller.dart';
import 'package:movie_app/app/modules/home/views/home_view.dart';
import 'package:movie_app/app/services/auth.dart';


class AuthController extends GetxController {
  final AuthServices _authServices = Get.find<AuthServices>();

  Future<void> loginFun() async {
    final result = await _authServices.googleSignIn();
    if (result != "") {
      Get.put(HomeController());
      Get.offAll(HomeView());
    }
  }
}
