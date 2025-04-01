import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/theme/base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get primaryColor => const Color(0xff171717);

  @override
  Color get secondaryColor => const Color(0xffFFFFFF);

  @override
  // TODO: implement backGroundColor
  Color get backGroundColor => const Color(0xff636262);

  @override
  ThemeData get themeData => ThemeData(
        primaryColorLight: primaryColor,
        cardColor: secondaryColor,
        canvasColor: const Color(0x80ffffff),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
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
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: secondaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
          ),
          menuStyle: MenuStyle(
            elevation: const WidgetStatePropertyAll(2),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.only(
                left: 16,
                right: 16,
              ),
            ),
            surfaceTintColor: WidgetStatePropertyAll(primaryColor),
            backgroundColor: WidgetStatePropertyAll(primaryColor),
          ),
          textStyle: GoogleFonts.aBeeZee(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              GoogleFonts.aBeeZee(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: secondaryColor,
              ),
            ),
            foregroundColor: WidgetStatePropertyAll(secondaryColor),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.aBeeZee(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
          filled: true,
          fillColor: secondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: secondaryColor,
              width: 2.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: secondaryColor,
              width: 2.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: secondaryColor,
              width: 2.w,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
        ),
      );
}
