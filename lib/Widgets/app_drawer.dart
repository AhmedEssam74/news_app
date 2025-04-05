import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/provider/theme_provider.dart';
import 'package:news/core/routes/page_name_route.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final Function? getBackHome;

  const AppDrawer({super.key, this.getBackHome});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
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
                  //home row
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      SizedBox(width: 8.0.w),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageRouteName.homeScreen);
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
                  Row(
                    children: [
                      Icon(
                        Icons.format_paint,
                        color: Theme.of(context).cardColor,
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        child: DropdownMenu(
                          controller: TextEditingController(
                              text: provider.themeMode == ThemeMode.light
                                  ? "Light"
                                  : "Dark"),
                          width: 180.w,
                          trailingIcon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Theme.of(context).cardColor,
                            size: 50,
                          ),
                          selectedTrailingIcon: Icon(
                            Icons.arrow_drop_up_rounded,
                            color: Theme.of(context).cardColor,
                            size: 50,
                          ),
                          enableSearch: false,
                          onSelected: (ThemeMode? value) {
                            if (value != null) {
                              provider.changeTheme();
                              Navigator.pop(context);
                            }
                          },
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(
                              label: "Light",
                              value: ThemeMode.light,
                            ),
                            DropdownMenuEntry(
                              label: "Dark",
                              value: ThemeMode.dark,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Divider(
                  //   height: 2.h,
                  //   color: Theme.of(context).textTheme.bodyMedium?.color,
                  // ),
                  // SizedBox(
                  //   height: 24.h,
                  // ),
                  // // language row
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.language,
                  //       color: Theme.of(context).textTheme.bodyMedium?.color,
                  //     ),
                  //     SizedBox(width: 8.0.w),
                  //     Text(
                  //       'Language',
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 24.h,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
