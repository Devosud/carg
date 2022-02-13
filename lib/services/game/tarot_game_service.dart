import 'package:carg/models/game/tarot.dart';
import 'package:carg/models/players/tarot_players.dart';
import 'package:carg/models/score/misc/tarot_player_score.dart';
import 'package:carg/models/score/round/tarot_round.dart';
import 'package:carg/models/score/tarot_score.dart';
import 'package:carg/services/custom_exception.dart';
import 'package:carg/services/game/game_service.dart';
import 'package:carg/services/player_service.dart';
import 'package:carg/services/score/tarot_score_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class TarotGameService extends GameService<Tarot, TarotPlayers> {
  final TarotScoreService _tarotScoreService = TarotScoreService();
  final PlayerService _playerService = PlayerService();
  static const String dataBase = 'tarot-game';
  static const String flavor =
      String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  @override
  Future<List<Tarot>> getAllGamesOfPlayerPaginated(
      String? playerId, int pageSize) async {
    try {
      var tarotGames = <Tarot>[];
      if (playerId == null) {
        return tarotGames;
      }
      QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (lastFetchGameDocument != null) {
        querySnapshot = await FirebaseFirestore.instance
            .collection(dataBase + '-' + flavor)
            .where('players.player_list', arrayContains: playerId)
            .orderBy('starting_date', descending: true)
            .startAfterDocument(lastFetchGameDocument!)
            .limit(pageSize)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection(dataBase + '-' + flavor)
            .where('players.player_list', arrayContains: playerId)
            .orderBy('starting_date', descending: true)
            .limit(pageSize)
            .get();
      }
      if (querySnapshot.docs.isEmpty) {
        return tarotGames;
      }
      lastFetchGameDocument = querySnapshot.docs.last;
      for (var doc in querySnapshot.docs) {
        tarotGames.add(Tarot.fromJSON(doc.data(), doc.id));
      }
      return tarotGames;
    } on PlatformException catch (e) {
      throw CustomException(e.message!);
    }
  }

  @override
  Future<Tarot> getGame(String id) async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection(dataBase + '-' + flavor)
          .doc(id)
          .get();
      return Tarot.fromJSON(querySnapshot.data(), querySnapshot.id);
    } on PlatformException catch (e) {
      throw CustomException(e.message!);
    }
  }

  @override
  Future deleteGame(String? id) async {
    try {
      await FirebaseFirestore.instance
          .collection(dataBase + '-' + flavor)
          .doc(id)
          .delete();
      await _tarotScoreService.deleteScoreByGame(id);
    } on PlatformException catch (e) {
      throw CustomException(e.message!);
    }
  }

  @override
  Future<Tarot> createGameWithPlayerList(
      List<String?> playerListForOrder, List<String?> playerListForTeam) async {
    try {
      var tarotGame = Tarot(
          isEnded: false,
          startingDate: DateTime.now(),
          players: TarotPlayers(playerList: playerListForTeam));
      var documentReference = await FirebaseFirestore.instance
          .collection(dataBase + '-' + flavor)
          .add(tarotGame.toJSON());
      tarotGame.id = documentReference.id;
      var tarotScore = TarotScore(
          game: tarotGame.id,
          rounds: <TarotRound>[],
          players: playerListForTeam);
      await _tarotScoreService.saveScore(tarotScore);
      return tarotGame;
    } on PlatformException catch (e) {
      throw CustomException(e.message!);
    }
  }

  @override
  Future endAGame(Tarot game) async {
    try {
      TarotPlayerScore? winner;
      for (var player in game.players!.playerList!) {
        {
          await _playerService.incrementPlayedGamesByOne(player, game);
        }
      }
      var score = await _tarotScoreService.getScoreByGame(game.id);
      var totalPoints = score?.totalPoints;
      if (totalPoints != null && totalPoints.isNotEmpty) {
        totalPoints.sort((a, b) => a.score.compareTo(b.score));
        winner = totalPoints.last;
        await _playerService.incrementWonGamesByOne(winner.player, game);
      }
      await FirebaseFirestore.instance
          .collection(dataBase + '-' + flavor)
          .doc(game.id)
          .update({
        'is_ended': true,
        'ending_date': DateTime.now().toString(),
        'winner': winner?.player
      });
    } on PlatformException catch (e) {
      throw CustomException(e.message!);
    }
  }

  @override
  Future updateGame(Tarot game) async {
    try {
      await FirebaseFirestore.instance
          .collection(dataBase + '-' + flavor)
          .doc(game.id)
          .update(game.toJSON());
    } on PlatformException catch (e) {
      throw CustomException(e.message!);
    }
  }
}
