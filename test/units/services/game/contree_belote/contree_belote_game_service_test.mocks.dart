// Mocks generated by Mockito 5.3.2 from annotations
// in carg/test/units/services/game/contree_belote/contree_belote_game_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i17;

import 'package:carg/models/carg_object.dart' as _i8;
import 'package:carg/models/game/contree_belote.dart' as _i19;
import 'package:carg/models/game/game.dart' as _i22;
import 'package:carg/models/game/setting/game_setting.dart' as _i24;
import 'package:carg/models/player.dart' as _i21;
import 'package:carg/models/players/players.dart' as _i23;
import 'package:carg/models/score/belote_score.dart' as _i1;
import 'package:carg/models/score/contree_belote_score.dart' as _i16;
import 'package:carg/models/score/round/belote_round.dart' as _i2;
import 'package:carg/models/score/round/round.dart' as _i6;
import 'package:carg/models/score/score.dart' as _i5;
import 'package:carg/models/team.dart' as _i14;
import 'package:carg/repositories/base_repository.dart' as _i9;
import 'package:carg/repositories/impl/game/contree_belote_game_repository.dart'
    as _i18;
import 'package:carg/repositories/player/abstract_player_repository.dart'
    as _i11;
import 'package:carg/repositories/score/abstract_belote_score_repository.dart'
    as _i4;
import 'package:carg/repositories/score/abstract_score_repository.dart' as _i7;
import 'package:carg/repositories/team/abstract_team_repository.dart' as _i12;
import 'package:carg/services/impl/player_service.dart' as _i20;
import 'package:carg/services/impl/score/contree_belote_score_service.dart'
    as _i15;
import 'package:carg/services/impl/team_service.dart' as _i25;
import 'package:carg/services/player/abstract_player_service.dart' as _i13;
import 'package:cloud_firestore/cloud_firestore.dart' as _i10;
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
// ignore_for_file: subtype_of_sealed_class

