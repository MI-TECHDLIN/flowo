import 'package:flowo/data/models/rank_model.dart';

class SuggestiionResponse {
  final List<RankedTask> ranked_tasks;
  final String daily_focus;
  final String disclaimer;

  SuggestiionResponse({
    required this.ranked_tasks,
    required this.daily_focus,
    required this.disclaimer,
  });

  factory SuggestiionResponse.fromJson(Map<String, dynamic> json) {
    return SuggestiionResponse(
      ranked_tasks: (json['ranked_tasks'] as List)
          .map((item) => RankedTask.fromJson(item))
          .toList(),
      daily_focus: json['daily_focus'],
      disclaimer: json['disclaimer'],
    );
  }
}
