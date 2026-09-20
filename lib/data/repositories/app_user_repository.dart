import '../datasources/local_app_user_data.dart';
import '../models/app_user.dart';

class AppUserRepository {
  const AppUserRepository();

  AppUser get currentUser => LocalAppUserData.current;
}
