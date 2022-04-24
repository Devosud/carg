import 'package:carg/exceptions/service_exception.dart';
import 'package:carg/models/game/game.dart';
import 'package:carg/models/player.dart';
import 'package:carg/models/players/players.dart';
import 'package:carg/models/score/round/round.dart';
import 'package:carg/models/score/score.dart';
import 'package:carg/repositories/game/abstract_game_repository.dart';
import 'package:carg/services/game/abstract_game_service.dart';
import 'package:carg/services/impl/player_service.dart';
import 'package:carg/services/impl/team_service.dart';
import 'package:carg/services/player/abstract_player_service.dart';
import 'package:carg/services/score/abstract_score_service.dart';
import 'package:carg/services/team/abstract_team_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'abstract_game_service_test.mocks.dart';

class FakePlayers extends Players {
  FakePlayers(List<String> players) : super(playerList: players);

  @override
  String getSelectedPlayersStatus() {
    throw UnimplementedError();
  }

  @override
  bool isFull() {
    throw UnimplementedError();
  }

  @override
  void onSelectedPlayer(Player player) {}

  @override
  void reset() {}
}

class FakeGame extends Game {
  FakeGame(String? id, DateTime startingDate, Players players)
      : super(players: players, id: id, startingDate: startingDate);
}

class FakeScore extends Score {
  FakeScore(String? id) : super(id: id);

  @override
  Score<Round> deleteLastRound() {
    throw UnimplementedError();
  }

  @override
  Round getLastRound() {
    throw UnimplementedError();
  }

  @override
  Score<Round> replaceLastRound(Round round) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJSON() {
    throw UnimplementedError();
  }
}

class FakeGameService extends AbstractGameService {
  FakeGameService(
      {required AbstractScoreService<Score<Round>> scoreService,
      required AbstractGameRepository<Game<Players>> gameRepository,
      required AbstractPlayerService playerService,
      required AbstractTeamService teamService})
      : super(
            scoreService: scoreService,
            gameRepository: gameRepository,
            playerService: playerService,
            teamService: teamService);

  @override
  Future<Game<Players>> createGameWithPlayerList(
      List<String?> playerListForOrder,
      List<String?> playerListForTeam,
      DateTime? startingDate) {
    throw UnimplementedError();
  }

  @override
  Future<void> endAGame(Game<Players> game, DateTime? endingDate) {
    throw UnimplementedError();
  }
}

@GenerateMocks(
    [AbstractScoreService, AbstractGameRepository, PlayerService, TeamService])
void main() {
  final mockScoreService = MockAbstractScoreService();
  final mockGameRepository = MockAbstractGameRepository();
  final mockPlayerService = MockPlayerService();
  final mockTeamService = MockTeamService();

  const uid = '123';

  final date = DateTime.parse('2022-04-10 00:00:00.000');
  final playerIds = ['p1', 'p2', 'p3', 'p4'];
  final players = FakePlayers(playerIds);
  final game = FakeGame(uid, date, players);

  group('AbstractGameService', () {
    group('Get Game', () {
      test('OK', () async {
        when(mockGameRepository.get(uid)).thenAnswer((_) => Future(() => game));
        final gameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        final finalGames = await gameService.getGame(uid);
        expect(finalGames, game);
      });

      test('NOK - Exception', () async {
        final gameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        expect(gameService.get(null), throwsA(isA<ServiceException>()));
      });
    });

    group('Delete Game', () {
      test('OK', () async {
        final gameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        await gameService.deleteGame(uid);
        verify(mockGameRepository.delete(uid)).called(1);
        verify(mockScoreService.deleteScoreByGame(uid)).called(1);
      });
      test('NOK - Exception', () async {
        final gameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        expect(gameService.deleteGame(null), throwsA(isA<ServiceException>()));
      });
    });

    group('Get All Games Of Player Paginated', () {
      test('OK', () async {
        const userID = 'user_123';
        const pageSize = 10;
        when(mockGameRepository.getAllGamesOfPlayer(userID, pageSize))
            .thenAnswer((_) => Future(() => [game]));
        final beloteGameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        final finalGames = await beloteGameService.getAllGamesOfPlayerPaginated(
            userID, pageSize);
        expect(finalGames, [game]);
      });

      test('NOK - No userID', () async {
        const pageSize = 10;
        final beloteGameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        expect(beloteGameService.getAllGamesOfPlayerPaginated(null, pageSize),
            throwsA(isA<ServiceException>()));
      });

      test('NOK - No page size', () async {
        const userID = 'user_123';
        final beloteGameService = FakeGameService(
            scoreService: mockScoreService,
            gameRepository: mockGameRepository,
            playerService: mockPlayerService,
            teamService: mockTeamService);
        expect(beloteGameService.getAllGamesOfPlayerPaginated(userID, null),
            throwsA(isA<ServiceException>()));
      });
    });
  });
}
