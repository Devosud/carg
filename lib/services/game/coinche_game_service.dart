import 'package:carg/models/game/coinche_game.dart';
import 'package:carg/models/players/team_game_players.dart';
import 'package:carg/models/score/coinche_score.dart';
import 'package:carg/models/score/round/coinche_round.dart';
import 'package:carg/models/team.dart';
import 'package:carg/services/custom_exception.dart';
import 'package:carg/services/game/team_game_service.dart';
import 'package:carg/services/player_service.dart';
import 'package:carg/services/score/coinche_score_service.dart';
import 'package:carg/services/team_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class CoincheGameService implements TeamGameService<CoincheGame> {
  final TeamService _teamService = TeamService();
  final PlayerService _playerService = PlayerService();
  final CoincheScoreService _coincheScoreService = CoincheScoreService();
  static const String flavor =
      String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  CoincheGameService() : super();

  @override
  Future<List<CoincheGame>> getAllGames() async {
    try {
      var coincheGames = <CoincheGame>[];
      var querySnapshot = await FirebaseFirestore.instance
          .collection('coinche-game-' + flavor)
          .orderBy('starting_date', descending: true)
          .get();
      for (var doc in querySnapshot.docs) {
        coincheGames.add(CoincheGame.fromJSON(doc.data(), doc.id));
      }
      return coincheGames;
    } on PlatformException catch (e) {
      throw CustomException(e.message);
    }
  }

  @override
  Future<CoincheGame> getGame(String id) async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('coinche-game-' + flavor)
          .doc(id)
          .get();
      return CoincheGame.fromJSON(querySnapshot.data(), querySnapshot.id);
    } on PlatformException catch (e) {
      throw CustomException(e.message);
    }
  }

  @override
  Future deleteGame(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('coinche-game-' + flavor)
          .doc(id)
          .delete();
      await _coincheScoreService.deleteScoreByGame(id);
    } on PlatformException catch (e) {
      throw CustomException(e.message);
    }
  }

  @override
  Future<CoincheGame> createGameWithPlayerList(List<String> playerList) async {
    try {
      var usTeam = await _teamService
          .getTeamByPlayers(playerList.sublist(0, 2).map((e) => e).toList());
      var themTeam = await _teamService
          .getTeamByPlayers(playerList.sublist(2, 4).map((e) => e).toList());
      playerList.forEach((player) async =>
          {await _playerService.incrementPlayedGamesByOne(player)});
      var coincheGame = CoincheGame(
          players: TeamGamePlayers(
              us: usTeam.id, them: themTeam.id, playerList: playerList));
      var documentReference = await FirebaseFirestore.instance
          .collection('coinche-game-' + flavor)
          .add(coincheGame.toJSON());
      coincheGame.id = documentReference.id;
      var coincheScore = CoincheScore(
          usTotalPoints: 0,
          themTotalPoints: 0,
          game: coincheGame.id,
          rounds: <CoincheRound>[]);
      await _coincheScoreService.saveScore(coincheScore);
      return coincheGame;
    } on PlatformException catch (e) {
      throw CustomException(e.message);
    }
  }

  @override
  Future endAGame(CoincheGame game) async {
    try {
      Team winners;
      var score = await _coincheScoreService.getScoreByGame(game.id);
      if (score.themTotalPoints > score.usTotalPoints) {
        winners = await _teamService.incrementWonGamesByOne(game.players.them);
      } else if (score.themTotalPoints < score.usTotalPoints) {
        winners = await _teamService.incrementWonGamesByOne(game.players.us);
      }
      await FirebaseFirestore.instance
          .collection('coinche-game-' + flavor)
          .doc(game.id)
          .update({
        'is_ended': true,
        'ending_date': DateTime.now().toString(),
        'winners': winners?.id
      });
    } on PlatformException catch (e) {
      throw CustomException(e.message);
    }
  }
}
