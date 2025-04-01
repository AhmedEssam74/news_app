import 'package:flutter/material.dart';
import 'package:news/models/news_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/Search/search_item_widget.dart';

class SearchScreen extends StatelessWidget {
  final Articles? article;
  final searchController = TextEditingController();

  SearchScreen({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(decorationThickness: 0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.r),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _getSearchData();
                      },
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    hintText: "Search",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: const Color(0xff6a6666)),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SearchItemWidget(
                  // onSearch: _getSearchData(),
                  // searchText: searchController.text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

   _getSearchData() {}
}
