import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

/// Format du contenu d'un article.
enum ContentFormat {
  @JsonValue('markdown')
  markdown,
  @JsonValue('html')
  html,
  @JsonValue('text')
  text,
}

/// Article de la base de connaissances.
@freezed
abstract class KnowledgeArticle with _$KnowledgeArticle {
  const factory KnowledgeArticle({
    required String id,
    required String title,
    required String slug,
    required String content,
    String? applicationId,
    String? categoryId,
    @Default(ContentFormat.markdown) ContentFormat contentFormat,
    List<String>? tags,
    @Default(0) int viewCount,
    @Default(0) int helpfulCount,
    @Default(0) int notHelpfulCount,
    @Default(false) bool isPublished,
    DateTime? publishedAt,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _KnowledgeArticle;

  factory KnowledgeArticle.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeArticleFromJson(json);
}
