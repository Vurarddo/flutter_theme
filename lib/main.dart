import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

import 'package:cross_platform_project/utils/device-info.dart';
import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (DeviceInfo.isDesktop) {
    await DesktopWindow.setWindowSize(Size(1280, 720));
    await DesktopWindow.setMinWindowSize(Size(1280, 720));
  }

  // final getIt = GetIt.instance;

  // await configureDependencies(getIt);

  runApp(Application());
}
