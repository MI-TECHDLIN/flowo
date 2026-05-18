class RankedTask {
  final String id;
  final String title;
  final int suggetsted_rank;
  final String reasoning;
  final String estimated_effort;
  final String impact_level;

  //rank tasks with properties
  RankedTask(
    this.id,
    this.title,
    this.suggetsted_rank,
    this.reasoning,
    this.estimated_effort,
    this.impact_level,
  );

  factory RankedTask.fromJson(Map<String, dynamic> json) {
    '''
convert json data from api to dart object
from python the same index

''';
    return RankedTask(
      json['id'],
      json['title'],
      json['suggested_rank'],
      json['reasoning'],
      json['estimated_effort'],
      json['impact_level'],
    );
  }
}
