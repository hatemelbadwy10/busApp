import 'package:google_sign_in/google_sign_in.dart';
class GoogleAuthServices{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
Future<void> signInWithGoogle()async{
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  if (googleUser == null) return ;
  //final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
print(googleUser.displayName);
print(googleUser.email);

}
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}