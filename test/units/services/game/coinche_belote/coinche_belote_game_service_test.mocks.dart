// Mocks generated by Mockito 5.1.0 from annotations
// in carg/test/units/services/game/coinche_belote/coinche_belote_game_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i17;

import 'package:carg/models/carg_object.dart' as _i8;
import 'package:carg/models/game/coinche_belote.dart' as _i19;
import 'package:carg/models/game/game.dart' as _i22;
import 'package:carg/models/player.dart' as _i21;
import 'package:carg/models/players/players.dart' as _i23;
import 'package:carg/models/score/belote_score.dart' as _i1;
import 'package:carg/models/score/coinche_belote_score.dart' as _i10;
import 'package:carg/models/score/round/belote_round.dart' as _i2;
import 'package:carg/models/score/round/round.dart' as _i6;
import 'package:carg/models/score/score.dart' as _i5;
import 'package:carg/models/team.dart' as _i15;
import 'package:carg/repositories/base_repository.dart' as _i9;
import 'package:carg/repositories/impl/game/coinche_belote_game_repository.dart'
    as _i18;
import 'package:carg/repositories/player/abstract_player_repository.dart'
    as _i12;
import 'package:carg/repositories/score/abstract_belote_score_repository.dart'
    as _i4;
import 'package:carg/repositories/score/abstract_score_repository.dart' as _i7;
import 'package:carg/repositories/team/abstract_team_repository.dart' as _i13;
import 'package:carg/services/impl/player_service.dart' as _i20;
import 'package:carg/services/impl/score/coinche_belote_score_service.dart'
    as _i16;
import 'package:carg/services/impl/team_service.dart' as _i24;
import 'package:carg/services/player/abstract_player_service.dart' as _i14;
import 'package:cloud_firestore/cloud_firestore.dart' as _i11;
import 'package:mockito/mockito.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeAbstractBeloteScoreRepository_0<
        T extends _i1.BeloteScore<_i2.BeloteRound>> extends _i3.Fake
    implements _i4.AbstractBeloteScoreRepository<T> {}

class _FakeAbstractScoreRepository_1<T extends _i5.Score<_i6.Round>>
    extends _i3.Fake implements _i7.AbstractScoreRepository<T> {}

class _FakeBaseRepository_2<T extends _i8.CargObject> extends _i3.Fake
    implements _i9.BaseRepository<T> {}

class _FakeCoincheBeloteScore_3 extends _i3.Fake
    implements _i10.CoincheBeloteScore {}

class _FakeFirebaseFirestore_4 extends _i3.Fake
    implements _i11.FirebaseFirestore {}

class _FakeAbstractPlayerRepository_5 extends _i3.Fake
    implements _i12.AbstractPlayerRepository {}

class _FakeAbstractTeamRepository_6 extends _i3.Fake
    implements _i13.AbstractTeamRepository {}

class _FakeAbstractPlayerService_7 extends _i3.Fake
    implements _i14.AbstractPlayerService {}

class _FakeTeam_8 extends _i3.Fake implements _i15.Team {}

