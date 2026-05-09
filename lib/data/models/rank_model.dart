class RankedTask {
  final String id;
  final String title;
  final int suggetsted_rank;
  final String reasoning;
  final String Estimated_effort;
  final String impact_level;

  //rank tasks with properties
  RankedTask(
    this.id,
    this.title,
    this.suggetsted_rank,
    this.reasoning,
    this.Estimated_effort,
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
      json['suggetsted_rank'],
      json['reasoning'],
      json['Estimated_effort'],
      json['impact_level'],
    );
  }
}
