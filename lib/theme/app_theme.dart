import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    //White color
    required this.white,
    required this.whiteWithOpacity50,
    required this.whiteTransparent,

    //Text color
    required this.text500,
    required this.text400,
    required this.text300,
    required this.text200,
    required this.text100,

    //Primary color
    required this.primary700,
    required this.primary500,
    required this.primary300,
    required this.primary100,

    //Secondary color
    required this.secondary700,
    required this.secondary500,
    required this.secondary300,
    required this.secondary100,
  });

  const MyColors.dark({
    this.white = Colors.white,
    this.whiteWithOpacity50 = Colors.white54,
    this.whiteTransparent = Colors.transparent,
    this.text500 = const Color(0xff1D232E),
    this.text400 = const Color(0xff5D6470),
    this.text300 = const Color(0xffA7B0C0),
    this.text200 = const Color(0xffE7ECF3),
    this.text100 = const Color(0xffF8FAFD),
    this.primary700 = const Color(0xff0B6BCC),
    this.primary500 = const Color(0xff007FFF),
    this.primary300 = const Color(0xff4FA6FF),
    this.primary100 = const Color(0xffDBEDFF),
    this.secondary700 = const Color(0xffDA6CEC),
    this.secondary500 = const Color(0xffF19BFF),
    this.secondary300 = const Color(0xffF5B5FF),
    this.secondary100 = const Color(0xffFADCFF),
  });
  const MyColors.light({
    this.white = Colors.white,
    this.whiteWithOpacity50 = Colors.white54,
    this.whiteTransparent = Colors.transparent,
    this.text500 = const Color(0xff1D232E),
    this.text400 = const Color(0xff5D6470),
    this.text300 = const Color(0xffA7B0C0),
    this.text200 = const Color(0xffE7ECF3),
    this.text100 = const Color(0xffF8FAFD),
    this.primary700 = const Color(0xff0B6BCC),
    this.primary500 = const Color(0xff007FFF),
    this.primary300 = const Color(0xff4FA6FF),
    this.primary100 = const Color(0xffDBEDFF),
    this.secondary700 = const Color(0xffDA6CEC),
    this.secondary500 = const Color(0xffF19BFF),
    this.secondary300 = const Color(0xffF5B5FF),
    this.secondary100 = const Color(0xffFADCFF),
  });

  //App colors , Звертайте увагу

  //White color
  final Color white;
  final Color whiteWithOpacity50;
  final Color whiteTransparent;

  //Text color
  final Color text500;
  final Color text400;
  final Color text300;
  final Color text200;
  final Color text100;

  //Primary color
  final Color primary700;
  final Color primary500;
  final Color primary300;
  final Color primary100;

  //Secondary color
  final Color secondary700;
  final Color secondary500;
  final Color secondary300;
  final Color secondary100;

  @override
  MyColors copyWith({
    Color? white,
    Color? whiteWithOpacity50,
    Color? whiteTransparent,

    //Text Color?
    Color? text500,
    Color? text400,
    Color? text300,
    Color? text200,
    Color? text100,

    //Primary Color?
    Color? primary700,
    Color? primary500,
    Color? primary300,
    Color? primary100,

    //Secondary Color?
    Color? secondary700,
    Color? secondary500,
    Color? secondary300,
    Color? secondary100,
  }) {
    return MyColors(
      white: white ?? this.white,
      whiteWithOpacity50: whiteWithOpacity50 ?? this.whiteWithOpacity50,
      whiteTransparent: white ?? this.whiteTransparent,
      text500: text500 ?? this.text500,
      text400: text400 ?? this.text400,
      text300: text300 ?? this.text300,
      text200: text200 ?? this.text200,
      text100: text100 ?? this.text100,
      primary700: primary700 ?? this.primary700,
      primary500: primary500 ?? this.primary500,
      primary300: primary300 ?? this.primary300,
      primary100: primary100 ?? this.primary100,
      secondary700: secondary700 ?? this.secondary700,
      secondary500: secondary500 ?? this.secondary500,
      secondary300: secondary300 ?? this.secondary300,
      secondary100: secondary100 ?? this.secondary100,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      white: Color.lerp(white, other.white, t) ?? Colors.black,
      whiteWithOpacity50:
          Color.lerp(whiteWithOpacity50, other.whiteWithOpacity50, t) ??
              Colors.white,
      whiteTransparent:
          Color.lerp(white, other.whiteTransparent, t) ?? Colors.black,
      text500: Color.lerp(text500, other.text500, t) ?? Colors.black,
      text400: Color.lerp(text400, other.text400, t) ?? Colors.black,
      text300: Color.lerp(text300, other.text300, t) ?? Colors.black,
      text200: Color.lerp(text200, other.text200, t) ?? Colors.black,
      text100: Color.lerp(text100, other.text100, t) ?? Colors.black,
      primary700: Color.lerp(primary700, other.primary700, t) ?? Colors.black,
      primary500: Color.lerp(primary500, other.primary500, t) ?? Colors.black,
      primary300: Color.lerp(primary300, other.primary300, t) ?? Colors.black,
      primary100: Color.lerp(primary100, other.primary100, t) ?? Colors.black,
      secondary700:
          Color.lerp(secondary700, other.secondary700, t) ?? Colors.black,
      secondary500:
          Color.lerp(secondary500, other.secondary500, t) ?? Colors.black,
      secondary300:
          Color.lerp(secondary300, other.secondary300, t) ?? Colors.black,
      secondary100:
          Color.lerp(secondary100, other.secondary100, t) ?? Colors.black,
    );
  }

  // Optional
  @override
  String toString() => 'MyColors()';
}

