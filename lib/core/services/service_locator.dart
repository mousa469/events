import 'package:events/core/services/custom_flutter_secure_storage.dart';
import 'package:events/core/services/firebase_auth_services.dart';
import 'package:events/core/services/firestore_services.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/features/authentication/data/repos/authentication_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<AuthenticationRepoImpl>(
    AuthenticationRepoImpl(
      authServices: FirebaseAuthServices(),
      databaseServices: FirestoreServices(),
    ),
  );
  getIt.registerSingleton<HiveLocalStorage>(HiveLocalStorage());
  getIt.registerSingleton<CustomFlutterSecureStorage>(CustomFlutterSecureStorage());
}
