import 'dart:convert';

class NewsModel {
  final int? count;
  final List<Datum>? data;

  NewsModel({
    this.count,
    this.data,
  });

  NewsModel copyWith({
    int? count,
    List<Datum>? data,
  }) =>
      NewsModel(
        count: count ?? this.count,
        data: data ?? this.data,
      );

  factory NewsModel.fromRawJson(String str) =>
      NewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final Img? img;
  final Type? type;
  final String? id;
  final String? title;
  final String? subtitle;
  final String? content;
  final int? readCount;
  final DateTime? createdAt;
  final int? v;

  Datum({
    this.img,
    this.type,
    this.id,
    this.title,
    this.subtitle,
    this.content,
    this.readCount,
    this.createdAt,
    this.v,
  });

  Datum copyWith({
    Img? img,
    Type? type,
    String? id,
    String? title,
    String? subtitle,
    String? content,
    int? readCount,
    DateTime? createdAt,
    int? v,
  }) =>
      Datum(
        img: img ?? this.img,
        type: type ?? this.type,
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        content: content ?? this.content,
        readCount: readCount ?? this.readCount,
        createdAt: createdAt ?? this.createdAt,
        v: v ?? this.v,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        img: json["img"] == null ? null : Img.fromJson(json["img"]),
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        id: json["_id"],
        title: json["title"],
        subtitle: json["subtitle"],
        content: json["content"],
        readCount: json["read_count"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "img": img?.toJson(),
        "type": type?.toJson(),
        "_id": id,
        "title": title,
        "subtitle": subtitle,
        "content": content,
        "read_count": readCount,
        "created_at": createdAt?.toIso8601String(),
        "__v": v,
      };
}

class Img {
  final String? url;
  final String? caption;

  Img({
    this.url,
    this.caption,
  });

  Img copyWith({
    String? url,
    String? caption,
  }) =>
      Img(
        url: url ?? this.url,
        caption: caption ?? this.caption,
      );

  factory Img.fromRawJson(String str) => Img.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        url: json["url"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "caption": caption,
      };
}

class Type {
  final String? name;
  final String? id;

  Type({
    this.name,
    this.id,
  });

  Type copyWith({
    String? name,
    String? id,
  }) =>
      Type(
        name: name ?? this.name,
        id: id ?? this.id,
      );

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
