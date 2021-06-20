import 'package:carg/models/game/belote_game.dart';
import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/players/belote_players.dart';
import 'package:carg/services/game/french_belote_service.dart';
import 'package:carg/services/score/french_belote_score_service.dart';

class FrenchBelote extends Belote {
  FrenchBelote({id, startingDate, endingDate, winner, isEnded, players, notes})
      : super(
            id: id,
            gameType: GameType.BELOTE,
            gameService: FrenchBeloteService(),
            scoreService: FrenchBeloteScoreService(),
            players: players ?? BelotePlayers(),
            endingDate: endingDate,
            startingDate: startingDate,
            isEnded: isEnded ?? false,
            winner: winner,
            notes: notes);

  @override
  Map<String, dynamic> toJSON() {
    return super.toJSON();
  }

  factory FrenchBelote.fromJSON(Map<String, dynamic>? json, String id) {
    return FrenchBelote(
        id: id,
        startingDate: DateTime.parse(json?['starting_date']),
        endingDate: json?['ending_date'] != null
            ? DateTime.parse(json?['ending_date'])
            : null,
        isEnded: json?['is_ended'] as bool,
        players: BelotePlayers.fromJSON(json?['players']),
        winner: json?['winners'],
        notes: json?['notes']);
  }
}
