import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/routes/page_name_route.dart';
import 'package:news/screens/home/home_screen.dart';

class AppDrawer extends StatelessWidget {
  final Function getBackHome;

  const AppDrawer({super.key, required this.getBackHome});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
      child: Column(
        children: [
          Container(
            height: 166.h,
            width: double.infinity,
            color: Theme.of(context).textTheme.bodyMedium?.color,
            child: Center(
              child: Text(
                "News App",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              getBackHome;
            },
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      SizedBox(width: 8.0.w),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PageRouteName.homeScreen);
                        },
                        child: Text(
                          'Go To Home',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Divider(
                    height: 2.h,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.format_paint,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      SizedBox(width: 8.0.w),
                      Text(
                        'Theme',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Divider(
                    height: 2.h,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      SizedBox(width: 8.0.w),
                      Text(
                        'Language',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
