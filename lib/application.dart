import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:provider/provider.dart';

import 'package:cross_platform_project/infrastructure/theme/dark_theme.dart';
import 'package:cross_platform_project/ui_screen.dart';
import 'package:cross_platform_project/utils/localization_extensions.dart';

import 'infrastructure/theme/light_theme.dart';

class Application extends StatefulWidget {
  Application({
    Key? key,
  }) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MaterialApp(
      title: 'Valorant Tournaments',
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      themeMode: _themeMode,
      theme: getLightTheme(context),
      darkTheme: getDarkTheme(context),
      onGenerateRoute: _onGenerateRoute,
      onGenerateTitle: (context) => context.localizations!.valorantTournaments,
      debugShowCheckedModeBanner: false,
    );

    assert((() {
      child = Directionality(
        textDirection: TextDirection.ltr,
        child: Banner(
          message: 'DEBUG',
          textDirection: TextDirection.ltr,
          location: BannerLocation.bottomStart,
          child: child,
        ),
      );
      return true;
    })());

    return MultiProvider(
      providers: [
        Provider.value(value: this),
        Provider.value(value: _themeMode),
      ],
      child: child,
    );
  }

  Route _onGenerateRoute(settings) {
    return UIScreen.getRoute();
  }
}
