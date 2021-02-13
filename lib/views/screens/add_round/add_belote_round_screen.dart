import 'package:carg/models/game/team_game.dart';
import 'package:carg/models/score/round/belote_round.dart';
import 'package:carg/models/score/round/coinche_belote_round.dart';
import 'package:carg/views/screens/add_round/widget/real_time_display_widget.dart';
import 'package:carg/views/screens/add_round/widget/screen_title_widget.dart';
import 'package:carg/views/screens/add_round/widget/team_game/contract_belote_widget.dart';
import 'package:carg/views/screens/add_round/widget/team_game/contract_coinche_widget.dart';
import 'package:carg/views/screens/add_round/widget/team_game/taker_team_widget.dart';
import 'package:carg/views/screens/add_round/widget/team_game/trick_points_belote_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class AddBeloteRoundScreen extends StatelessWidget {
  final Belote teamGame;
  final BeloteRound teamGameRound;
  final bool isEditing;

  const AddBeloteRoundScreen(
      {this.teamGame, this.teamGameRound, this.isEditing = false});

  void _setupRound() async {
    if (isEditing) {
      await teamGame.scoreService
          .editLastRoundOfGame(teamGame.id, teamGameRound);
    } else {
      await teamGame.scoreService.addRoundToGame(teamGame.id, teamGameRound);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => teamGameRound..computeRound(),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            title: ScreenTitleWidget()),
        body: Consumer<BeloteRound>(
          builder: (context, roundData, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              TakerTeamWidget(round: roundData),
              Divider(),
              TrickPointsBeloteWidget(round: roundData),
              Divider(),
              roundData is CoincheBeloteRound
                  ? ContractCoincheWidget(coincheRound: roundData)
                  : ContractBeloteWidget(beloteRound: roundData),
              SizedBox(height: 20),
              RealTimeDisplayWidget(round: roundData),
              SizedBox(height: 20),
              Center(
                  child: RaisedButton.icon(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      onPressed: () async =>
                          {await _setupRound(), Navigator.pop(context)},
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Valider',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      icon: Icon(Icons.check)))
            ]),
          ),
        ),
      ),
    );
  }
}
