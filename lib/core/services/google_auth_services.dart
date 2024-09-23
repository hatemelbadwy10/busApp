import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthServices {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User canceled the sign-in

      GoogleSignInAuthentication? googleSignInAuthentication =
          await (await GoogleSignIn(
        scopes: ["profile", "email"],
      ).signIn())
              ?.authentication;
      print('User signed in: ${googleUser.displayName}');
      print('Email: ${googleUser.email}');
      print('ID Token: ${googleSignInAuthentication!.idToken}');
      print('Access Token: ${googleSignInAuthentication!.accessToken}');
    } catch (error) {
      print('Sign-in failed: $error');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
