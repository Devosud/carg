import 'package:carg/models/player.dart';
import 'package:carg/services/auth_service.dart';
import 'package:carg/services/player_service.dart';
import 'package:carg/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import 'settings_screen_test.mocks.dart';

Widget testableWidget(AuthService mockAuthService, PlayerService playerService,
        Player mockPlayer) =>
    MaterialApp(
      home: ChangeNotifierProvider<AuthService>.value(
          value: mockAuthService,
          child:
              SettingsScreen(player: mockPlayer, playerService: playerService)),
    );

@GenerateMocks([PlayerService, AuthService])
void main() {
  late MockAuthService authService;
  late MockPlayerService mockPlayerService;
  late Player mockPlayer;

  final emailAddress = 'test@test.com';
  final telephoneNumber = '+100000000';

  setUp(() {
    authService = MockAuthService();
    mockPlayerService = MockPlayerService();
    mockPlayer = Player(owned: false, userName: 'toto');
    when(authService.getConnectedUserEmail()).thenReturn(emailAddress);
    when(authService.getConnectedUserPhoneNumber()).thenReturn(telephoneNumber);
  });

  testWidgets('Display the correct username', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(
        testableWidget(authService, mockPlayerService, mockPlayer)));
    expect(
        tester
            .widget<TextFormField>(find.byKey(ValueKey('usernameTextField')))
            .initialValue,
        'toto');
  });

  testWidgets('Display the correct profile picture URL',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(
        testableWidget(authService, mockPlayerService, mockPlayer)));
    expect(
        tester
            .widget<TextFormField>(find.byKey(ValueKey('imageURLTextField')))
            .initialValue,
        Player.defaultProfilePicture);
  });

  group('URL TextField', () {
    testWidgets('is enabled', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
          testableWidget(authService, mockPlayerService, mockPlayer)));
      expect(
          tester
              .widget<TextFormField>(find.byKey(ValueKey('imageURLTextField')))
              .enabled,
          true);
    });

    testWidgets('is disabled', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
          testableWidget(authService, mockPlayerService, mockPlayer)));
      when(mockPlayerService.updatePlayer(mockPlayer))
          .thenAnswer((_) async => Future.value(''));

      await tester.tap(find.byKey(ValueKey('gravatarSwitchTile')));
      await tester.pump();

      expect(
          tester
              .widget<TextFormField>(find.byKey(ValueKey('imageURLTextField')))
              .enabled,
          false);
    });
  });

  group('Account', () {
    testWidgets('Display the email address', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
          testableWidget(authService, mockPlayerService, mockPlayer)));
      expect(tester.widget<Text>(find.byKey(ValueKey('emailText'))).data,
          emailAddress);
    });

    testWidgets('Display the email address', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
          testableWidget(authService, mockPlayerService, mockPlayer)));
      expect(tester.widget<Text>(find.byKey(ValueKey('phoneText'))).data,
          telephoneNumber);
    });

    testWidgets('No email address', (WidgetTester tester) async {
      when(authService.getConnectedUserEmail()).thenReturn(null);
      await mockNetworkImagesFor(() => tester.pumpWidget(
          testableWidget(authService, mockPlayerService, mockPlayer)));
      expect(tester.widget<Text>(find.byKey(ValueKey('emailText'))).data,
          "Pas d'email renseigné'");
    });

    testWidgets('No phone number', (WidgetTester tester) async {
      when(authService.getConnectedUserPhoneNumber()).thenReturn(null);
      await mockNetworkImagesFor(() => tester.pumpWidget(
          testableWidget(authService, mockPlayerService, mockPlayer)));
      expect(tester.widget<Text>(find.byKey(ValueKey('phoneText'))).data,
          'Pas de numéro renseigné');
    });
  });
}
