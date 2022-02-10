import 'package:carg/models/score/misc/belote_team_enum.dart';
import 'package:carg/models/score/round/belote_round.dart';
import 'package:carg/styles/text_style.dart';
import 'package:carg/views/screens/add_round/widget/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TrickPointsBeloteWidget extends StatefulWidget {
  final BeloteRound round;

  const TrickPointsBeloteWidget({Key? key, required this.round})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TrickPointsBeloteWidgetState();
  }
}

class _TrickPointsBeloteWidgetState extends State<TrickPointsBeloteWidget> {
  final TextEditingController _usPointsTextController = TextEditingController();
  final TextEditingController _themPointsTextController =
      TextEditingController();

  @override
  void initState() {
    _usPointsTextController.text = widget.round.usTrickScore.toString();
    _themPointsTextController.text = widget.round.themTrickScore.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.round,
      child: Consumer<BeloteRound>(
          builder: (context, roundData, child) => Column(children: [
                const SectionTitleWidget(title: 'Points des plis'),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(children: <Widget>[
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Nous',
                                style: CustomTextStyle.boldAndItalic(context)),
                            Text('Eux',
                                style: CustomTextStyle.boldAndItalic(context))
                          ]),
                      Row(children: <Widget>[
                        Flexible(
                            child: TextField(
                                controller: _usPointsTextController,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: const <TextInputFormatter>[],
                                onSubmitted: (String value) => {
                                      roundData.usTrickScore = int.parse(value),
                                      roundData.themTrickScore =
                                          (BeloteRound.totalTrickScore -
                                              int.parse(value)),
                                      _themPointsTextController.text =
                                          (BeloteRound.totalTrickScore -
                                                  int.parse(value))
                                              .toString(),
                                    },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).hintColor),
                                    labelText: 'Points'))),
                        const SizedBox(width: 20),
                        Flexible(
                            child: TextField(
                                controller: _themPointsTextController,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: const <TextInputFormatter>[],
                                onSubmitted: (String value) => {
                                      roundData.themTrickScore =
                                          int.parse(value),
                                      roundData.usTrickScore =
                                          (BeloteRound.totalTrickScore -
                                              int.parse(value)),
                                      _usPointsTextController.text =
                                          (BeloteRound.totalTrickScore -
                                                  int.parse(value))
                                              .toString(),
                                    },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).hintColor),
                                    labelText: 'Points')))
                      ]),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _BeloteRebeloteDixDeDerWidget(
                                round: roundData, team: BeloteTeamEnum.US),
                            _BeloteRebeloteDixDeDerWidget(
                                round: roundData, team: BeloteTeamEnum.THEM)
                          ])
                    ]))
              ])),
    );
  }
}

class _BeloteRebeloteDixDeDerWidget extends StatelessWidget {
  final BeloteRound? round;
  final BeloteTeamEnum? team;

  const _BeloteRebeloteDixDeDerWidget({this.round, this.team});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
          textDirection:
              team == BeloteTeamEnum.US ? TextDirection.ltr : TextDirection.rtl,
          children: <Widget>[
            const Text('Belote-Rebelote'),
            Checkbox(
                visualDensity: VisualDensity.compact,
                value: round!.beloteRebelote == team,
                onChanged: (bool? value) {
                  if (value!) {
                    round!.beloteRebelote = team;
                  } else {
                    round!.beloteRebelote = null;
                  }
                })
          ]),
      Row(
          textDirection:
              team == BeloteTeamEnum.US ? TextDirection.ltr : TextDirection.rtl,
          children: <Widget>[
            const Text('Dix de Der'),
            Radio(
                visualDensity: VisualDensity.compact,
                value: team == BeloteTeamEnum.US,
                onChanged: (bool? value) {
                  round!.dixDeDer = team!;
                },
                groupValue: round!.dixDeDer == BeloteTeamEnum.US)
          ])
    ]);
  }
}
