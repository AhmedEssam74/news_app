import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/home/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final Function onClickedCategory;

  CategoriesScreen({super.key, required this.onClickedCategory});

  List<String> categories = [
    "general",
    "business",
    "sports",
    "technology",
    "science",
    "health",
    "entertainment",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onClickedCategory(categories[index]);
                      },
                      child: CategoryItem(
                        // onTap: onClickedCategory(categories[index]),
                        category: categories[index],
                        indexCategory: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 16.h,
                      ),
                  itemCount: categories.length),
            ),
          ],
        ),
      ),
    );
  }
}
