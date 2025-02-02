import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/news_response_model.dart';

class NewsItem extends StatelessWidget {
  final Articles article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).primaryColorLight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            article.title ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By : ${article.author?.split(' ')[0]}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                article.publishedAt?.substring(0, 10) ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
