import 'package:cross_platform_project/infrastructure/theme/vt_colors.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final _colorScheme = ColorScheme(
  primary: VTColors.vtPink,
  primaryVariant: VTColors.vtPink,
  secondary: VTColors.vtPink,
  secondaryVariant: VTColors.vtPink,
  surface: VTColors.vtBlackColor,
  background: VTColors.vtBlackColor,
  error: VTColors.vtDarkPink,
  onPrimary: VTColors.vtBlackColor,
  onSecondary: VTColors.vtBlackColor,
  onSurface: VTColors.vtSilverColor,
  onBackground: VTColors.vtSilverColor,
  onError: VTColors.vtSilverColor,
  brightness: Brightness.dark,
);

Color _getCheckboxCheckedColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return VTColors.vtBlackColor;
  }
  return VTColors.vtBlackColor;
}

Color _getCheckboxFillColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return VTColors.vtPink;
  }
  return VTColors.vtDarkenedSilverColor;
}

Color _getSwitchTrackColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return VTColors.vtSilverColor;
  } else if (states.contains(MaterialState.selected)) {
    return VTColors.vtLightPink;
  }

  return VTColors.vtDarkSilverColor;
}

Color _getSwitchThumbColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return VTColors.vtDarkenedSilverColor;
  } else if (states.contains(MaterialState.selected)) {
    return VTColors.vtPink;
  }

  return VTColors.vtSilverColor;
}

Color _getRadioFillColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return VTColors.vtPink;
  }
  return VTColors.vtDarkenedSilverColor;
}

BorderSide _getOutlinedColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return BorderSide(color: VTColors.vtPink);
  }
  return BorderSide(color: VTColors.vtDarkenedSilverColor);
}

ThemeData getDarkTheme(BuildContext context) {
  final textTheme = Typography.material2018(platform: defaultTargetPlatform).white;

  final buttonScaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
    const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );

  final textButtonScaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );

  return ThemeData.from(
    colorScheme: _colorScheme,
    textTheme: textTheme.apply(fontFamily: 'FF Mark'),
  ).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: VTColors.vtPink,
        padding: textButtonScaledPadding,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: VTColors.vtPink,
        onPrimary: VTColors.vtLightSilverColor,
        padding: buttonScaledPadding,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: VTColors.vtPink,
        padding: buttonScaledPadding,
      ).copyWith(
        side: MaterialStateProperty.resolveWith(_getOutlinedColor),
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: VTColors.vtBlackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: VTColors.vtBlackColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((_getCheckboxFillColor)),
      checkColor: MaterialStateProperty.resolveWith(_getCheckboxCheckedColor),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColor),
      thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColor),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(_getRadioFillColor),
    ),
  );
}
