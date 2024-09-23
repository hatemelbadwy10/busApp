import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/services.dart';

class FacebookAuthService {
  Future<void> logKeyHash() async {
    try {
      const platform = MethodChannel('com.example.busapp/hash');
      final keyHash = await platform.invokeMethod<String>('getKeyHash');
      if (kDebugMode) {
        print('Key Hash: $keyHash');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while fetching key hash: $e');
      }
    }
  }

  Future<void> loginWithFacebook() async {
    await logKeyHash();

    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email','public_profile']
    );
    if (loginResult.status == LoginStatus.success) {
      final accessToken = loginResult.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      if (kDebugMode) {
        print('User email: ${userData['email']}');
        print('User name: ${userData['name']}');
        print('Access token: $accessToken');
      }
    } else {
      if (kDebugMode) {
        print('Facebook login failed: ${loginResult.message}');
      }
    }
  }

  Future<void> logoutFacebook() async {
    await FacebookAuth.instance.logOut();
    if (kDebugMode) {
      print('Logged out of Facebook');
    }
  }
}
