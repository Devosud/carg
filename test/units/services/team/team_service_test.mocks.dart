// Mocks generated by Mockito 5.1.0 from annotations
// in carg/test/units/services/team/team_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;

import 'package:carg/models/carg_object.dart' as _i5;
import 'package:carg/models/game/game.dart' as _i11;
import 'package:carg/models/player.dart' as _i10;
import 'package:carg/models/players/players.dart' as _i12;
import 'package:carg/models/team.dart' as _i3;
import 'package:carg/repositories/base_repository.dart' as _i6;
import 'package:carg/repositories/impl/team_repository.dart' as _i7;
import 'package:carg/repositories/player/abstract_player_repository.dart'
    as _i4;
import 'package:carg/services/impl/player_service.dart' as _i9;
import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseFirestore_0 extends _i1.Fake
    implements _i2.FirebaseFirestore {}

class _FakeTeam_1 extends _i1.Fake implements _i3.Team {}

class _FakeAbstractPlayerRepository_2 extends _i1.Fake
    implements _i4.AbstractPlayerRepository {}

class _FakeBaseRepository_3<T extends _i5.CargObject> extends _i1.Fake
    implements _i6.BaseRepository<T> {}

/// A class which mocks [TeamRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTeamRepository extends _i1.Mock implements _i7.TeamRepository {
  MockTeamRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get database =>
      (super.noSuchMethod(Invocation.getter(#database), returnValue: '')
          as String);

  @override
  String get environment =>
      (super.noSuchMethod(Invocation.getter(#environment), returnValue: '')
          as String);
  @override
  _i2.FirebaseFirestore get provider =>
      (super.noSuchMethod(Invocation.getter(#provider),
          returnValue: _FakeFirebaseFirestore_0()) as _i2.FirebaseFirestore);
  @override
  String get connectionString =>
      (super.noSuchMethod(Invocation.getter(#connectionString), returnValue: '')
          as String);
  @override
  set connectionString(String? _connectionString) => super.noSuchMethod(
      Invocation.setter(#connectionString, _connectionString),
      returnValueForMissingStub: null);

  @override
  _i8.Future<_i3.Team?> get(String? id) =>
      (super.noSuchMethod(Invocation.method(#get, [id]),
          returnValue: Future<_i3.Team?>.value()) as _i8.Future<_i3.Team?>);

  @override
  _i8.Future<_i3.Team?> getTeamByPlayers(List<String?>? playerIds) =>
      (super.noSuchMethod(Invocation.method(#getTeamByPlayers, [playerIds]),
          returnValue: Future<_i3.Team?>.value()) as _i8.Future<_i3.Team?>);

  @override
  _i8.Future<_i3.Team> createTeamWithPlayers(List<String?>? playerIds) => (super
          .noSuchMethod(Invocation.method(#createTeamWithPlayers, [playerIds]),
              returnValue: Future<_i3.Team>.value(_FakeTeam_1()))
      as _i8.Future<_i3.Team>);

  @override
  _i8.Future<void> delete(String? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<void> updateField(String? id, String? fieldName, dynamic value) =>
      (super.noSuchMethod(
          Invocation.method(#updateField, [id, fieldName, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<void> partialUpdate(
          _i3.Team? t, Map<String, dynamic>? partToUpdate) =>
      (super.noSuchMethod(Invocation.method(#partialUpdate, [t, partToUpdate]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<void> update(_i3.Team? t) =>
      (super.noSuchMethod(Invocation.method(#update, [t]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<String> create(_i3.Team? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
}

/// A class which mocks [PlayerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlayerService extends _i1.Mock implements _i9.PlayerService {
  MockPlayerService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AbstractPlayerRepository get playerRepository =>
      (super.noSuchMethod(Invocation.getter(#playerRepository),
              returnValue: _FakeAbstractPlayerRepository_2())
          as _i4.AbstractPlayerRepository);

  @override
  _i6.BaseRepository<_i10.Player> get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeBaseRepository_3<_i10.Player>())
          as _i6.BaseRepository<_i10.Player>);

  @override
  _i8.Future<String> create(_i10.Player? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);

  @override
  _i8.Future<void> incrementPlayedGamesByOne(
          String? playerId, _i11.Game<_i12.Players>? game) =>
      (super.noSuchMethod(
          Invocation.method(#incrementPlayedGamesByOne, [playerId, game]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<void> incrementWonGamesByOne(
          String? playerId, _i11.Game<_i12.Players>? game) =>
      (super.noSuchMethod(
          Invocation.method(#incrementWonGamesByOne, [playerId, game]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<_i10.Player?> getPlayerOfUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#getPlayerOfUser, [userId]),
              returnValue: Future<_i10.Player?>.value())
          as _i8.Future<_i10.Player?>);

  @override
  _i8.Future<List<_i10.Player>> searchPlayers(
          {String? query = r'', _i10.Player? currentPlayer}) =>
      (super.noSuchMethod(
              Invocation.method(#searchPlayers, [],
                  {#query: query, #currentPlayer: currentPlayer}),
              returnValue: Future<List<_i10.Player>>.value(<_i10.Player>[]))
          as _i8.Future<List<_i10.Player>>);

  @override
  _i8.Future<_i10.Player?> get(String? id) => (super.noSuchMethod(
      Invocation.method(#get, [id]),
      returnValue: Future<_i10.Player?>.value()) as _i8.Future<_i10.Player?>);

  @override
  _i8.Future<void> delete(String? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);

  @override
  _i8.Future<void> update(_i10.Player? t) =>
      (super.noSuchMethod(Invocation.method(#update, [t]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
}
