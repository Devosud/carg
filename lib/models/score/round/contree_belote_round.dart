import 'package:carg/models/score/misc/belote_team_enum.dart';
import 'package:carg/models/score/misc/card_color.dart';
import 'package:carg/models/score/misc/contree_belote_contract_name.dart';
import 'package:carg/models/score/round/belote_round.dart';
import 'package:enum_to_string/enum_to_string.dart';

class ContreeBeloteRound extends BeloteRound {
  late int _contract;
  late ContreeBeloteContractName _contractName;

  ContreeBeloteRound(
      {index,
      cardColor,
      contract,
      contractFulfilled,
      dixDeDer,
      beloteRebelote,
      taker,
      takerScore,
      defenderScore,
      usTrickScore,
      themTrickScore,
      contractName,
      defender})
      : super(
            index: index,
            cardColor: cardColor,
            contractFulfilled: contractFulfilled,
            dixDeDer: dixDeDer,
            beloteRebelote: beloteRebelote,
            taker: taker,
            takerScore: takerScore,
            defenderScore: defenderScore,
            usTrickScore: usTrickScore,
            themTrickScore: themTrickScore,
            defender: defender) {
    _contract = contract ?? 0;
    _contractName = contractName ?? ContreeBeloteContractName.NORMAL;
  }

  @override
  bool get contractFulfilled =>
      getTrickPointsOfTeam(taker) +
              getDixDeDerOfTeam(taker, 0) +
              getBeloteRebeloteOfTeam(taker) >=
          contract &&
      (getTrickPointsOfTeam(taker) +
              getDixDeDerOfTeam(taker, 0) +
              getBeloteRebeloteOfTeam(taker) >
          getTrickPointsOfTeam(defender) +
              getDixDeDerOfTeam(defender, 0) +
              getBeloteRebeloteOfTeam(defender));

  ContreeBeloteContractName get contractName => _contractName;

  set contractName(ContreeBeloteContractName value) {
    _contractName = value;
    computeRound();
  }

  int get contract => _contract;

  set contract(int value) {
    _contract = value;
    computeRound();
  }

  @override
  void computeRound() {
    var takerTrickPoints = getTrickPointsOfTeam(taker);
    var defenderTrickPoints = getTrickPointsOfTeam(defender);
    if (contractFulfilled) {
      var takerScoreTmp = takerTrickPoints +
          getDixDeDerOfTeam(taker, takerTrickPoints) +
          getBeloteRebeloteOfTeam(taker);
      takerScore = roundScore(contractName.bonus(contract + takerScoreTmp));
      defenderScore = roundScore(defenderTrickPoints +
          getDixDeDerOfTeam(defender, defenderTrickPoints) +
          getBeloteRebeloteOfTeam(defender));
    } else {
      var defenderScoreTmp = BeloteRound.totalTrickScore +
          BeloteRound.dixDeDerBonus +
          getBeloteRebeloteOfTeam(defender) +
          getDixDeDerOfTeam(defender, defenderTrickPoints);
      takerScore = roundScore(getBeloteRebeloteOfTeam(taker) +
          getDixDeDerOfTeam(taker, takerTrickPoints));
      defenderScore =
          roundScore(contractName.bonus(contract + defenderScoreTmp));
    }
    notifyListeners();
  }

  @override
  int getTrickPointsOfTeam(BeloteTeamEnum? team) {
    switch (team) {
      case BeloteTeamEnum.US:
        return usTrickScore;
      case BeloteTeamEnum.THEM:
        return themTrickScore;
      case null:
        return 0;
    }
  }

  @override
  Map<String, dynamic> toJSON() {
    var tmpJSON = super.toJSON();
    tmpJSON.addAll({
      'contract': contract,
      'contract_name': EnumToString.convertToString(contractName)
    });
    return tmpJSON;
  }

  factory ContreeBeloteRound.fromJSON(Map<String, dynamic> json) {
    return ContreeBeloteRound(
        index: json['index'],
        cardColor:
            EnumToString.fromString(CardColor.values, json['card_color']),
        dixDeDer:
            EnumToString.fromString(BeloteTeamEnum.values, json['dix_de_der']),
        beloteRebelote: EnumToString.fromString(
            BeloteTeamEnum.values, json['belote_rebelote'] ?? ''),
        contract: json['contract'],
        contractFulfilled: json['contract_fulfilled'],
        taker: EnumToString.fromString(BeloteTeamEnum.values, json['taker']),
        defender:
            EnumToString.fromString(BeloteTeamEnum.values, json['defender']),
        takerScore: json['taker_score'],
        defenderScore: json['defender_score'],
        usTrickScore: json['us_trick_score'],
        themTrickScore: json['them_trick_score'],
        contractName: EnumToString.fromString(
            ContreeBeloteContractName.values, json['contract_name']));
  }

  static List<ContreeBeloteRound> fromJSONList(List<dynamic> jsonList) {
    return jsonList.map((json) => ContreeBeloteRound.fromJSON(json)).toList();
  }

  @override
  String toString() {
    return 'ContreeBeloteRound{ '
        'index: $index, '
        'cardColor: $cardColor, '
        'contract: $contract, '
        'beloteRebelote : $beloteRebelote, '
        'dixDeDer: $dixDeDer, '
        'contractFulfilled: $contractFulfilled, '
        'taker: $taker, '
        'takerScore: $takerScore, '
        'defenderScore: $defenderScore, '
        'usTrickScore: $usTrickScore, '
        'themTrickScore: $themTrickScore, '
        'contractName: $contractName, '
        'defender: $defender}';
  }
}
