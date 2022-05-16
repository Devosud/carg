// Mocks generated by Mockito 5.1.0 from annotations
// in carg/test/widgets/player_info_dialog_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:carg/models/carg_object.dart' as _i3;
import 'package:carg/models/game/game.dart' as _i8;
import 'package:carg/models/player.dart' as _i6;
import 'package:carg/models/players/players.dart' as _i9;
import 'package:carg/repositories/base_repository.dart' as _i4;
import 'package:carg/repositories/player/abstract_player_repository.dart'
    as _i2;
import 'package:carg/services/impl/player_service.dart' as _i5;
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

class _FakeAbstractPlayerRepository_0 extends _i1.Fake
    implements _i2.AbstractPlayerRepository {}

class _FakeBaseRepository_1<T extends _i3.CargObject> extends _i1.Fake
    implements _i4.BaseRepository<T> {}

/// A class which mocks [PlayerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlayerService extends _i1.Mock implements _i5.PlayerService {
  MockPlayerService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AbstractPlayerRepository get playerRepository =>
      (super.noSuchMethod(Invocation.getter(#playerRepository),
              returnValue: _FakeAbstractPlayerRepository_0())
          as _i2.AbstractPlayerRepository);

  @override
  _i4.BaseRepository<_i6.Player> get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeBaseRepository_1<_i6.Player>())
          as _i4.BaseRepository<_i6.Player>);
  @override
  _i7.Future<String> create(_i6.Player? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<void> incrementPlayedGamesByOne(
          String? playerId, _i8.Game<_i9.Players>? game) =>
      (super.noSuchMethod(
          Invocation.method(#incrementPlayedGamesByOne, [playerId, game]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> incrementWonGamesByOne(
          String? playerId, _i8.Game<_i9.Players>? game) =>
      (super.noSuchMethod(
          Invocation.method(#incrementWonGamesByOne, [playerId, game]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i6.Player?> getPlayerOfUser(String? userId) =>
      (super.noSuchMethod(Invocation.method(#getPlayerOfUser, [userId]),
          returnValue: Future<_i6.Player?>.value()) as _i7.Future<_i6.Player?>);
  @override
  _i7.Future<List<_i6.Player>> searchPlayers(
          {String? query = r'', _i6.Player? currentPlayer}) =>
      (super.noSuchMethod(
              Invocation.method(#searchPlayers, [],
                  {#query: query, #currentPlayer: currentPlayer}),
              returnValue: Future<List<_i6.Player>>.value(<_i6.Player>[]))
          as _i7.Future<List<_i6.Player>>);
  @override
  _i7.Future<_i6.Player?> get(String? id) =>
      (super.noSuchMethod(Invocation.method(#get, [id]),
          returnValue: Future<_i6.Player?>.value()) as _i7.Future<_i6.Player?>);
  @override
  _i7.Future<void> delete(String? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> update(_i6.Player? t) =>
      (super.noSuchMethod(Invocation.method(#update, [t]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
}
