// import 'package:clean_arc/core/app_storage/secure_storage_service.dart';
// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
//   return SecureStorageService();
// });

// final authTokenProvider = FutureProvider<String?>((ref) async {
//   return ref.read(secureStorageServiceProvider).getToken();
// });

// Future<Dio> createConfiguredDio({String? languageCode}) async {
//   final token = await SecureStorageService().getToken();
//   final normalizedLanguageCode =
//       (languageCode ??
//                   WidgetsBinding
//                       .instance
//                       .platformDispatcher
//                       .locale
//                       .languageCode)
//               .toLowerCase() ==
//           'ar'
//       ? 'ar'
//       : 'en';

//   final dio = Dio(
//     BaseOptions(
//       maxRedirects: 10000,
//       connectTimeout: const Duration(seconds: 30),
//       baseUrl: ApiConstants.baseUrl,
//       headers: {
//         'Accept': 'application/json',
//         'lang': normalizedLanguageCode,
//         'Content-Type': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       },
//     ),
//   );

//   if (kDebugMode) {
//     dio.interceptors.add(
//       PrettyDioLogger(
//         responseBody: true,
//         error: true,
//         requestHeader: true,
//         request: true,
//         compact: true,
//         maxWidth: 90,
//         requestBody: true,
//         responseHeader: true,
//       ),
//     );
//   }

//   return dio;
// }

// final dioProvider = FutureProvider<Dio>((ref) async {
//   final token = await ref.watch(authTokenProvider.future);
//   final locale = WidgetsBinding.instance.platformDispatcher.locale;
//   final languageCode = locale.languageCode.toLowerCase() == 'ar' ? 'ar' : 'en';

//   final dio = Dio(
//     BaseOptions(
//       maxRedirects: 10000,
//       connectTimeout: const Duration(seconds: 30),
//       baseUrl: ApiConstants.baseUrl,
//       headers: {
//         'Accept': 'application/json',
//         'lang': languageCode,
//         'Content-Type': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       },
//     ),
//   );

//   if (kDebugMode) {
//     dio.interceptors.add(
//       PrettyDioLogger(
//         responseBody: true,
//         error: true,
//         requestHeader: true,
//         request: true,
//         compact: true,
//         maxWidth: 90,
//         requestBody: true,
//         responseHeader: true,
//       ),
//     );
//   }

//   return dio;
// });

// final apiServiceProvider = FutureProvider<ApiService>((ref) async {
//   final dio = await ref.watch(dioProvider.future);
//   return ApiService(dio);
// });
 
 
 
 // flutter_riverpod اللي فوق بستخدام 



//  git it 
//  import 'package:amlak/core/utiles/constants/keys.dart';
// import 'package:amlak/core/utiles/local_storage_manager/hive_handler.dart';
// import 'package:amlak/core/utiles/local_storage_manager/shared_prefrences_helper.dart';
// import 'package:amlak/core/utiles/networking/api_constants.dart';
// import 'package:amlak/core/utiles/networking/api_service.dart';
// import 'package:amlak/core/utiles/services/social_auth_service.dart';
// import 'package:amlak/features/App/Evaluate%20your%20area/data/repo/rateRepo.dart';
// import 'package:amlak/features/App/My%20ads/data/repos/my_ads_repo.dart';
// import 'package:amlak/features/App/Notifications/data/repos/notification_repo.dart';
// import 'package:amlak/features/App/Subscriptions/data/repo/PackagesRepo.dart';
// import 'package:amlak/features/App/add_property/data/repos/add_property_repo.dart';
// import 'package:amlak/features/App/auth/data/repos/auth_repo.dart';
// import 'package:amlak/features/App/chatBot/data/repos/chatBot_repo.dart';
// import 'package:amlak/features/App/companies/data/repos/developers_repo.dart';
// import 'package:amlak/features/App/filter/data/repos/filter_repo.dart';
// import 'package:amlak/features/App/home/data/repos/home_repo.dart';
// import 'package:amlak/features/App/maps/data/repos/maps_repo.dart';
// import 'package:amlak/features/App/property_details/data/repos/property_details_repo.dart';
// import 'package:amlak/features/App/user_profile/presentation/manager/language_cubit/language_cubit.dart';
// import 'package:amlak/features/App/user_profile/presentation/manager/theme_cubit/theme_cubit.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final getIt = GetIt.instance;

