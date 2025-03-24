import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/repository/repo_implementation.dart';
import '../../Widgets/news_widget_details.dart';
import '../../core/cubit/cubit.dart';
import '../../core/cubit/states.dart';

class TabsScreen extends StatelessWidget {
  final String categoryName;
  final Function onTap;

  const TabsScreen(
      {super.key, required this.categoryName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())..getSources(categoryName),
      child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
        if (state is GetSourceLoadingState) {
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
          // Navigator.pop(context);
        } else if (state is GetSourceErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Error',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              content: Text("Something went wrong",
                  style: Theme.of(context).textTheme.titleMedium),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    onTap();
                    // Navigator.pop(context);
                  },
                  child: Text("Go to home",
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
          );
        }
      }, builder: (context, state) {
        var bloc = BlocProvider.of<HomeCubit>(context);
        var sources = bloc.sourcesResponse?.sources ?? [];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: DefaultTabController(
            length: sources.length,
            initialIndex: bloc.selectedIndex,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  onTap: (value) {
                    // bloc.selectedIndex=value;
                    bloc.changSelectedTab(value);
                  },
                  tabs: sources
                      .map(
                        (source) => Tab(
                          text: source.name,
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Expanded(
                  child: NewsWidgetDetails(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
