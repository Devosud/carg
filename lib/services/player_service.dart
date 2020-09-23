import 'dart:convert';

import 'package:algolia/algolia.dart';
import 'package:carg/models/player/player.dart';
import 'package:carg/services/firebase_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class PlayerService {
  final String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  
  Future<List<Player>> getAllPlayers({String query = ''}) async {
    final algoliaConfig = jsonDecode(await rootBundle.loadString(
      'assets/config/algolia.json',
    ));
    var algolia = Algolia.init(applicationId: algoliaConfig['app_id'], apiKey: algoliaConfig['api_key']);
    var algoliaQuery = algolia.instance.index('player_' + flavor).search(query);
    try {
      var players = <Player>[];
      var snapshot = await algoliaQuery.getObjects();
      for (var doc in snapshot.hits) {
        players.add(Player.fromJSON(doc.data, doc.objectID));
      }
      return players;
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future incrementPlayedGamesByOne(Player player) async {
    try {
      await Firestore.instance
          .collection('player-' + flavor)
          .document(player.id)
          .updateData({'played_games': player.playedGames + 1});
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future incrementWonGamesByOne(String id) async {
    try {
      var player = await getPlayer(id);
      await Firestore.instance
          .collection('player-' + flavor)
          .document(player.id)
          .updateData({'won_games': player.wonGames + 1});
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future<Player> getPlayer(String id) async {
    try {
      var querySnapshot =
          await Firestore.instance.collection('player-' + flavor).document(id).get();
      return Player.fromJSON(querySnapshot.data, querySnapshot.documentID);
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future<Player> getPlayerOfUser(String userId) async {
    try {
      var querySnapshot = await Firestore.instance
          .collection('player-' + flavor)
          .reference()
          .where('linked_user_id', isEqualTo: userId)
          .getDocuments();
      if (querySnapshot.documents.isNotEmpty) {
        return Player.fromJSON(querySnapshot.documents.first.data,
            querySnapshot.documents.first.documentID);
      }
      return null;
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future updatePlayer(Player player) async {
    try {
      await Firestore.instance
          .collection('player-' + flavor)
          .document(player.id)
          .updateData(player.toJSON());
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future<String> addPlayer(Player player) async {
    try {
      var documentReference =
          await Firestore.instance.collection('player-' + flavor).add(player.toJSON());
      return documentReference.documentID;
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }

  Future deletePlayer(Player player) async {
    try {
      await Firestore.instance
          .collection('player-' + flavor)
          .document(player.id)
          .delete();
    } on PlatformException catch (e) {
      throw FirebaseException(e.message);
    }
  }
}
