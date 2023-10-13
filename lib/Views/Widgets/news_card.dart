import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/Model/news_data_model.dart';

class NewsCard extends StatelessWidget {
  final Result news;

  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: CachedNetworkImage(
              imageUrl: news.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.title!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            '${news.title!}',
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
