import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:module_complete/routes/app_route_navigator.dart';
import 'package:module_complete/screens/home/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //color set to transperent or set your own color
    statusBarIconBrightness: Brightness.dark,
    //set brightness for icons, like dark background light icons
  ));
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // runZonedGuarded(
  //   () {
  //     runApp(const MyApp());
  //   },
  //   (error, stack) => FirebaseCrashlytics.instance.recordError(
  //     error,
  //     stack,
  //     fatal: true,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // RemoteConfigService? _remoteConfigService;
  // initializeRemoteConfig() async {
  //   _remoteConfigService = await RemoteConfigService.getInstance();
  //   await _remoteConfigService!.initialize();
  // }

  @override
  void initState() {
    // initializeRemoteConfig();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "VMS", 
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
          home: const SplashScreen(),
          initialRoute: "/",
          onGenerateRoute: NavigationRoutes.generateRoute,
        );
      },
      // child: const HomePage(title: 'First Method'),
    );
  }
}
