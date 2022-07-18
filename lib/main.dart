import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/address_provider.dart';
import 'package:fuseapp/providers/feedback_provider.dart';
import 'package:fuseapp/providers/ordersprovider.dart';
import 'package:fuseapp/providers/survey_provider.dart';
import 'package:fuseapp/providers/home_provider.dart';
import 'package:fuseapp/providers/toggle_text.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/routers/undefined_view_router.dart';
import 'package:fuseapp/services/auth_services.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';
import 'package:fuseapp/routers/router.dart' as router;
import 'firebase_options.dart';
import 'providers/personal_info.dart';
import 'package:fuseapp/services/local_notifications.dart';
//COMMENTS TODO: 1. when to use pushreplacement instead of put (DONE)|| 2. docmentation
//COMMENTS TODO: Asmaa todo3 tasks done, some issues need to be solved (DONE)
//COMMENTS TODO: Rawabi didn't see the bottom nav bar, some issues need to be solved
//COMMENTS TODO: Haneen point one is not there "Redirect to homepage, signout, save signup info to db, token
//COMMENTS TODO: Fiazah issue in google sign in and redirect,forget password function, otp" Will postpone this"
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LocalNotificationService.initilize();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: const FuseApp(),
    ),
  );
}

class FuseApp extends StatelessWidget {
  const FuseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ToggleText()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => PersonalInfo()),
        ChangeNotifierProvider(create: (_) => SurveyInfo()),
        ChangeNotifierProvider(create: (_) => FeedBackProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider())
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        initialRoute: HomeViewRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedView(
            name: settings.name,
          ),
        ),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
