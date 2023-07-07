// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      user: json['user'] as String?,
      text: json['text'] as String?,
      v: json['__v'] as int?,
      source: json['source'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      type: json['type'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deleted: json['deleted'] as bool?,
      used: json['used'] as bool?,
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'user': instance.user,
      'text': instance.text,
      '__v': instance.v,
      'source': instance.source,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
      'deleted': instance.deleted,
      'used': instance.used,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      verified: json['verified'] as bool?,
      sentCount: json['sentCount'] as int?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'verified': instance.verified,
      'sentCount': instance.sentCount,
    };
