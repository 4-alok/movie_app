import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:movie_app/app/modules/auth/views/login_page.dart';
import 'package:movie_app/app/modules/auth/views/wrapper.dart';
import 'package:movie_app/app/modules/home/views/components/dialog_box.dart';
import 'package:movie_app/app/modules/home/views/components/logout_dialog.dart';
import 'package:movie_app/app/modules/home/views/components/movies_list.dart';
import 'package:movie_app/app/modules/home/views/components/user_icon.dart';
import 'package:movie_app/app/services/auth.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: MoviesList(),
      floatingActionButton: fab(context),
    );
  }

  FloatingActionButton fab(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => AddMovieDialog.dialogBox(context),
      icon: Icon(Icons.add),
      label: Text("Add Movie"),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Movie App",
        style: Theme.of(context).textTheme.headline5,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () async {
              LogOutDialog.logout(context);
            },
            child: UserIcon(radius: 15),
          ),
        )
      ],
    );
  }
}
