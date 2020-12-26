import 'package:carg/models/score/misc/card_color.dart';
import 'package:carg/models/score/misc/team_game_enum.dart';
import 'package:carg/models/score/round/team_game_round.dart';
import 'package:enum_to_string/enum_to_string.dart';

class BeloteRound extends TeamGameRound {
  BeloteRound(
      {index,
      cardColor,
      contractFulfilled,
      dixDeDer,
      beloteRebelote,
      taker,
      defender,
      takerScore,
      defenderScore,
      usTrickScore,
      themTrickScore})
      : super(
            index: index,
            cardColor: cardColor,
            contractFulfilled: contractFulfilled,
            dixDeDer: dixDeDer,
            beloteRebelote: beloteRebelote,
            taker: taker,
            defender: defender,
            takerScore: takerScore,
            defenderScore: defenderScore,
            usTrickScore: usTrickScore,
            themTrickScore: themTrickScore);

  @override
  void computeRound() {
    if (isContractFulfilled()) {
      takerScore = getPointsOfTeam(taker) + getBeloteRebeloteOfTeam(taker);
      defenderScore =
          getPointsOfTeam(defender) + getBeloteRebeloteOfTeam(defender);
    } else {
      takerScore = getBeloteRebeloteOfTeam(taker);
      defenderScore =
          TeamGameRound.totalScore + getBeloteRebeloteOfTeam(defender);
    }
    notifyListeners();
  }

  @override
  bool isContractFulfilled() {
    contractFulfilled = (beloteRebelote != null)
        ? getPointsOfTeam(taker) > 80
        : getPointsOfTeam(taker) > 90;
    return contractFulfilled;
  }

  @override
  Map<String, dynamic> toJSON() {
    return super.toJSON();
  }

  factory BeloteRound.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return BeloteRound(
        index: json['index'],
        cardColor:
            EnumToString.fromString(CardColor.values, json['card_color']),
        dixDeDer:
            EnumToString.fromString(TeamGameEnum.values, json['dix_de_der']),
        beloteRebelote: EnumToString.fromString(
            TeamGameEnum.values, json['belote_rebelote']),
        contractFulfilled: json['contract_fulfilled'],
        taker: EnumToString.fromString(TeamGameEnum.values, json['taker']),
        defender: EnumToString.fromString(TeamGameEnum.values, json['defender']),
        takerScore: json['taker_score'],
        defenderScore: json['defender_score'],
        usTrickScore: json['us_trick_score'],
        themTrickScore: json['them_trick_score']);
  }

  static List<BeloteRound> fromJSONList(List<dynamic> jsonList) {
    return jsonList.map((json) => BeloteRound.fromJSON(json)).toList();
  }

  @override
  String toString() {
    return 'BeloteRound{ '
        'index: $index, '
        'cardColor: $cardColor, '
        'dixDeDer: $dixDeDer, '
        'beloteRebelote: $beloteRebelote, '
        'contractFulfilled: $contractFulfilled, '
        'taker: $taker, '
        'defender: $defender, '
        'takerScore: $takerScore, '
        'defenderScore: $defenderScore, '
        'usTrickScore: $usTrickScore, '
        'themTrickScore: $themTrickScore}';
  }
}