class _FakeAbstractBeloteScoreRepository_0<
        T extends _i1.BeloteScore<_i2.BeloteRound>> extends _i3.SmartFake
    implements _i4.AbstractBeloteScoreRepository<T> {
  _FakeAbstractBeloteScoreRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAbstractScoreRepository_1<T extends _i5.Score<_i6.Round>>
    extends _i3.SmartFake implements _i7.AbstractScoreRepository<T> {
  _FakeAbstractScoreRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseRepository_2<T extends _i8.CargObject> extends _i3.SmartFake
    implements _i9.BaseRepository<T> {
  _FakeBaseRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseFirestore_3 extends _i3.SmartFake
    implements _i10.FirebaseFirestore {
  _FakeFirebaseFirestore_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAbstractPlayerRepository_4 extends _i3.SmartFake
    implements _i11.AbstractPlayerRepository {
  _FakeAbstractPlayerRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAbstractTeamRepository_5 extends _i3.SmartFake
    implements _i12.AbstractTeamRepository {
  _FakeAbstractTeamRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAbstractPlayerService_6 extends _i3.SmartFake
    implements _i13.AbstractPlayerService {
  _FakeAbstractPlayerService_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTeam_7 extends _i3.SmartFake implements _i14.Team {
  _FakeTeam_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ContreeBeloteScoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockContreeBeloteScoreService extends _i3.Mock
    implements _i15.ContreeBeloteScoreService {
  MockContreeBeloteScoreService() {
    _i3.throwOnMissingStub(this);
  }

  @override
  _i4.AbstractBeloteScoreRepository<_i16.ContreeBeloteScore>
      get beloteScoreRepository => (super.noSuchMethod(
            Invocation.getter(#beloteScoreRepository),
            returnValue:
                _FakeAbstractBeloteScoreRepository_0<_i16.ContreeBeloteScore>(
              this,
              Invocation.getter(#beloteScoreRepository),
            ),
          ) as _i4.AbstractBeloteScoreRepository<_i16.ContreeBeloteScore>);
  @override
  _i7.AbstractScoreRepository<_i16.ContreeBeloteScore> get scoreRepository =>
      (super.noSuchMethod(
        Invocation.getter(#scoreRepository),
        returnValue: _FakeAbstractScoreRepository_1<_i16.ContreeBeloteScore>(
          this,
          Invocation.getter(#scoreRepository),
        ),
      ) as _i7.AbstractScoreRepository<_i16.ContreeBeloteScore>);
  @override
  _i9.BaseRepository<_i5.Score<_i6.Round>> get repository =>
      (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBaseRepository_2<_i5.Score<_i6.Round>>(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i9.BaseRepository<_i5.Score<_i6.Round>>);
  @override
  _i17.Future<_i16.ContreeBeloteScore?> generateNewScore(String? gameId) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateNewScore,
          [gameId],
        ),
        returnValue: _i17.Future<_i16.ContreeBeloteScore?>.value(),
      ) as _i17.Future<_i16.ContreeBeloteScore?>);
  @override
  _i17.Future<_i16.ContreeBeloteScore?> getScoreByGame(String? gameId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScoreByGame,
          [gameId],
        ),
        returnValue: _i17.Future<_i16.ContreeBeloteScore?>.value(),
      ) as _i17.Future<_i16.ContreeBeloteScore?>);
  @override
  _i17.Stream<_i16.ContreeBeloteScore?> getScoreByGameStream(String? gameId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScoreByGameStream,
          [gameId],
        ),
        returnValue: _i17.Stream<_i16.ContreeBeloteScore?>.empty(),
      ) as _i17.Stream<_i16.ContreeBeloteScore?>);
  @override
  _i17.Future<void> deleteScoreByGame(String? gameId) => (super.noSuchMethod(
        Invocation.method(
          #deleteScoreByGame,
          [gameId],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  void resetLastPointedDocument() => super.noSuchMethod(
        Invocation.method(
          #resetLastPointedDocument,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i17.Future<_i5.Score<_i6.Round>?> get(String? id) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue: _i17.Future<_i5.Score<_i6.Round>?>.value(),
      ) as _i17.Future<_i5.Score<_i6.Round>?>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i5.Score<_i6.Round>? t) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [t],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<String> create(_i5.Score<_i6.Round>? t) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [t],
        ),
        returnValue: _i17.Future<String>.value(''),
      ) as _i17.Future<String>);
}

/// A class which mocks [ContreeBeloteGameRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockContreeBeloteGameRepository extends _i3.Mock
    implements _i18.ContreeBeloteGameRepository {
  MockContreeBeloteGameRepository() {
    _i3.throwOnMissingStub(this);
  }

  @override
  set lastFetchGameDocument(
          _i10.DocumentSnapshot<Object?>? _lastFetchGameDocument) =>
      super.noSuchMethod(
        Invocation.setter(
          #lastFetchGameDocument,
          _lastFetchGameDocument,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: '',
      ) as String);
  @override
  String get environment => (super.noSuchMethod(
        Invocation.getter(#environment),
        returnValue: '',
      ) as String);
  @override
  _i10.FirebaseFirestore get provider => (super.noSuchMethod(
        Invocation.getter(#provider),
        returnValue: _FakeFirebaseFirestore_3(
          this,
          Invocation.getter(#provider),
        ),
      ) as _i10.FirebaseFirestore);
  @override
  String get connectionString => (super.noSuchMethod(
        Invocation.getter(#connectionString),
        returnValue: '',
      ) as String);
  @override
  set connectionString(String? _connectionString) => super.noSuchMethod(
        Invocation.setter(
          #connectionString,
          _connectionString,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i17.Future<_i19.ContreeBelote?> get(String? id) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue: _i17.Future<_i19.ContreeBelote?>.value(),
      ) as _i17.Future<_i19.ContreeBelote?>);
  @override
  _i17.Future<List<_i19.ContreeBelote>> getAllGamesOfPlayer(
    String? playerId,
    int? pageSize,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllGamesOfPlayer,
          [
            playerId,
            pageSize,
          ],
        ),
        returnValue:
            _i17.Future<List<_i19.ContreeBelote>>.value(<_i19.ContreeBelote>[]),
      ) as _i17.Future<List<_i19.ContreeBelote>>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> updateField(
    String? id,
    String? fieldName,
    dynamic value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateField,
          [
            id,
            fieldName,
            value,
          ],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> partialUpdate(
    _i19.ContreeBelote? t,
    Map<String, dynamic>? partToUpdate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #partialUpdate,
          [
            t,
            partToUpdate,
          ],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i19.ContreeBelote? t) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [t],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<String> create(_i19.ContreeBelote? t) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [t],
        ),
        returnValue: _i17.Future<String>.value(''),
      ) as _i17.Future<String>);
}

/// A class which mocks [PlayerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlayerService extends _i3.Mock implements _i20.PlayerService {
  MockPlayerService() {
    _i3.throwOnMissingStub(this);
  }

  @override
  _i11.AbstractPlayerRepository get playerRepository => (super.noSuchMethod(
        Invocation.getter(#playerRepository),
        returnValue: _FakeAbstractPlayerRepository_4(
          this,
          Invocation.getter(#playerRepository),
        ),
      ) as _i11.AbstractPlayerRepository);
  @override
  _i9.BaseRepository<_i21.Player> get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBaseRepository_2<_i21.Player>(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i9.BaseRepository<_i21.Player>);
  @override
  _i17.Future<String> create(_i21.Player? t) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [t],
        ),
        returnValue: _i17.Future<String>.value(''),
      ) as _i17.Future<String>);
  @override
  _i17.Future<void> incrementPlayedGamesByOne(
    String? playerId,
    _i22.Game<_i23.Players, _i24.GameSetting>? game,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #incrementPlayedGamesByOne,
          [
            playerId,
            game,
          ],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> incrementWonGamesByOne(
    String? playerId,
    _i22.Game<_i23.Players, _i24.GameSetting>? game,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #incrementWonGamesByOne,
          [
            playerId,
            game,
          ],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<_i21.Player?> getPlayerOfUser(String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPlayerOfUser,
          [userId],
        ),
        returnValue: _i17.Future<_i21.Player?>.value(),
      ) as _i17.Future<_i21.Player?>);
  @override
  _i17.Future<List<_i21.Player>> searchPlayers({
    String? query = r'',
    _i21.Player? currentPlayer,
    bool? myPlayers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchPlayers,
          [],
          {
            #query: query,
            #currentPlayer: currentPlayer,
            #myPlayers: myPlayers,
          },
        ),
        returnValue: _i17.Future<List<_i21.Player>>.value(<_i21.Player>[]),
      ) as _i17.Future<List<_i21.Player>>);
  @override
  void resetLastPointedDocument() => super.noSuchMethod(
        Invocation.method(
          #resetLastPointedDocument,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i17.Future<_i21.Player?> get(String? id) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue: _i17.Future<_i21.Player?>.value(),
      ) as _i17.Future<_i21.Player?>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i21.Player? t) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [t],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
}

/// A class which mocks [TeamService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTeamService extends _i3.Mock implements _i25.TeamService {
  MockTeamService() {
    _i3.throwOnMissingStub(this);
  }

  @override
  _i12.AbstractTeamRepository get teamRepository => (super.noSuchMethod(
        Invocation.getter(#teamRepository),
        returnValue: _FakeAbstractTeamRepository_5(
          this,
          Invocation.getter(#teamRepository),
        ),
      ) as _i12.AbstractTeamRepository);
  @override
  _i13.AbstractPlayerService get playerService => (super.noSuchMethod(
        Invocation.getter(#playerService),
        returnValue: _FakeAbstractPlayerService_6(
          this,
          Invocation.getter(#playerService),
        ),
      ) as _i13.AbstractPlayerService);
  @override
  _i9.BaseRepository<_i14.Team> get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBaseRepository_2<_i14.Team>(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i9.BaseRepository<_i14.Team>);
  @override
  _i17.Future<_i14.Team> getTeamByPlayers(List<String?>? playerIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTeamByPlayers,
          [playerIds],
        ),
        returnValue: _i17.Future<_i14.Team>.value(_FakeTeam_7(
          this,
          Invocation.method(
            #getTeamByPlayers,
            [playerIds],
          ),
        )),
      ) as _i17.Future<_i14.Team>);
  @override
  _i17.Future<_i14.Team> incrementPlayedGamesByOne(
    String? id,
    _i22.Game<_i23.Players, _i24.GameSetting>? game,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #incrementPlayedGamesByOne,
          [
            id,
            game,
          ],
        ),
        returnValue: _i17.Future<_i14.Team>.value(_FakeTeam_7(
          this,
          Invocation.method(
            #incrementPlayedGamesByOne,
            [
              id,
              game,
            ],
          ),
        )),
      ) as _i17.Future<_i14.Team>);
  @override
  _i17.Future<_i14.Team> incrementWonGamesByOne(
    String? id,
    _i22.Game<_i23.Players, _i24.GameSetting>? game,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #incrementWonGamesByOne,
          [
            id,
            game,
          ],
        ),
        returnValue: _i17.Future<_i14.Team>.value(_FakeTeam_7(
          this,
          Invocation.method(
            #incrementWonGamesByOne,
            [
              id,
              game,
            ],
          ),
        )),
      ) as _i17.Future<_i14.Team>);
  @override
  _i17.Future<List<_i14.Team>> getAllTeamOfPlayer(
    String? playerId,
    int? pageSize,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllTeamOfPlayer,
          [
            playerId,
            pageSize,
          ],
        ),
        returnValue: _i17.Future<List<_i14.Team>>.value(<_i14.Team>[]),
      ) as _i17.Future<List<_i14.Team>>);
  @override
  void resetLastPointedDocument() => super.noSuchMethod(
        Invocation.method(
          #resetLastPointedDocument,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i17.Future<_i14.Team?> get(String? id) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue: _i17.Future<_i14.Team?>.value(),
      ) as _i17.Future<_i14.Team?>);
  @override
  _i17.Future<void> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<void> update(_i14.Team? t) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [t],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  _i17.Future<String> create(_i14.Team? t) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [t],
        ),
        returnValue: _i17.Future<String>.value(''),
      ) as _i17.Future<String>);
}
