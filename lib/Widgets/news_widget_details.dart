import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/news_response_model.dart';
import '../api_maneger/api_maneger.dart';
import 'news_item.dart';

class NewsWidgetDetails extends StatelessWidget {
  final String sourceId;

  const NewsWidgetDetails({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.titleLarge,
          );
        }
        if (snapshot.data!.articles!.isEmpty) {
          return Center(
            child: Text(
              "No News Founded",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(
                article: snapshot.data!.articles![index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
            itemCount: snapshot.data?.articles?.length ?? 0);
      },
    );
  }
}
