import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/game/team_game.dart';
import 'package:carg/models/players/belote_players.dart';
import 'package:carg/services/game/french_belote_service.dart';
import 'package:carg/services/score/french_belote_score_service.dart';

class FrenchBelote extends Belote {
  FrenchBelote({id, startingDate, endingDate, winner, isEnded, players})
      : super(
      id: id,
            gameType: GameType.BELOTE,
            gameService: FrenchBeloteService(),
            scoreService: FrenchBeloteScoreService(),
            players: players ?? BelotePlayers(),
            startingDate: startingDate ?? DateTime.now(),
            endingDate: endingDate,
            winner: winner,
            isEnded: isEnded ?? false);

  @override
  Map<String, dynamic> toJSON() {
    return super.toJSON();
  }

  factory FrenchBelote.fromJSON(Map<String, dynamic> json, String id) {
    if (json == null) {
      return null;
    }
    return FrenchBelote(
        id: id,
        startingDate: DateTime.parse(json['starting_date']),
        endingDate: json['ending_date'] != null
            ? DateTime.parse(json['ending_date'])
            : null,
        isEnded: json['is_ended'],
        players: BelotePlayers.fromJSON(json['players']),
        winner: json['winners']);
  }
}
