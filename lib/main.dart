import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_app/core/helper/helper.dart';
import 'package:flutter_clean_architecture_app/core/injector.dart';
import 'package:flutter_clean_architecture_app/core/translations/app_localizations_delegate.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/key.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  StreamSubscription<List<ConnectivityResult>>? subscription;
  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        showMessage(
          messageType: MessageType.warning,
          message: 'No internet connection',
        );
      } else {
        showMessage(
          messageType: MessageType.success,
          message: 'Connected to the internet',
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => AppStatusBloc()),
        // BlocProvider(create: (context) => AuthBloc(authRepository: get<AuthRepository>())),
        // BlocProvider(create: (context) => UserProfileBloc(userProfileRepository: get<UserProfileRepository>())),
      ],
      child: MaterialApp(
        supportedLocales: [
          Locale('en', 'EN'),
          Locale('km', 'KH'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale('en', 'EN'),
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}
