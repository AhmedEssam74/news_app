import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/source_response_model.dart';

import '../../Widgets/news_widget_details.dart';
import '../../api_maneger/api_maneger.dart';

class NewsScreen extends StatefulWidget {
  String categoryName;

  NewsScreen({super.key, required this.categoryName});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(widget.categoryName),
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
              'Something went wrong ...',
              style: Theme.of(context).textTheme.titleLarge,
            );
          }
          var data = snapshot.data?.sources ?? [];
          return DefaultTabController(
            length: data.length,
            initialIndex: selectedIndex,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  onTap: (value) {
                    selectedIndex = value;
                    setState(() {});
                  },
                  tabs: data
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
                Expanded(
                  child:
                      NewsWidgetDetails(sourceId: data[selectedIndex].id ?? ""),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