@immutable
class MyTextStyles extends ThemeExtension<MyTextStyles> {
  const MyTextStyles({
    required this.displayLarge,
    required this.displayMedium,
    required this.headingLarge,
    required this.headingMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelMedium,
    required this.labelSmall,
  });

  final TextStyle? displayLarge;
  final TextStyle? displayMedium;
  final TextStyle? headingLarge;
  final TextStyle? headingMedium;
  final TextStyle? bodyLarge;
  final TextStyle? bodyMedium;
  final TextStyle? bodySmall;
  final TextStyle? labelMedium;
  final TextStyle? labelSmall;

  @override
  MyTextStyles copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) {
    return MyTextStyles(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      headingLarge: headingLarge ?? this.headingLarge,
      headingMedium: headingMedium ?? this.headingMedium,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  MyTextStyles lerp(ThemeExtension<MyTextStyles>? other, double t) {
    if (other is! MyTextStyles) {
      return this;
    }
    return MyTextStyles(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t),
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t),
      headingLarge: TextStyle.lerp(headingLarge, other.headingLarge, t),
      headingMedium: TextStyle.lerp(headingMedium, other.headingMedium, t),
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t),
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t),
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t),
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t),
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyTextStyles()';
  const MyTextStyles.defaultTextStyles({
    this.displayLarge = const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      height: 1.2,
      letterSpacing: -1.5,
      fontFamily: 'Inter',
    ),
    this.displayMedium = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 0.8,
      letterSpacing: -1.5,
      fontFamily: 'Inter',
    ),
    this.headingLarge = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 0.66,
      letterSpacing: -1.5,
      fontFamily: 'Inter',
    ),
    this.headingMedium = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 0.7,
      letterSpacing: -1,
      fontFamily: 'Inter',
    ),
    this.bodyLarge = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 0.64,
      letterSpacing: -0.25,
      fontFamily: 'Inter',
    ),
    this.bodyMedium = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 0.66,
      letterSpacing: -0.25,
      fontFamily: 'Inter',
    ),
    this.bodySmall = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 0.7,
      letterSpacing: 0,
      fontFamily: 'Inter',
    ),
    this.labelMedium = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      fontFamily: 'Inter',
    ),
    this.labelSmall = const TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      fontFamily: 'Inter',
    ),
  });

// 'Roboto'
//  const MyTextStyles.getDefaultTextStyles => MyTextStyles(
//         displayLarge: TextStyle(
//           fontSize: 40,
//           fontWeight: FontWeight.w500,
//           height: 48,
//           letterSpacing: -1.5,
//           fontFamily: 'Inter',
//         ),
//         displayMedium: TextStyle(
//           fontSize: 32,
//           fontWeight: FontWeight.w500,
//           height: 40,
//           letterSpacing: -1.5,
//           fontFamily: 'Inter',
//         ),
//         headingLarge: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.w500,
//           height: 36,
//           letterSpacing: -1.5,
//           fontFamily: 'Inter',
//         ),
//         headingMedium: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w500,
//           height: 28,
//           letterSpacing: -1,
//           fontFamily: 'Inter',
//         ),
//         bodyLarge: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w400,
//           height: 28,
//           letterSpacing: -0.25,
//           fontFamily: 'Inter',
//         ),
//         bodyMedium: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           height: 24,
//           letterSpacing: -0.25,
//           fontFamily: 'Inter',
//         ),
//         bodySmall: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//           height: 20,
//           letterSpacing: 0,
//           fontFamily: 'Inter',
//         ),
//         labelMedium: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0,
//           fontFamily: 'Inter',
//         ),
//         labelSmall: TextStyle(
//           fontSize: 8,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0,
//           fontFamily: 'Inter',
//         ),
//       );
}

class AppTheme {
  final _darkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const MyColors.dark(),
      const MyTextStyles.defaultTextStyles(),
    ],
  );

  final _lightTheme = ThemeData.light().copyWith(
    extensions: [
      const MyColors.light(),
      const MyTextStyles.defaultTextStyles(),
    ],
  );

  final appThemeStream = BehaviorSubject<ThemeData>(sync: true);

  //Add screen whe user can switch theme and watch on the value
  ThemeData getTheme() => appThemeStream.value;

  AppTheme() {
    //add initial value
    appThemeStream.add(_lightTheme);

    final prefs = SharedPreferences.getInstance();

    prefs.then((storage) {
      final value = storage.get('themeMode');

      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        appThemeStream.add(_lightTheme);
      } else {
        appThemeStream.add(_darkTheme);
      }
    });
  }

  void setDarkMode() async {
    appThemeStream.add(_darkTheme);
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('themeMode', 'dark');
  }

  void setLightMode() async {
    appThemeStream.add(_lightTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', 'light');
  }
}
