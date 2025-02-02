import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final int indexCategory;
  // final Function onTap;

  const CategoryItem(
      {super.key,
      required this.category,
      required this.indexCategory,
      // required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:
          indexCategory.isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            "assets/images/$category.png",
            fit: BoxFit.fill,
          ),
        ),
        GestureDetector(
          // onTap: onTap(),
          child: Container(
            margin: indexCategory.isEven
                ? EdgeInsets.only(right: 16.r, bottom: 16.r)
                : EdgeInsets.only(left: 16.r, bottom: 16.r),
            width: 186.w,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(84.r)),
            child: indexCategory.isEven
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View All",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).cardColor,
                          radius: 30.r,
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).cardColor,
                          radius: 30.r,
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          "View All",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
