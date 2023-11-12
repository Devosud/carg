import 'package:carg/models/game/game_type.dart';
import 'package:carg/routes/custom_route_fade.dart';
import 'package:carg/services/impl/game/coinche_belote_game_service.dart';
import 'package:carg/services/impl/game/contree_belote_game_service.dart';
import 'package:carg/services/impl/game/french_belote_game_service.dart';
import 'package:carg/services/impl/game/tarot_game_service.dart';
import 'package:carg/styles/custom_properties.dart';
import 'package:carg/styles/custom_text_style.dart';
import 'package:carg/views/screens/game_mode_picker_screen.dart';
import 'package:carg/views/tabs/game_list_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Hero(
              tag: 'game_screen_title',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.games,
                    style: CustomTextStyle.screenDisplayLarge(
                      context,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).cardColor,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            CustomProperties.borderRadius,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      CustomRouteFade(
                        builder: (context) => const GameModePickerScreen(),
                      ),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.newGame,
                    ),
                    icon: const FaIcon(
                      FontAwesomeIcons.circlePlus,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    GameType.COINCHE.name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    GameType.BELOTE.name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    GameType.CONTREE.name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    GameType.TAROT.name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            GameListTab(gameService: CoincheBeloteGameService()),
            GameListTab(gameService: FrenchBeloteGameService()),
            GameListTab(gameService: ContreeBeloteGameService()),
            GameListTab(
              gameService: TarotGameService(),
            ),
          ],
        ),
      ),
    );
  }
}
