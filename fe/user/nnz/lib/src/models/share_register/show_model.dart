// To parse this JSON data, do
//
//     final showModel = showModelFromJson(jsonString);

import 'dart:convert';

ShowModel showModelFromJson(String str) => ShowModel.fromJson(json.decode(str));

String showModelToJson(ShowModel data) => json.encode(data.toJson());

class ShowModel {
  bool? isFirst;
  bool? isLast;
  bool? empty;
  String? totalElement;
  String? totalPage;
  List<Content>? content;

  ShowModel({
    this.isFirst,
    this.isLast,
    this.empty,
    this.totalElement,
    this.totalPage,
    this.content,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) => ShowModel(
        isFirst: json["isFirst"],
        isLast: json["isLast"],
        empty: json["empty"],
        totalElement: json["totalElement"],
        totalPage: json["totalPage"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isFirst": isFirst,
        "isLast": isLast,
        "empty": empty,
        "totalElement": totalElement,
        "totalPage": totalPage,
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    // TODO: implement toString
    return "ShowModel : (isFirst : $isFirst, isLast : $isLast, empty : $empty, totalElement : $totalElement, totalPage : $totalPage, content : $content)";
  }
}

class Content {
  String? id;
  String? title;
  String? startDate;
  String? endDate;
  String? location;
  String? poster;
  List<Tag>? tags;

  Content({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.location,
    this.poster,
    this.tags,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        location: json["location"],
        poster: json["poster"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "location": location,
        "poster": poster,
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    // TODO: implement toString
    return "Content : (id : $id, title : $title, startDate : $startDate, endDate : $endDate, location : $location, poster : $poster, tags : $tags)";
  }
}

class Tag {
  String? id;
  String? tag;

  Tag({
    this.id,
    this.tag,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
      };
  @override
  String toString() {
    return "Tag : (id :$id, tag : $tag)";
  }
}
