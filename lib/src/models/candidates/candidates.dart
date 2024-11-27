import '../content/content.dart';
import '../safety_ratings/safety_ratings.dart';

/// [Candidates] is the value in request response
/// A class representing the AI-generated response, including content,
/// metadata, and safety-related information.
class Candidates {
  /// The main content of the response generated by the AI.
  Content? content;

  /// The reason why the generation process ended. Possible values might
  /// include "stop", "length", or other reasons depending on the model.
  String? finishReason;

  /// The index of the candidate in the response list, useful when multiple
  /// responses are generated in a single request.
  int? index;

  /// A list of safety ratings for the content, indicating whether it adheres
  /// to safety standards, such as filtering offensive or inappropriate content.
  List<SafetyRatings>? safetyRatings;

  /// Creates a new `Candidates` object with optional parameters.
  Candidates({
    this.content,
    this.finishReason,
    this.index,
    this.safetyRatings,
  });

  /// Factory constructor to create a `Candidates` instance from a JSON object.
  factory Candidates.fromJson(Map<String, dynamic> json) {
    return Candidates(
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String?,
      index: (json['index'] as num?)?.toInt(),
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRatings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts the `Candidates` object to a JSON object.
  Map<String, dynamic> toJson(Map<String, dynamic> json) => {
        'content': content?.toJson(),
        'finishReason': finishReason,
        'index': index,
        'safetyRatings': safetyRatings?.map((e) => e.toJson()).toList(),
      };

  /// Creates a copy of the current `Candidates` object with optional updated fields.
  Candidates copyWith(
    Content? content,
    String? finishReason,
    int? index,
    List<SafetyRatings>? safetyRatings,
  ) =>
      Candidates(
        safetyRatings: safetyRatings ?? this.safetyRatings,
        index: index ?? this.index,
        finishReason: finishReason ?? this.finishReason,
        content: content ?? this.content,
      );

  /// Converts a JSON list into a list of `Candidates` objects.
  static List<Candidates> jsonToList(List list) =>
      list.map((e) => Candidates.fromJson(e as Map<String, dynamic>)).toList();
}
