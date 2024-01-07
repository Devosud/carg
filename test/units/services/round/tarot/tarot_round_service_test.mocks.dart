// Mocks generated by Mockito 5.4.4 from annotations
// in carg/test/units/services/round/tarot/tarot_round_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:carg/models/carg_object.dart' as _i7;
import 'package:carg/models/game/setting/game_setting.dart' as _i5;
import 'package:carg/models/score/round/round.dart' as _i4;
import 'package:carg/models/score/score.dart' as _i3;
import 'package:carg/models/score/tarot_score.dart' as _i10;
import 'package:carg/repositories/base_repository.dart' as _i8;
import 'package:carg/repositories/score/abstract_score_repository.dart' as _i6;
import 'package:carg/repositories/score/abstract_tarot_score_repository.dart'
    as _i2;
import 'package:carg/services/impl/score/tarot_score_service.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAbstractTarotScoreRepository_0 extends _i1.SmartFake
    implements _i2.AbstractTarotScoreRepository {
  _FakeAbstractTarotScoreRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAbstractScoreRepository_1<
        T extends _i3.Score<_i4.Round<_i5.GameSetting>>> extends _i1.SmartFake
    implements _i6.AbstractScoreRepository<T> {
  _FakeAbstractScoreRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseRepository_2<T extends _i7.CargObject> extends _i1.SmartFake
    implements _i8.BaseRepository<T> {
  _FakeBaseRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TarotScoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTarotScoreService extends _i1.Mock implements _i9.TarotScoreService {
  MockTarotScoreService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AbstractTarotScoreRepository get tarotScoreRepository =>
      (super.noSuchMethod(
        Invocation.getter(#tarotScoreRepository),
        returnValue: _FakeAbstractTarotScoreRepository_0(
          this,
          Invocation.getter(#tarotScoreRepository),
        ),
      ) as _i2.AbstractTarotScoreRepository);

  @override
  _i6.AbstractScoreRepository<_i10.TarotScore> get scoreRepository =>
      (super.noSuchMethod(
        Invocation.getter(#scoreRepository),
        returnValue: _FakeAbstractScoreRepository_1<_i10.TarotScore>(
          this,
          Invocation.getter(#scoreRepository),
        ),
      ) as _i6.AbstractScoreRepository<_i10.TarotScore>);

  @override
  _i8.BaseRepository<_i3.Score<_i4.Round<_i5.GameSetting>>> get repository =>
      (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue:
            _FakeBaseRepository_2<_i3.Score<_i4.Round<_i5.GameSetting>>>(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i8.BaseRepository<_i3.Score<_i4.Round<_i5.GameSetting>>>);

  @override
  _i11.Future<_i10.TarotScore?> getScoreByGame(String? gameId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScoreByGame,
          [gameId],
        ),
        returnValue: _i11.Future<_i10.TarotScore?>.value(),
      ) as _i11.Future<_i10.TarotScore?>);

  @override
  _i11.Stream<_i10.TarotScore?> getScoreByGameStream(String? gameId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScoreByGameStream,
          [gameId],
        ),
        returnValue: _i11.Stream<_i10.TarotScore?>.empty(),
      ) as _i11.Stream<_i10.TarotScore?>);

  @override
  _i11.Future<void> deleteScoreByGame(String? gameId) => (super.noSuchMethod(
        Invocation.method(
          #deleteScoreByGame,
          [gameId],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void resetLastPointedDocument() => super.noSuchMethod(
        Invocation.method(
          #resetLastPointedDocument,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i3.Score<_i4.Round<_i5.GameSetting>>?> get(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue:
            _i11.Future<_i3.Score<_i4.Round<_i5.GameSetting>>?>.value(),
      ) as _i11.Future<_i3.Score<_i4.Round<_i5.GameSetting>>?>);

  @override
  _i11.Future<void> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> update(_i3.Score<_i4.Round<_i5.GameSetting>>? t) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [t],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<String> create(_i3.Score<_i4.Round<_i5.GameSetting>>? t) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [t],
        ),
        returnValue: _i11.Future<String>.value(_i12.dummyValue<String>(
          this,
          Invocation.method(
            #create,
            [t],
          ),
        )),
      ) as _i11.Future<String>);
}
