import 'package:events/core/services/connectivity_service.dart';
import 'package:events/core/services/custom_flutter_secure_storage.dart';
import 'package:events/core/services/firebase_auth_services.dart';
import 'package:events/core/services/firestore_services.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/core/services/location_services.dart';
import 'package:events/core/services/uuid_generator.dart';
import 'package:events/core/utilies/event_info.dart';
import 'package:events/features/authentication/data/repos/authentication_repo_impl.dart';
import 'package:events/features/layout/choose_event_location/data/repo/choose_event_location_repo_imp.dart';
import 'package:events/features/layout/create_event/data/data_sources/create_event_local_data_source.dart';
import 'package:events/features/layout/create_event/data/data_sources/remote_data_source.dart';
import 'package:events/features/layout/create_event/data/repos/create_event_repo_imp.dart';
import 'package:events/features/layout/home/data/data%20sources/home_repo_local_data_source.dart';
import 'package:events/features/layout/home/data/data%20sources/home_repo_remote_data_source.dart';
import 'package:events/features/layout/home/data/cubits/fetch_user_events.dart/fetch_user_events_cubit.dart';
import 'package:events/features/layout/home/data/repos/home_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<HiveLocalStorage>(HiveLocalStorage());
  getIt.registerSingleton<ConnectivityService>(ConnectivityService());
  getIt.registerSingleton<FirestoreServices>(FirestoreServices());
  getIt.registerSingleton<UuidGenerator>(UuidGenerator());
  getIt.registerSingleton<CustomFlutterSecureStorage>(
    CustomFlutterSecureStorage(),
  );
  getIt.registerSingleton<HomeRepoLocalDataSourceImpl>(
    HomeRepoLocalDataSourceImpl(
      localStorage: getIt<HiveLocalStorage>(),
      secureLocalStorage: getIt<CustomFlutterSecureStorage>(),
    ),
  );
  getIt.registerSingleton<HomeRepoRemoteDataSourceImpl>(
    HomeRepoRemoteDataSourceImpl(
      secureLocalStorage: getIt<CustomFlutterSecureStorage>(),
      databaseServices: getIt<FirestoreServices>(),
    ),
  );

  getIt.registerSingleton<CreateEventRemoteDataSourceImpl>(
    CreateEventRemoteDataSourceImpl(
      databaseServices: getIt<FirestoreServices>(),
      idGenerator: getIt<UuidGenerator>(),
      securelocalStorage: getIt<CustomFlutterSecureStorage>(),
    ),
  );

  getIt.registerSingleton<AuthenticationRepoImpl>(
    AuthenticationRepoImpl(
      networkChecker: getIt<ConnectivityService>(),
      authServices: FirebaseAuthServices(),
      databaseServices: getIt<FirestoreServices>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      networkChecker: getIt<ConnectivityService>(),
      homeRepoLocalDataSource: getIt<HomeRepoLocalDataSourceImpl>(),
      homeRepoRemoteDataSource: getIt<HomeRepoRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<CreateEventRepoImp>(
    CreateEventRepoImp(
      networkChecker: getIt<ConnectivityService>(),
      createEventLocalDataSource: CreateEventLocalDataSourceImpl(
        localStorage: HiveLocalStorage(),
      ),
      createEventRemoteDataSource: getIt<CreateEventRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<ChooseEventLocationRepoImp>(
    ChooseEventLocationRepoImp(mainLocationServices: LocationServices()),
  );
  getIt.registerSingleton<EventInformation>(EventInformation());
 
}
