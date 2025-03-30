import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/cubit/cubit.dart';
import 'package:news/core/cubit/states.dart';
import 'package:news/core/repository/repo_implementation.dart';
import 'package:news/screens/Search/search_item.dart';

class SearchItemWidget extends StatelessWidget {
  // final String searchText;
  // void onSearch;

 const SearchItemWidget(
      {super.key, /*required this.onSearch, required this.searchText*/});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())..getSearchData("messi"),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetSearchDataLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
              ),
            );
          } else if (state is GetSearchDataErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'Error',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                content: Text("Something went wrong",
                    style: Theme.of(context).textTheme.titleSmall),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // onTap();
                      Navigator.pop(context);
                    },
                    child: Text("OK",
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ],
              ),
            );
          }
          // else if (state is GetSearchDataSuccessState) {
          //   Navigator.pop(context);
          // }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<HomeCubit>(context);
          var news = bloc.newResponse?.articles ?? [];
          // onSearch = bloc.getSearchData(searchText);
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SearchItem(
                    article: news[index],
                    // onSearch: bloc.getSearchData(),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 16.h,
                    ),
                itemCount: news.length),
          );
        },
      ),
    );
  }
}
