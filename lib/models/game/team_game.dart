import 'package:carg/models/game/game.dart';
import 'package:carg/models/players/belote_players.dart';
import 'package:flutter/cupertino.dart';

abstract class Belote<T extends BelotePlayers> extends Game<T> {
  Belote(
      {id,
      @required gameType,
      @required gameService,
      @required scoreService,
      startingDate,
      endingDate,
      winner,
      isEnded,
      T players})
      : super(
            id: id,
            gameType: gameType,
            startingDate: startingDate,
            endingDate: endingDate,
            players: players,
            gameService: gameService,
            scoreService: scoreService,
            winner: winner,
            isEnded: isEnded);

  @override
  Map<String, dynamic> toJSON() {
    var tmpJSON = super.toJSON();
    tmpJSON.addAll({'players': players.toJSON()});
    return tmpJSON;
  }
}
