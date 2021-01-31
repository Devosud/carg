import 'package:carg/models/game/game.dart';
import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/players/tarot_game_players.dart';
import 'package:carg/services/game/tarot_game_service.dart';
import 'package:carg/services/score/tarot_score_service.dart';

class TarotGame extends Game<TarotGamePlayers> {

  TarotGame({id, startingDate, endingDate, winner, isEnded, players})
      : super(
            id: id,
            gameType: GameType.TAROT,
            gameService: TarotGameService(),
            scoreService: TarotScoreService(),
            players: players ?? TarotGamePlayers(),
            startingDate: startingDate,
            endingDate: endingDate,
            winner: winner,
            isEnded: isEnded);

  @override
  Map<String, dynamic> toJSON() {
    var tmpJSON = super.toJSON();
    tmpJSON.addAll({'players': players.toJSON()});
    return tmpJSON;
  }

  factory TarotGame.fromJSON(Map<String, dynamic> json, String id) {
    if (json == null) {
      return null;
    }
    return TarotGame(
        id: id,
        startingDate: DateTime.parse(json['starting_date']),
        endingDate: json['ending_date'] != null
            ? DateTime.parse(json['ending_date'])
            : null,
        isEnded: json['is_ended'],
        winner: json['winner'],
        players: TarotGamePlayers.fromJSON(json['players']));
  }
}
