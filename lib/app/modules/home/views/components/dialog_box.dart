import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/services/firestore.dart';

class AddMovieDialog {
  static void dialogBox(BuildContext context) {
    final TextEditingController movieName = TextEditingController();
    final TextEditingController directorName = TextEditingController();
    final TextEditingController artUrl = TextEditingController();

    artUrl.text =
        "https://c8.alamy.com/comp/2BR0X5H/bollywood-indian-cinema-film-bannerposter-with-retro-light-framemovie-glowing-logosymbol-for-your-design-in-retro-vintage-styletemplate-board-with-2BR0X5H.jpg";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(10),
        content: Container(
          width: double.maxFinite,
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text("Add Movie",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 20),
              TextField(
                controller: movieName,
                decoration: InputDecoration(
                  labelText: "Movie name",
                ),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: directorName,
                decoration: InputDecoration(
                  labelText: "Director name",
                ),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: artUrl,
                decoration: InputDecoration(
                  labelText: "Movie art link",
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final Map<String, dynamic> data = {
                    "name": movieName.text,
                    "director": directorName.text,
                    "url": artUrl.text
                  };

                  final FirestoreService f = Get.find<FirestoreService>();
                  f.addItem(data);

                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
