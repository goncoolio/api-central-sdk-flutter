// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KnowledgeArticle _$KnowledgeArticleFromJson(Map<String, dynamic> json) =>
    _KnowledgeArticle(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      content: json['content'] as String,
      applicationId: json['applicationId'] as String?,
      categoryId: json['categoryId'] as String?,
      contentFormat:
          $enumDecodeNullable(_$ContentFormatEnumMap, json['contentFormat']) ??
          ContentFormat.markdown,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      helpfulCount: (json['helpfulCount'] as num?)?.toInt() ?? 0,
      notHelpfulCount: (json['notHelpfulCount'] as num?)?.toInt() ?? 0,
      isPublished: json['isPublished'] as bool? ?? false,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      createdById: json['createdById'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$KnowledgeArticleToJson(_KnowledgeArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
      'applicationId': instance.applicationId,
      'categoryId': instance.categoryId,
      'contentFormat': _$ContentFormatEnumMap[instance.contentFormat]!,
      'tags': instance.tags,
      'viewCount': instance.viewCount,
      'helpfulCount': instance.helpfulCount,
      'notHelpfulCount': instance.notHelpfulCount,
      'isPublished': instance.isPublished,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'createdById': instance.createdById,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ContentFormatEnumMap = {
  ContentFormat.markdown: 'markdown',
  ContentFormat.html: 'html',
  ContentFormat.text: 'text',
};
