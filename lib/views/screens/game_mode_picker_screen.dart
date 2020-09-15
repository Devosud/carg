import 'package:carg/models/game/belote_game.dart';
import 'package:carg/models/game/coinche_game.dart';
import 'package:carg/models/game/game.dart';
import 'package:carg/views/screens/player_picker_screen.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

class GameModePickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Nouvelle partie',
              style: Theme.of(context).textTheme.headline1),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sélection du mode de jeu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    _GameModeButton(
                      game: CoincheGame(),
                    ),
                    _GameModeButton(game: BeloteGame()),
                    //_GameModeButton(game: TarotGame())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameModeButton extends StatelessWidget {
  final Game game;

  const _GameModeButton({this.game});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerPickerScreen(
              newGame: game,
              title: EnumToString.convertToString(game.gameType),
            ),
          ),
        )
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(width: 2, color: Theme.of(context).primaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(EnumToString.convertToString(game.gameType),
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
