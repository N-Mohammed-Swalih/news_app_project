import 'dart:convert';

List<NewsDataModel> newsDataModelFromJson(String str) =>
    List<NewsDataModel>.from(json.decode(str));

String newsDataModelToJson(NewsDataModel data) => json.encode(data.toJson());

class NewsDataModel {
  final String? status;
  final int? totalResults;
  final List<Result>? results;
  final String? nextPage;

  NewsDataModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  final String? articleId;
  final String? title;
  final String? link;
  final List<String>? keywords;
  final List<String>? creator;
  final dynamic videoUrl;
  final String? description;
  final String? content;
  final DateTime? pubDate;
  final dynamic imageUrl;
  final String? sourceId;
  final int? sourcePriority;
  final List<Country>? country;
  final List<String>? category;
  final Language? language;

  Result({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.country,
    this.category,
    this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        pubDate:
            json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        sourcePriority: json["source_priority"],
        country: json["country"] == null
            ? []
            : List<Country>.from(
                json["country"]!.map((x) => countryValues.map[x]!)),
        category: json["category"] == null
            ? []
            : List<String>.from(json["category"]!.map((x) => x)),
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "link": link,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate?.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_priority": sourcePriority,
        "country": country == null
            ? []
            : List<dynamic>.from(country!.map((x) => countryValues.reverse[x])),
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "language": languageValues.reverse[language],
      };
}

enum Country { INDIA }

final countryValues = EnumValues({"india": Country.INDIA});

enum Language { ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
