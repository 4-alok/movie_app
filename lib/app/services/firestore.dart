import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/app/services/auth.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> addItem(Map<String, dynamic> _data) async {
    final AuthServices auth = Get.find<AuthServices>();

    try {
      await firestore
          .collection("database")
          .doc("user")
          .collection(auth.user!.email!)
          .add(_data);
      return "";
    } catch (e) {
      return e.toString();
    }
  }

  // Future<List<Map<String, dynamic>>> getList() async {
  //   QuerySnapshot<Map<String, dynamic>> result = await firestore
  //       .collection("database")
  //       .doc("sheet")
  //       .collection("data")
  //       .get();
  //   List<Map<String, dynamic>> data = [];
  //   for (QueryDocumentSnapshot<Map<String, dynamic>> e in result.docs) {
  //     data.add(e.data());
  //   }
  //   return data;
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> databaseStream() {
    final AuthServices auth = Get.find<AuthServices>();
    return firestore
        .collection("database")
        .doc("user")
        .collection(auth.user!.email!)
        .snapshots();
  }
}
