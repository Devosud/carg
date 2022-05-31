// Mocks generated by Mockito 5.2.0 from annotations
// in carg/test/units/services/round/tarot/tarot_round_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;

import 'package:carg/models/carg_object.dart' as _i6;
import 'package:carg/models/score/round/round.dart' as _i4;
import 'package:carg/models/score/score.dart' as _i3;
import 'package:carg/models/score/tarot_score.dart' as _i9;
import 'package:carg/repositories/base_repository.dart' as _i7;
import 'package:carg/repositories/score/abstract_score_repository.dart' as _i5;
import 'package:carg/repositories/score/abstract_tarot_score_repository.dart'
    as _i2;
import 'package:carg/services/impl/score/tarot_score_service.dart' as _i8;
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

class _FakeAbstractTarotScoreRepository_0 extends _i1.Fake
    implements _i2.AbstractTarotScoreRepository {}

class _FakeAbstractScoreRepository_1<T extends _i3.Score<_i4.Round>>
    extends _i1.Fake implements _i5.AbstractScoreRepository<T> {}

class _FakeBaseRepository_2<T extends _i6.CargObject> extends _i1.Fake
    implements _i7.BaseRepository<T> {}

/// A class which mocks [TarotScoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTarotScoreService extends _i1.Mock implements _i8.TarotScoreService {
  MockTarotScoreService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AbstractTarotScoreRepository get tarotScoreRepository =>
      (super.noSuchMethod(Invocation.getter(#tarotScoreRepository),
              returnValue: _FakeAbstractTarotScoreRepository_0())
          as _i2.AbstractTarotScoreRepository);
  @override
  _i5.AbstractScoreRepository<_i9.TarotScore> get scoreRepository =>
      (super.noSuchMethod(Invocation.getter(#scoreRepository),
              returnValue: _FakeAbstractScoreRepository_1<_i9.TarotScore>())
          as _i5.AbstractScoreRepository<_i9.TarotScore>);
  @override
  _i7.BaseRepository<_i3.Score<_i4.Round>> get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeBaseRepository_2<_i3.Score<_i4.Round>>())
          as _i7.BaseRepository<_i3.Score<_i4.Round>>);
  @override
  _i10.Future<_i9.TarotScore?> getScoreByGame(String? gameId) =>
      (super.noSuchMethod(Invocation.method(#getScoreByGame, [gameId]),
              returnValue: Future<_i9.TarotScore?>.value())
          as _i10.Future<_i9.TarotScore?>);
  @override
  _i10.Stream<_i9.TarotScore?> getScoreByGameStream(String? gameId) =>
      (super.noSuchMethod(Invocation.method(#getScoreByGameStream, [gameId]),
              returnValue: Stream<_i9.TarotScore?>.empty())
          as _i10.Stream<_i9.TarotScore?>);
  @override
  _i10.Future<void> deleteScoreByGame(String? gameId) => (super.noSuchMethod(
      Invocation.method(#deleteScoreByGame, [gameId]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i10.Future<void>);
  @override
  void resetLastPointedDocument() =>
      super.noSuchMethod(Invocation.method(#resetLastPointedDocument, []),
          returnValueForMissingStub: null);
  @override
  _i10.Future<_i3.Score<_i4.Round>?> get(String? id) =>
      (super.noSuchMethod(Invocation.method(#get, [id]),
              returnValue: Future<_i3.Score<_i4.Round>?>.value())
          as _i10.Future<_i3.Score<_i4.Round>?>);
  @override
  _i10.Future<void> delete(String? id) => (super.noSuchMethod(
      Invocation.method(#delete, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> update(_i3.Score<_i4.Round>? t) => (super.noSuchMethod(
      Invocation.method(#update, [t]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i10.Future<void>);
  @override
  _i10.Future<String> create(_i3.Score<_i4.Round>? t) =>
      (super.noSuchMethod(Invocation.method(#create, [t]),
          returnValue: Future<String>.value('')) as _i10.Future<String>);
}
