import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CatModel {
  @JsonKey(name: "status")
  Status? status;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "user")
  String? user;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "source")
  String? source;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "deleted")
  bool? deleted;
  @JsonKey(name: "used")
  bool? used;

  CatModel({
    this.status,
    this.id,
    this.user,
    this.text,
    this.v,
    this.source,
    this.updatedAt,
    this.type,
    this.createdAt,
    this.deleted,
    this.used,
  });

  Map<String, dynamic> toMap(CatModel catModel) {
    Map<String, dynamic> catModelMap = Map();
    catModelMap["status"] = catModel.status;
    catModelMap["id"] = catModel.id;
    catModelMap["user"] = catModel.user;
    catModelMap["text"] = catModel.text;
    catModelMap["v"] = catModel.v;
    catModelMap["source"] = catModel.source;
    catModelMap["updatedAt"] = catModel.updatedAt;
    catModelMap["type"] = catModel.type;
    catModelMap["createdAt"] = catModel.createdAt;
    catModelMap["deleted"] = catModel.deleted;
    catModelMap["used"] = catModel.used;
    return catModelMap;
  }

  factory CatModel.fromMap(Map<String, dynamic> json) => CatModel(
        status: json['status'] == null ? null : null,
        id: json['_id'] as String?,
        user: json['user'] as String?,
        text: json['text'] as String?,
        v: json['__v'] as int?,
        source: json['source'] as String?,
        updatedAt: json['updatedAt'] as String,
        type: json['type'] as String?,
        createdAt: json['createdAt'] as String,
        deleted: json['deleted'] as bool?,
        used: json['used'] as bool?,
      );

  CatModel copyWith({
    Status? status,
    String? id,
    String? user,
    String? text,
    int? v,
    String? source,
    String? updatedAt,
    String? type,
    String? createdAt,
    bool? deleted,
    bool? used,
  }) =>
      CatModel(
        status: status ?? this.status,
        id: id ?? this.id,
        user: user ?? this.user,
        text: text ?? this.text,
        v: v ?? this.v,
        source: source ?? this.source,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        deleted: deleted ?? this.deleted,
        used: used ?? this.used,
      );

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "verified")
  bool? verified;
  @JsonKey(name: "sentCount")
  int? sentCount;

  Status({
    this.verified,
    this.sentCount,
  });

  Status copyWith({
    bool? verified,
    int? sentCount,
  }) =>
      Status(
        verified: verified ?? this.verified,
        sentCount: sentCount ?? this.sentCount,
      );
  factory Status.fromMap(Map<String, dynamic> json) => Status(
        verified: json['verified'] as bool?,
        sentCount: json['sentCount'] as int?,
      );

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
