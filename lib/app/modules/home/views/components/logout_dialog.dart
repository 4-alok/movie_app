import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:movie_app/app/modules/auth/views/login_page.dart';
import 'package:movie_app/app/modules/home/views/components/user_icon.dart';
import 'package:movie_app/app/services/auth.dart';

class LogOutDialog {
  static logout(BuildContext context) {
    final auth = Get.find<AuthServices>();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(10),
        content: Container(
          width: double.maxFinite,
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTile(
                leading: UserIcon(radius: null),
                title: Text(auth.user!.displayName ?? "z"),
                subtitle: Text(auth.user!.email ?? ""),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await auth.signOut();
                      Get.put(AuthController());
                      Get.offAll(LoginPage());
                    },
                    child: Text("Logout"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
