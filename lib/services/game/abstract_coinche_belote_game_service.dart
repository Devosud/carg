import 'package:carg/models/game/coinche_belote.dart';
import 'package:carg/models/score/coinche_belote_score.dart';
import 'package:carg/repositories/game/abstract_coinche_belote_game_repository.dart';
import 'package:carg/services/game/abstract_belote_game_service.dart';
import 'package:carg/services/score/abstract_coinche_belote_score_service.dart';
import 'package:carg/services/team/abstract_team_service.dart';

abstract class AbstractCoincheBeloteGameService
    extends AbstractBeloteGameService<CoincheBelote, CoincheBeloteScore> {
  AbstractCoincheBeloteGameService(
      {required AbstractCoincheBeloteGameRepository coincheBeloteGameRepository,
      required AbstractCoincheBeloteScoreService coincheBeloteScoreService,
      required AbstractTeamService teamService})
      : super(
            beloteGameRepository: coincheBeloteGameRepository,
            beloteScoreService: coincheBeloteScoreService,
            teamService: teamService);
}
