

class TarotPlayerScore {
  String player;
  double score;

  TarotPlayerScore({this.player, this.score});

  Map<String, dynamic> toJSON() {
    return {'player': player, 'score': score};
  }

  factory TarotPlayerScore.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return TarotPlayerScore(player: json['player'], score: json['score']);
  }

  static List<TarotPlayerScore> fromJSONList(List<dynamic> jsonList) {
    return jsonList.map((json) => TarotPlayerScore.fromJSON(json)).toList();
  }

  @override
  String toString() {
    return 'PlayerScore{player: $player, score: $score}';
  }
}
