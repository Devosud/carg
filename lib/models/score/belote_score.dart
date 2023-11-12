import 'package:carg/models/score/misc/belote_team_enum.dart';
import 'package:carg/models/score/round/belote_round.dart';
import 'package:carg/models/score/score.dart';

abstract class BeloteScore<T extends BeloteRound> extends Score<T> {
  late List<T> rounds;
  int usTotalPoints;
  int themTotalPoints;
  String? game;

  BeloteScore({
    super.id,
    rounds,
    required this.usTotalPoints,
    required this.themTotalPoints,
    this.game,
  }) {
    this.rounds = rounds ?? <T>[];
  }

  @override
  BeloteScore replaceLastRound(T round) {
    usTotalPoints -= getPointsOfRound(BeloteTeamEnum.US, getLastRound());
    themTotalPoints -= getPointsOfRound(BeloteTeamEnum.THEM, getLastRound());
    _setLastRound(round);

    return this;
  }

  @override
  BeloteScore deleteLastRound() {
    usTotalPoints -= getPointsOfRound(BeloteTeamEnum.US, getLastRound());
    themTotalPoints -= getPointsOfRound(BeloteTeamEnum.THEM, getLastRound());
    rounds.removeLast();

    return this;
  }

  @override
  T getLastRound() {
    return rounds.last;
  }

  int getPointsOfRound(BeloteTeamEnum teamGameEnum, T teamGameRound) {
    return teamGameEnum == teamGameRound.taker
        ? teamGameRound.takerScore
        : teamGameRound.defenderScore;
  }

  void addRound(T round) {
    usTotalPoints += getPointsOfRound(BeloteTeamEnum.US, round);
    themTotalPoints += getPointsOfRound(BeloteTeamEnum.THEM, round);
    round.index = rounds.length;
    rounds.add(round);
  }

  void _setLastRound(T round) {
    usTotalPoints += getPointsOfRound(BeloteTeamEnum.US, round);
    themTotalPoints += getPointsOfRound(BeloteTeamEnum.THEM, round);
    rounds.last = round;
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      'rounds': rounds.map((round) => round.toJSON()).toList(),
      'us_total_points': usTotalPoints,
      'them_total_points': themTotalPoints,
      'game': game,
    };
  }
}
