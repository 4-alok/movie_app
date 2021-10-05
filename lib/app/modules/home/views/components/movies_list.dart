import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/auth/views/wrapper.dart';
import 'package:movie_app/app/services/firestore.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
  }) : super(key: key);

  String _processData(
      QuerySnapshot<Map<String, dynamic>>? data, int index, String column) {
    try {
      final Map<String, dynamic>? _data = data?.docs[index].data();
      return _data == null ? "" : _data[column];
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: Get.find<FirestoreService>().databaseStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(child: Text("Error : $error"));
          } else if (snapshot.hasData) {
            final QuerySnapshot<Map<String, dynamic>>? _data = snapshot.data;
            final int _length = snapshot.data?.docs.length ?? 0;
            if (_length == 0) {
              return Center(
                child: Text("No Data"),
              );
            }

            return ListView.builder(
              itemCount: _length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      leading: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _processData(_data, index, "url"),
                        placeholder: (context, url) => Icon(Icons.movie),
                        errorWidget: (context, url, error) => Icon(Icons.movie),
                      ),
                      title: Text(_processData(_data, index, "name")),
                      subtitle: Text(_processData(_data, index, "director")),
                      trailing: IconButton(
                        onPressed: () async {
                          await _data!.docs[index].reference.delete();
                        },
                        icon: Icon(Icons.delete),
                      )
                      ),
                );
              },
            );
          } else {
            return Center(
                child: Text(
              "Something went wrong",
            ));
          }
        });
  }
}
