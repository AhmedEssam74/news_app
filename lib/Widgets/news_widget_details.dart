import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/cubit/cubit.dart';
import '../core/cubit/states.dart';
import 'news_item.dart';

class NewsWidgetDetails extends StatelessWidget {
  const NewsWidgetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetNewsDataLoadingState) {
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
        } else if (state is GetNewsDataErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Error',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              content: Text(state.errorMessage ?? "Something went wrong",
                  style: Theme.of(context).textTheme.titleSmall),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text("OK", style: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
          );
        } else if (state is GetNewsDataSuccessState) {
          Navigator.pop(context);
        }
        else if (state is GetNewsDataEmptyState) {
          Column(
            children: [
              Text(
                'No News Founded',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var bloc = BlocProvider.of<HomeCubit>(context);
        var news = bloc.newResponse?.articles ?? [];
        return /*news.isEmpty
            ? Center(
                child: Text(
                  "No News Founded",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            :*/ ListView.separated(
                itemBuilder: (context, index) {
                  return NewsItem(
                    article: news[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 16.h,
                    ),
                itemCount: news.length);
      },
    );
  }
}
