import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:my_first_cry/Utils/first_cry_prefs.dart';
import 'package:my_first_cry/Views/home/home_view.dart';
import 'package:my_first_cry/Views/login_view.dart';
import 'package:my_first_cry/Views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await myFirstPref.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const riverpod.ProviderScope(
        child: MyApp(),
      ),
    );
  });
}

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const Home(),
          '/login': (BuildContext context) => const LoginView(),
          '/register': (BuildContext context) => const RegisterView(),
        },
        title: 'Flutter Demo',
        home: myFirstPref.containsKey("email")
            ? const Home()
            : const LoginView());
  }
}
