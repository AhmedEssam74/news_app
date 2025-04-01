import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/cubit/cubit.dart';
import 'package:news/core/cubit/states.dart';
import 'package:news/core/repository/repo_implementation.dart';
import 'package:news/models/news_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/Search/search_item.dart';



class SearchScreen extends StatelessWidget {
  final Articles? article;
  final searchController = TextEditingController();

  SearchScreen({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl()),
      child: BlocConsumer<HomeCubit ,HomeStates >(
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
          else if (state is GetSearchDataSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context , state){
          var bloc = BlocProvider.of<HomeCubit>(context);
          var news = bloc.newResponse?.articles ?? [];
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
                              bloc.getSearchData(searchController.text);
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
                      Expanded(
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
                      )
                      // SearchItemWidget(
                      //   onSearch: _getSearchData(),
                      //   searchText: searchController.text,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

   _getSearchData() {}
}
