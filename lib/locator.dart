import 'package:busapp/core/services/facebook_auth_service.dart';
import 'package:get_it/get_it.dart';

import 'core/services/google_auth_services.dart';

GetIt locator = GetIt.instance;
Future setupLocator() async{
locator.registerLazySingleton(()=>FacebookAuthService());
locator.registerLazySingleton(()=>GoogleAuthServices());

}
