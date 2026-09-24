import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = FlexThemeData.light(
  fontFamily: 'Nunito',

  colors: const FlexSchemeColor(
    primary: Color(0xFF5438D5),
    primaryContainer: Color(0xFFEEEAFE),

    secondary: Color(0xFFFF754D),
    secondaryContainer: Color(0xFFFFF0E8),

    tertiary: Color(0xFFFFB93F),
    tertiaryContainer: Color(0xFFFFF3D6),
  ),

  scaffoldBackground: const Color(0xFFFFFBF7),

  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,

  blendLevel: 4,

  subThemesData: const FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    useM2StyleDividerInM3: true,

    // Buttons
    elevatedButtonRadius: 18,
    filledButtonRadius: 18,
    outlinedButtonRadius: 18,

    // Inputs
    inputDecoratorRadius: 16,

    // Cards
    cardRadius: 20,

    // Dialogs
    dialogRadius: 28,

    // Bottom sheets
    bottomSheetRadius: 28,

    // Chips
    chipRadius: 100,
  ),

  useMaterial3: true,
);