// Future<void> setupServiceLocator() async {
//   // getIt.registerLazySingleton<SocketIOHandler>(() => SocketIOHandler());
//   getIt.registerLazySingleton<FlutterSecureStorage>(
//     () => FlutterSecureStorage(),
//   );

//   getIt.registerLazySingleton<HiveHandler>(() => HiveHandler());

//   final token = await getIt<FlutterSecureStorage>().read(key: 'auth_token');
//   final baseUrl = ApiConstants.baseUrl;
  
//   // Get saved language or default to 'ar'
//   final sharedPreferences = await SharedPreferences.getInstance();
//   final savedLocale = sharedPreferences.getString(Keys.locale) ?? 'ar';
//   final langCode = savedLocale == 'en' ? 'en' : 'ar';

//   final Dio dio = Dio(
//     BaseOptions(
//       maxRedirects: 10000,

//       connectTimeout: Duration(seconds: 30),
//       baseUrl: baseUrl,
//       headers: {
//         'Accept': 'application/json',
//         'lang': langCode,
//         'Content-Type': 'application/json',
//         if (token != null)
//           'Authorization': "Bearer $token"
//         else
//           'Authorization':
//               "Bearer 28|d8WEXVVqwDlN8itPvgqVXEJqoBamhBUebMhEQJsO88fbbfab",
//       },
//     ),
//   );

//   dio.interceptors.add(
//     PrettyDioLogger(
//       responseBody: true,
//       error: true,
//       requestHeader: true,
//       request: true,
//       compact: true,
//       maxWidth: 90,
//       requestBody: true,
//       responseHeader: true,
//       logPrint: (object) {
//         print(object);
//       },
//     ),
//   );

//   getIt.registerLazySingleton<Dio>(() {
//     return dio;
//   });

//   // await getIt.allReady(); // Ensure that Dio is ready before proceeding

//   getIt.registerLazySingleton<ApiService>(() {
//     return ApiService(getIt<Dio>());
//   });

//   getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt<ApiService>()));
//   getIt.registerLazySingleton<FilterRepo>(
//     () => FilterRepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<AddPropertyRepo>(
//     () => AddPropertyRepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<PropertyDetailsRepo>(
//     () => PropertyDetailsRepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
//   getIt.registerLazySingleton<MapsRepo>(() => MapsRepo(getIt<ApiService>()));
//   getIt.registerLazySingleton<MyAdsRepo>(() => MyAdsRepo(getIt<ApiService>()));
//   getIt.registerLazySingleton<ChatBotRepo>(
//     () => ChatBotRepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<NotificationRepo>(
//     () => NotificationRepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<DevelopersRepo>(
//     () => DevelopersRepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<Packagesrepo>(
//     () => Packagesrepo(getIt<ApiService>()),
//   );
//   getIt.registerLazySingleton<RateRepo>(() => RateRepo(getIt<ApiService>()));

//   getIt.registerLazySingleton<SocialAuthService>(() => SocialAuthService());

//   getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

//   // Register SharedPrefsHelper with SharedPreferences dependency
//   getIt.registerLazySingleton<SharedPrefsHelper>(
//     () => SharedPrefsHelper(sharedPreferences: getIt<SharedPreferences>()),
//   );

//   // Register LanguageCubit
//   getIt.registerLazySingleton<LanguageCubit>(
//     () => LanguageCubit(getIt<SharedPrefsHelper>()),
//   );

//   // Register ThemeCubit
//   getIt.registerLazySingleton<ThemeCubit>(
//     () => ThemeCubit(getIt<SharedPrefsHelper>()),
//   );
// }

// // Function to update Dio language header
// Future<void> updateDioLanguage(String languageCode) async {
//   final dio = getIt<Dio>();
//   dio.options.headers['lang'] = languageCode;
// }

