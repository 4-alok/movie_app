import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? user;

  @override
  void onInit() {
    user = _auth.currentUser;
    super.onInit();
  }

  Future<String> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      if (googleAuth != null) {
        final OAuthCredential credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential result =
            await _auth.signInWithCredential(credentials);
        user = result.user;
        return "Welcom ${(user!.displayName) ?? ""}";
      } else {
        // Utils.snackbar("Error", "Something went wrong");
        return "";
      }
    } catch (e) {
      // Utils.snackbar("Error", e.toString());
      return "";
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    user = null;
  }
}
