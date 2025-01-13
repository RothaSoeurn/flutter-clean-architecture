import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_app/core/helper/helper.dart';
import 'package:flutter_clean_architecture_app/core/injector.dart';
import 'package:flutter_clean_architecture_app/core/router/router.dart';
import 'package:flutter_clean_architecture_app/core/theme/theme.dart';
import 'package:flutter_clean_architecture_app/core/translations/app_localizations_delegate.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/key.dart';
import 'package:flutter_clean_architecture_app/global/cart/cart_cubit.dart';
import 'package:flutter_clean_architecture_app/global/setting/setting_cubit.dart';
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
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        showMessage(
          messageType: MessageType.success,
          message: 'Connected to the internet',
        );
      } else {
        showMessage(
          messageType: MessageType.warning,
          message: 'No internet connection',
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
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        scaffoldMessengerKey: scaffoldMessengerKey,
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
        themeMode: ThemeMode.system,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
      ),
    );
  }
}
