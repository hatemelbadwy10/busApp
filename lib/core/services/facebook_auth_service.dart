import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<void> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final accessToken = loginResult.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      if (kDebugMode) {
        print('user data ${userData['email']}');
        print('user data ${userData['name']}');
        print('access token $accessToken');
      }
    }
  }
  Future<void>logoutFacebook ()async{
    await  FacebookAuth.instance.logOut();
  }
}
