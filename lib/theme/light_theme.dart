import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/theme/base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  // TODO: implement primaryColor
  Color get primaryColor => const Color(0xff171717);

  @override
  // TODO: implement secondaryColor
  Color get secondaryColor => const Color(0xffFFFFFF);

  @override
  ThemeData get themeData => ThemeData(
        primaryColorLight: primaryColor,
        cardColor: secondaryColor,
        canvasColor:const Color(0x80ffffff),
        scaffoldBackgroundColor: secondaryColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: secondaryColor,
          titleTextStyle: GoogleFonts.aBeeZee(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        drawerTheme: DrawerThemeData(
          width: 269.w,
        ),
        tabBarTheme: TabBarTheme(
          dividerColor: Colors.transparent,
          labelStyle: GoogleFonts.aBeeZee(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          indicatorColor: primaryColor,
        ),
        textTheme: TextTheme(
          titleSmall: GoogleFonts.aBeeZee(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          titleMedium: GoogleFonts.aBeeZee(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          titleLarge: GoogleFonts.aBeeZee(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          bodySmall: GoogleFonts.aBeeZee(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xffA0A0A0),
          ),
          bodyMedium: GoogleFonts.aBeeZee(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
          bodyLarge: GoogleFonts.aBeeZee(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
        ),
      );
}
