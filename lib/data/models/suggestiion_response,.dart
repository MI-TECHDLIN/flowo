import 'package:flowo/data/models/rank_model.dart';

class SuggestionResponse {
  final List<RankedTask> ranked_tasks;
  final String daily_focus;
  final String disclaimer;

  SuggestionResponse({
    required this.ranked_tasks,
    required this.daily_focus,
    required this.disclaimer,
  });

  factory SuggestionResponse.fromJson(Map<String, dynamic> json) {
    return SuggestionResponse(
      ranked_tasks: (json['ranked_tasks'] as List)
          .map((item) => RankedTask.fromJson(item))
          .toList(),
      daily_focus: json['daily_focus'],
      disclaimer: json['disclaimer'],
    );
  }
}
