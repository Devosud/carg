import 'package:carg/models/game/belote_game.dart';
import 'package:carg/models/game/french_belote.dart';
import 'package:carg/models/game/game.dart';
import 'package:carg/models/game/setting/belote_game_setting.dart';
import 'package:carg/styles/properties.dart';
import 'package:carg/views/screens/rules_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameInfoDialog extends StatefulWidget {
  final Game game;

  const GameInfoDialog({Key? key, required this.game}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GameInfoDialogState();
  }
}

class _GameInfoDialogState extends State<GameInfoDialog> {
  _GameInfoDialogState();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.numberOfPointToReach,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.game.settings.isInfinite
                ? "∞"
                : widget.game.settings.maxPoint.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          (widget.game is Belote && widget.game is! FrenchBelote)
              ? Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 3,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.addAnnouncementAndPointDone,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Non",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: (widget.game.settings as BeloteGameSetting)
                              .addContractToScore,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool value) {},
                        ),
                        const Text(
                          "Oui",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            foregroundColor:
                MaterialStateProperty.all<Color>(Theme.of(context).cardColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  CustomProperties.borderRadius,
                ),
              ),
            ),
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RulesScreen(gameType: widget.game.gameType),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.seeTheRules,
          ),
        )
      ],
    );
  }
}
