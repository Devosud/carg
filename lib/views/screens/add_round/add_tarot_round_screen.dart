import 'package:carg/models/game/tarot.dart';
import 'package:carg/models/players/tarot_round_players.dart';
import 'package:carg/models/score/round/tarot_round.dart';
import 'package:carg/styles/properties.dart';
import 'package:carg/views/screens/add_round/widget/real_time_display_widget.dart';
import 'package:carg/views/screens/add_round/widget/screen_title_widget.dart';
import 'package:carg/views/screens/add_round/widget/section_title_widget.dart';
import 'package:carg/views/screens/add_round/widget/tarot_game/contract_tarot_widget.dart';
import 'package:carg/views/screens/add_round/widget/tarot_game/oudler_picker_widget.dart';
import 'package:carg/views/screens/add_round/widget/tarot_game/tarot_perk_widget.dart';
import 'package:carg/views/screens/add_round/widget/tarot_game/trick_points_tarot_widget.dart';
import 'package:carg/views/widgets/api_mini_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTarotRoundScreen extends StatelessWidget {
  final Tarot? tarotGame;
  final TarotRound? tarotRound;
  final bool? isEditing;

  void _setupRound() async {
    if (isEditing!) {
      await tarotGame!.scoreService
          .editLastRoundOfGame(tarotGame!.id, tarotRound);
    } else {
      await tarotGame!.scoreService.addRoundToGame(tarotGame!.id, tarotRound);
    }
  }

  AddTarotRoundScreen({this.tarotGame, this.tarotRound, this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            title: ScreenTitleWidget()),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Flexible(
                child: ListView(children: [
                  Column(children: [
                    SectionTitleWidget(
                        title: 'Peneur' +
                            (tarotRound!.players!.playerList!.length > 4
                                ? ' et appelé'
                                : '')),
                    ChangeNotifierProvider.value(
                        value: tarotRound!.players!,
                        child: Consumer<TarotRoundPlayers>(
                            builder: (context, playerData, _) => Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 10,
                                children: playerData.playerList!
                                    .map((player) => APIMiniPlayerWidget(
                                        isSelected:
                                            playerData.isPlayerSelected(player),
                                        playerId: player,
                                        displayImage: !playerData
                                            .isPlayerSelected(player),
                                        showLoading: false,
                                        selectedColor: playerData
                                            .getSelectedColor(player, context),
                                        size: 20,
                                        onTap: () => playerData
                                            .onSelectedPlayer2(player)))
                                    .toList()
                                    .cast<Widget>())))
                  ]),
                  Column(children: [
                    Divider(),
                    ContractTarotWidget(tarotRound: tarotRound!),
                    Divider(),
                    OudlerPickerWidget(tarotRound: tarotRound!),
                    Divider(),
                    TrickPointsTarotWidget(tarotRound: tarotRound!),
                    Divider(),
                    TarotPerkWidget(
                        tarotRound: tarotRound!, tarotGame: tarotGame),
                    SizedBox(height: 20),
                    RealTimeDisplayWidget(round: tarotRound!),
                    SizedBox(height: 20),
                  ]),
                ]),
              ),
              Center(
                  child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).cardColor),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      CustomProperties.borderRadius)))),
                      onPressed: () => {_setupRound(), Navigator.pop(context)},
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Valider', style: TextStyle(fontSize: 23)),
                      ),
                      icon: Icon(Icons.check, size: 30)),
                ),
              ))
            ],
          ),
        ));
  }
}