/// A class which mocks [CoincheBeloteScoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoincheBeloteScoreService extends _i3.Mock
    implements _i16.CoincheBeloteScoreService {
  MockCoincheBeloteScoreService() {
    _i3.throwOnMissingStub(this);
  }

  @override
  _i4.AbstractBeloteScoreRepository<_i10.CoincheBeloteScore>
      get beloteScoreRepository =>
          (super.noSuchMethod(Invocation.getter(#beloteScoreRepository),
                  returnValue: _FakeAbstractBeloteScoreRepository_0<
                      _i10.CoincheBeloteScore>())
              as _i4.AbstractBeloteScoreRepository<_i10.CoincheBeloteScore>);
  @override
  _i7.AbstractScoreRepository<_i10.CoincheBeloteScore> get scoreRepository =>
      (super.noSuchMethod(Invocation.getter(#scoreRepository),
              returnValue:
                  _FakeAbstractScoreRepository_1<_i10.CoincheBeloteScore>())
          as _i7.AbstractScoreRepository<_i10.CoincheBeloteScore>);
  @override
  _i9.BaseRepository<_i5.Score<_i6.Round>> get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeBaseRepository_2<_i5.Score<_i6.Round>>())
          as _i9.BaseRepository<_i5.Score<_i6.Round>>);
  @override
  _i17.Future<_i10.CoincheBeloteScore> generateNewScore(String? gameId) =>
      (super.noSuchMethod(Invocation.method(#generateNewScore, [gameId]),
              returnValue: Future<_i10.CoincheBeloteScore>.value(
                  _FakeCoincheBeloteScore_3()))
          as _i17.Future<_i10.CoincheBeloteScore>);
  @override
  _i17.Future<_i10.CoincheBeloteScore?> getScoreByGame(String? gameId) =>
      (super.noSuchMethod(Invocation.method(#getScoreByGame, [gameId]),
              returnValue: Future<_i10.CoincheBeloteScore?>.value())
          as _i17.Future<_i10.CoincheBeloteScore?>);
  @override
  _i17.Stream<_i10.CoincheBeloteScore?> getScoreByGameStream(String? gameId) =>
      (super.noSuchMethod(Invocation.method(#getScoreByGameStream, [gameId]),
              returnValue: Stream<_i10.CoincheBeloteScore?>.empty())
          as _i17.Stream<_i10.CoincheBeloteScore?>);
  @override
  _i17.Future<void> deleteScoreByGame(String? gameId) => (super.noSuchMethod(
      Invocation.method(#deleteScoreByGame, [gameId]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<_i5.Score<_i6.Round>?> get(String? id) =>
      (super.noSuchMethod(Invocation.method(#get, [id]),
              returnValue: Future<_i5.Score<_i6.Round>?>.value())
          as _i17.Future<_i5.Score<_i6.Round>?>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
      Invocation.method(#delete, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i5.Score<_i6.Round>? t) => (super.noSuchMethod(
      Invocation.method(#update, [t]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<String> create(_i5.Score<_i6.Round>? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i17.Future<String>);
}

/// A class which mocks [CoincheBeloteGameRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoincheBeloteGameRepository extends _i3.Mock
    implements _i18.CoincheBeloteGameRepository {
  MockCoincheBeloteGameRepository() {
    _i3.throwOnMissingStub(this);
  }

  @override
  set lastFetchGameDocument(
          _i11.DocumentSnapshot<Object?>? _lastFetchGameDocument) =>
      super.noSuchMethod(
          Invocation.setter(#lastFetchGameDocument, _lastFetchGameDocument),
          returnValueForMissingStub: null);
  @override
  String get database =>
      (super.noSuchMethod(Invocation.getter(#database), returnValue: '')
          as String);
  @override
  String get environment =>
      (super.noSuchMethod(Invocation.getter(#environment), returnValue: '')
          as String);
  @override
  _i11.FirebaseFirestore get provider =>
      (super.noSuchMethod(Invocation.getter(#provider),
          returnValue: _FakeFirebaseFirestore_4()) as _i11.FirebaseFirestore);
  @override
  String get connectionString =>
      (super.noSuchMethod(Invocation.getter(#connectionString), returnValue: '')
          as String);
  @override
  set connectionString(String? _connectionString) => super.noSuchMethod(
      Invocation.setter(#connectionString, _connectionString),
      returnValueForMissingStub: null);
  @override
  _i17.Future<_i19.CoincheBelote?> get(String? id) =>
      (super.noSuchMethod(Invocation.method(#get, [id]),
              returnValue: Future<_i19.CoincheBelote?>.value())
          as _i17.Future<_i19.CoincheBelote?>);
  @override
  _i17.Future<List<_i19.CoincheBelote>> getAllGamesOfPlayer(
          String? playerId, int? pageSize) =>
      (super.noSuchMethod(
              Invocation.method(#getAllGamesOfPlayer, [playerId, pageSize]),
              returnValue: Future<List<_i19.CoincheBelote>>.value(
                  <_i19.CoincheBelote>[]))
          as _i17.Future<List<_i19.CoincheBelote>>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
      Invocation.method(#delete, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<void> updateField(String? id, String? fieldName, dynamic value) =>
      (super.noSuchMethod(
              Invocation.method(#updateField, [id, fieldName, value]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i17.Future<void>);
  @override
  _i17.Future<void> partialUpdate(
          _i19.CoincheBelote? t, Map<String, dynamic>? partToUpdate) =>
      (super.noSuchMethod(Invocation.method(#partialUpdate, [t, partToUpdate]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i19.CoincheBelote? t) => (super.noSuchMethod(
      Invocation.method(#update, [t]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<String> create(_i19.CoincheBelote? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i17.Future<String>);
}

/// A class which mocks [PlayerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlayerService extends _i3.Mock implements _i20.PlayerService {
  MockPlayerService() {
    _i3.throwOnMissingStub(this);
  }

  @override
  _i12.AbstractPlayerRepository get playerRepository =>
      (super.noSuchMethod(Invocation.getter(#playerRepository),
              returnValue: _FakeAbstractPlayerRepository_5())
          as _i12.AbstractPlayerRepository);
  @override
  _i9.BaseRepository<_i21.Player> get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeBaseRepository_2<_i21.Player>())
          as _i9.BaseRepository<_i21.Player>);
  @override
  _i17.Future<String> create(_i21.Player? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i17.Future<String>);
  @override
  _i17.Future<void> incrementPlayedGamesByOne(
          String? playerId, _i22.Game<_i23.Players>? game) =>
      (super.noSuchMethod(
              Invocation.method(#incrementPlayedGamesByOne, [playerId, game]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i17.Future<void>);
  @override
  _i17.Future<void> incrementWonGamesByOne(
          String? playerId, _i22.Game<_i23.Players>? game) =>
      (super.noSuchMethod(
              Invocation.method(#incrementWonGamesByOne, [playerId, game]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i17.Future<void>);
  @override
  _i17.Future<_i21.Player?> getPlayerOfUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#getPlayerOfUser, [userId]),
              returnValue: Future<_i21.Player?>.value())
          as _i17.Future<_i21.Player?>);
  @override
  _i17.Future<List<_i21.Player>> searchPlayers(
          {String? query = r'', _i21.Player? currentPlayer}) =>
      (super.noSuchMethod(
              Invocation.method(#searchPlayers, [],
                  {#query: query, #currentPlayer: currentPlayer}),
              returnValue: Future<List<_i21.Player>>.value(<_i21.Player>[]))
          as _i17.Future<List<_i21.Player>>);
  @override
  _i17.Future<_i21.Player?> get(String? id) => (super.noSuchMethod(
      Invocation.method(#get, [id]),
      returnValue: Future<_i21.Player?>.value()) as _i17.Future<_i21.Player?>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
      Invocation.method(#delete, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i21.Player? t) => (super.noSuchMethod(
      Invocation.method(#update, [t]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
}

/// A class which mocks [TeamService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTeamService extends _i3.Mock implements _i24.TeamService {
  MockTeamService() {
    _i3.throwOnMissingStub(this);
  }

  @override
  _i13.AbstractTeamRepository get teamRepository =>
      (super.noSuchMethod(Invocation.getter(#teamRepository),
              returnValue: _FakeAbstractTeamRepository_6())
          as _i13.AbstractTeamRepository);
  @override
  _i14.AbstractPlayerService get playerService =>
      (super.noSuchMethod(Invocation.getter(#playerService),
              returnValue: _FakeAbstractPlayerService_7())
          as _i14.AbstractPlayerService);
  @override
  _i9.BaseRepository<_i15.Team> get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeBaseRepository_2<_i15.Team>())
          as _i9.BaseRepository<_i15.Team>);
  @override
  _i17.Future<_i15.Team> getTeamByPlayers(List<String?>? playerIds) =>
      (super.noSuchMethod(Invocation.method(#getTeamByPlayers, [playerIds]),
              returnValue: Future<_i15.Team>.value(_FakeTeam_8()))
          as _i17.Future<_i15.Team>);
  @override
  _i17.Future<_i15.Team> incrementPlayedGamesByOne(
          String? id, _i22.Game<_i23.Players>? game) =>
      (super.noSuchMethod(
              Invocation.method(#incrementPlayedGamesByOne, [id, game]),
              returnValue: Future<_i15.Team>.value(_FakeTeam_8()))
          as _i17.Future<_i15.Team>);
  @override
  _i17.Future<_i15.Team> incrementWonGamesByOne(
          String? id, _i22.Game<_i23.Players>? game) =>
      (super.noSuchMethod(
              Invocation.method(#incrementWonGamesByOne, [id, game]),
              returnValue: Future<_i15.Team>.value(_FakeTeam_8()))
          as _i17.Future<_i15.Team>);
  @override
  _i17.Future<_i15.Team?> get(String? id) =>
      (super.noSuchMethod(Invocation.method(#get, [id]),
          returnValue: Future<_i15.Team?>.value()) as _i17.Future<_i15.Team?>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
      Invocation.method(#delete, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i15.Team? t) => (super.noSuchMethod(
      Invocation.method(#update, [t]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i17.Future<void>);
  @override
  _i17.Future<String> create(_i15.Team? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i17.Future<String>);
}
