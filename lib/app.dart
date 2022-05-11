import 'package:carg/app_theme.dart';
import 'package:carg/services/auth/auth_service.dart';
import 'package:carg/views/screens/home_screen.dart';
import 'package:carg/views/screens/register/register_screen.dart';
import 'package:carg/views/screens/splash_screen.dart';
import 'package:carg/views/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider.value(value: AuthService())
      ],
      child: Consumer<AuthService>(
        builder: (context, auth, _) => MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr', 'FR'),
              Locale('en', 'US')
            ],
            routes: {
              UserScreen.routeName: (context) => const UserScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              HomeScreen.routeName: (context) => HomeScreen(
                  requestedIndex:
                      ModalRoute.of(context)!.settings.arguments as int? ?? 0)
            },
            title: 'Carg',
            theme: AppTheme.theme,
            home: FutureBuilder<bool>(
                future: auth.isAlreadyLogin(),
                builder: (context, authResult) {
                  if (authResult.connectionState == ConnectionState.waiting) {
                    return const SplashScreen();
                  }
                  if (authResult.connectionState == ConnectionState.done) {
                    if (authResult.data == null || !authResult.data!) {
                      // User is not logged
                      return const RegisterScreen();
                    } else if (authResult.data != null && authResult.data!) {
                      // User is already logged
                      return Provider.of<AuthService>(context, listen: false)
                          .getCorrectLandingScreen();
                    }
                  }
                  return Container();
                })),
      ),
    );
  }
}
