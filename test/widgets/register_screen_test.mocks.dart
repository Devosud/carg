// Mocks generated by Mockito 5.3.2 from annotations
// in carg/test/widgets/register_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i10;

import 'package:carg/models/player.dart' as _i9;
import 'package:carg/services/auth/auth_service.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart' as _i6;
import 'package:firebase_dynamic_links_platform_interface/firebase_dynamic_links_platform_interface.dart'
    as _i3;
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
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
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseApp_0 extends _i1.SmartFake implements _i2.FirebaseApp {
  _FakeFirebaseApp_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUri_1 extends _i1.SmartFake implements Uri {
  _FakeUri_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeShortDynamicLink_2 extends _i1.SmartFake
    implements _i3.ShortDynamicLink {
  _FakeShortDynamicLink_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_3 extends _i1.SmartFake implements _i4.Widget {
  _FakeWidget_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [FirebaseDynamicLinks].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseDynamicLinks extends _i1.Mock
    implements _i6.FirebaseDynamicLinks {
  MockFirebaseDynamicLinks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(
        Invocation.getter(#app),
        returnValue: _FakeFirebaseApp_0(
          this,
          Invocation.getter(#app),
        ),
      ) as _i2.FirebaseApp);
  @override
  set app(_i2.FirebaseApp? _app) => super.noSuchMethod(
        Invocation.setter(
          #app,
          _app,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Stream<_i3.PendingDynamicLinkData> get onLink => (super.noSuchMethod(
        Invocation.getter(#onLink),
        returnValue: _i7.Stream<_i3.PendingDynamicLinkData>.empty(),
      ) as _i7.Stream<_i3.PendingDynamicLinkData>);
  @override
  Map<dynamic, dynamic> get pluginConstants => (super.noSuchMethod(
        Invocation.getter(#pluginConstants),
        returnValue: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);
  @override
  _i7.Future<_i3.PendingDynamicLinkData?> getInitialLink() =>
      (super.noSuchMethod(
        Invocation.method(
          #getInitialLink,
          [],
        ),
        returnValue: _i7.Future<_i3.PendingDynamicLinkData?>.value(),
      ) as _i7.Future<_i3.PendingDynamicLinkData?>);
  @override
  _i7.Future<_i3.PendingDynamicLinkData?> getDynamicLink(Uri? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDynamicLink,
          [url],
        ),
        returnValue: _i7.Future<_i3.PendingDynamicLinkData?>.value(),
      ) as _i7.Future<_i3.PendingDynamicLinkData?>);
  @override
  _i7.Future<Uri> buildLink(_i3.DynamicLinkParameters? parameters) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildLink,
          [parameters],
        ),
        returnValue: _i7.Future<Uri>.value(_FakeUri_1(
          this,
          Invocation.method(
            #buildLink,
            [parameters],
          ),
        )),
      ) as _i7.Future<Uri>);
  @override
  _i7.Future<_i3.ShortDynamicLink> buildShortLink(
    _i3.DynamicLinkParameters? parameters, {
    _i3.ShortDynamicLinkType? shortLinkType = _i3.ShortDynamicLinkType.short,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildShortLink,
          [parameters],
          {#shortLinkType: shortLinkType},
        ),
        returnValue:
            _i7.Future<_i3.ShortDynamicLink>.value(_FakeShortDynamicLink_2(
          this,
          Invocation.method(
            #buildShortLink,
            [parameters],
            {#shortLinkType: shortLinkType},
          ),
        )),
      ) as _i7.Future<_i3.ShortDynamicLink>);
}

/// A class which mocks [PendingDynamicLinkData].
///
/// See the documentation for Mockito's code generation for more information.
class MockPendingDynamicLinkData extends _i1.Mock
    implements _i3.PendingDynamicLinkData {
  MockPendingDynamicLinkData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Uri get link => (super.noSuchMethod(
        Invocation.getter(#link),
        returnValue: _FakeUri_1(
          this,
          Invocation.getter(#link),
        ),
      ) as Uri);
  @override
  Map<String, String?> get utmParameters => (super.noSuchMethod(
        Invocation.getter(#utmParameters),
        returnValue: <String, String?>{},
      ) as Map<String, String?>);
  @override
  Map<String, dynamic> asMap() => (super.noSuchMethod(
        Invocation.method(
          #asMap,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i8.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isAuth => (super.noSuchMethod(
        Invocation.getter(#isAuth),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i7.Future<String> googleLogIn() => (super.noSuchMethod(
        Invocation.method(
          #googleLogIn,
          [],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<void> sendSignInWithEmailLink(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendSignInWithEmailLink,
          [email],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<String> signInWithEmailLink(
    String? email,
    String? link,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailLink,
          [
            email,
            link,
          ],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> validatePhoneNumber(
    String? smsCode,
    String? verificationId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #validatePhoneNumber,
          [
            smsCode,
            verificationId,
          ],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<dynamic> changePhoneNumber(
    String? smsCode,
    String? verificationId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePhoneNumber,
          [
            smsCode,
            verificationId,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> resendPhoneVerificationCode(
    String? phoneNumber,
    _i4.BuildContext? context,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #resendPhoneVerificationCode,
          [
            phoneNumber,
            context,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> sendPhoneVerificationCode(
    String? phoneNumber,
    _i4.BuildContext? context,
    _i8.CredentialVerificationType? credentialVerificationType,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendPhoneVerificationCode,
          [
            phoneNumber,
            context,
            credentialVerificationType,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<bool> isAlreadyLogin() => (super.noSuchMethod(
        Invocation.method(
          #isAlreadyLogin,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<void> signOut(_i4.BuildContext? context) => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [context],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> changeEmail(String? newEmail) => (super.noSuchMethod(
        Invocation.method(
          #changeEmail,
          [newEmail],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i4.Widget getCorrectLandingScreen() => (super.noSuchMethod(
        Invocation.method(
          #getCorrectLandingScreen,
          [],
        ),
        returnValue: _FakeWidget_3(
          this,
          Invocation.method(
            #getCorrectLandingScreen,
            [],
          ),
        ),
      ) as _i4.Widget);
  @override
  void setCurrentPlayer(_i9.Player? player) => super.noSuchMethod(
        Invocation.method(
          #setCurrentPlayer,
          [player],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<bool> isAdFreeUser() => (super.noSuchMethod(
        Invocation.method(
          #isAdFreeUser,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
