import 'package:carg/models/score/misc/tarot_contract.dart';
import 'package:carg/models/score/round/tarot_round.dart';
import 'package:carg/views/screens/add_round/widget/section_title_widget.dart';
import 'package:flutter/material.dart';

class ContractTarotWidget extends StatelessWidget {
  final TarotRound round;

  const ContractTarotWidget({this.round});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitleWidget(title: 'Contrat'),
        DropdownButton<TarotContract>(
            value: round.contract,
            items: TarotContract.values.map((TarotContract value) {
              return DropdownMenuItem<TarotContract>(
                value: value,
                child: Text(
                    value.name + ' (x' + value.multiplayer.toString() + ')'),
              );
            }).toList(),
            onChanged: (TarotContract val) {
              round.contract = val;
            }),
      ],
    );
  }
}
