import 'package:carg/helpers/custom_route.dart';
import 'package:carg/services/auth_service.dart';
import 'package:carg/services/game/coinche_belote_service.dart';
import 'package:carg/services/game/french_belote_service.dart';
import 'package:carg/services/game/tarot_service.dart';
import 'package:carg/styles/properties.dart';
import 'package:carg/styles/text_style.dart';
import 'package:carg/views/screens/game_mode_picker_screen.dart';
import 'package:carg/views/tabs/game_list_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GameListScreen extends StatelessWidget {
  final FrenchBeloteService _beloteGameService = FrenchBeloteService();
  final CoincheBeloteService _coincheGameService = CoincheBeloteService();
  final TarotService _tarotGameService = TarotService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Parties',
                        style: CustomTextStyle.screenHeadLine1(context)),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).accentColor),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).cardColor),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        CustomProperties.borderRadius)))),
                        onPressed: () async => Navigator.push(
                              context,
                              CustomRouteLeftAndRight(
                                builder: (context) => GameModePickerScreen(),
                              ),
                            ),
                        label: Text('Nouvelle partie',
                            style: TextStyle(fontSize: 14)),
                        icon: FaIcon(
                          FontAwesomeIcons.plusCircle,
                          size: 15,
                        ))
                  ],
                ),
                bottom: TabBar(
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                        child: Text(
                      'Coinche',
                      style: TextStyle(fontSize: 15),
                    )),
                    Tab(
                        child: Text(
                      'Belote',
                      style: TextStyle(fontSize: 15),
                    )),
                    Tab(
                        child: Text(
                      'Tarot',
                      style: TextStyle(fontSize: 15),
                    ))
                  ],
                ),
              ),
            ),
            body: Consumer<AuthService>(
                builder: (context, auth, _) => TabBarView(
                      children: [
                        GameListWidget(
                          gamesFuture: _coincheGameService
                              .getAllGames(auth.getPlayerIdOfUser()),
                        ),
                        GameListWidget(
                          gamesFuture: _beloteGameService
                              .getAllGames(auth.getPlayerIdOfUser()),
                        ),
                        GameListWidget(
                          gamesFuture: _tarotGameService
                              .getAllGames(auth.getPlayerIdOfUser()),
                        )
                      ],
                    ))));
  }
}
