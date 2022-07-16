import 'package:carg/models/score/misc/card_color.dart';
import 'package:carg/models/score/round/belote_round.dart';
import 'package:flutter/material.dart';

class CardColorPickerWidget extends StatelessWidget {
  final BeloteRound? beloteRound;

  const CardColorPickerWidget({Key? key, required this.beloteRound})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('cardColorPickerWidget'),
      children: [
        Text(
          "Couleur (${beloteRound?.cardColor.name})",
          key: const ValueKey('cardColorPickerTitle'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                children: CardColor.values
                    .map((cardColor) => InputChip(
                        key: ValueKey('cardColorInputChip-${cardColor.name}'),
                        checkmarkColor: Theme.of(context).cardColor,
                        selected: beloteRound?.cardColor == cardColor,
                        selectedColor: Theme.of(context).primaryColor,
                        onPressed: () => {beloteRound?.cardColor = cardColor},
                        label: Text(cardColor.symbol,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).cardColor),
                            overflow: TextOverflow.ellipsis)))
                    .toList()
                    .cast<Widget>(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
