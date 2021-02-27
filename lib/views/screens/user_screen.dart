import 'dart:ui';

import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/player.dart';
import 'package:carg/services/auth_service.dart';
import 'package:carg/services/player_service.dart';
import 'package:carg/styles/text_style.dart';
import 'package:carg/views/dialogs/carg_about_dialog.dart';
import 'package:carg/views/dialogs/credentials_dialog.dart';
import 'package:carg/views/dialogs/player_info_dialog.dart';
import 'package:carg/views/dialogs/warning_dialog.dart';
import 'package:carg/views/widgets/error_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user';

  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<UserScreen> {
  String _errorMessage = 'Vous ne disposez pas de joueur';
  final _playerService = PlayerService();
  Player _player;

  Future<void> _showUpdatePlayerDialog() async {
    var message = await showDialog(
        context: context,
        child: PlayerInfoDialog(player: _player, isEditing: true));
    if (message != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content:
            Text(message, style: CustomTextStyle.snackBarTextStyle(context)),
      ));
    }
  }

  Future<void> _showCreateCredentials() async {
    var message = await showDialog(
        context: context,
        child:
            CredentialsDialog(credentialsStatus: CredentialsStatus.CREATING));
    if (message != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content:
            Text(message, style: CustomTextStyle.snackBarTextStyle(context)),
      ));
    }
  }

  Future<void> _showUpdateCredentials() async {
    var message = await showDialog(
        context: context,
        child: CredentialsDialog(credentialsStatus: CredentialsStatus.EDITING));
    if (message != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content:
            Text(message, style: CustomTextStyle.snackBarTextStyle(context)),
      ));
    }
  }

  Future<void> _signOut() async {
    try {
      if (await Provider.of<AuthService>(context, listen: false)
          .isLocalLogin()) {
        await showDialog(
            context: context,
            child: WarningDialog(
                message:
                    'Vous utilisez actuellement un compte local. Si vous vous '
                    'déconnecter, vous ne pourrez pas récupérer l\'utilisateur actuel',
                title: 'Attention',
                onConfirm: () async => {
                      await Provider.of<AuthService>(context, listen: false)
                          .signOut(),
                      await Navigator.of(context).pushReplacementNamed('/login')
                    },
                color: Theme.of(context).errorColor,
                onConfirmButtonMessage:
                    MaterialLocalizations.of(context).okButtonLabel));
      } else {
        await Provider.of<AuthService>(context, listen: false).signOut();
        await Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      _errorMessage = e.toString();
    }
  }

  Future<void> _resetPassword() async {
    await showDialog(
        context: context,
        child: WarningDialog(
            message:
                'Un email vous permettant de réinitialiser votre mot de passe va vous être envoyé',
            title: 'Information',
            onConfirm: () async =>
                await Provider.of<AuthService>(context, listen: false)
                    .resetPassword(null),
            color: Theme.of(context).accentColor));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _player,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Mon profil',
                        style: CustomTextStyle.screenHeadLine1(context)),
                    RaisedButton.icon(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        onPressed: () async => await _showUpdatePlayerDialog(),
                        label: Text('Editer'),
                        icon: Icon(
                          FontAwesomeIcons.pen,
                          size: 13,
                        ))
                  ],
                ),
              ),
            ),
            body: FutureBuilder<Player>(
                future: _playerService
                    .getPlayerOfUser(
                        Provider.of<AuthService>(context, listen: false)
                            .getConnectedUserId())
                    .catchError(
                        (onError) => {_errorMessage = onError.toString()}),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: SpinKitThreeBounce(
                            size: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                  decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                              ));
                            }));
                  }
                  if (snapshot.connectionState == ConnectionState.none &&
                          snapshot.hasData == null ||
                      snapshot.data == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ErrorMessageWidget(message: _errorMessage),
                        RaisedButton.icon(
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            onPressed: () async => _signOut(),
                            label: Text('Connexion',
                                style: TextStyle(fontSize: 14)),
                            icon: Icon(Icons.arrow_back)),
                      ],
                    );
                  }
                  if (snapshot.data == null) {
                    return Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Pas encore de joueur',
                                style: TextStyle(fontSize: 18))
                          ]),
                    );
                  }
                  _player = snapshot.data;
                  return Consumer<Player>(
                      builder: (context, player, _) => SingleChildScrollView(
                              child: (Column(children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                      child: Column(children: [
                                    Icon(FontAwesomeIcons.trophy, size: 20),
                                    Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                            _player.totalWonGames().toString(),
                                            style: TextStyle(fontSize: 20))),
                                    Text('Victoires',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic)),
                                  ])),
                                  Flexible(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Container(
                                              width: 120,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(player
                                                          .profilePicture)))))),
                                  Flexible(
                                      child: Column(children: [
                                    Icon(FontAwesomeIcons.gamepad, size: 20),
                                    Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                            _player
                                                .totalPlayedGames()
                                                .toString(),
                                            style: TextStyle(fontSize: 20))),
                                    Text('Parties',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic))
                                  ]))
                                ]),
                            Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(_player.userName,
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center)),
                            Divider(),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('- STATISTIQUES -',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: _player.gameStatsList.isNotEmpty
                                    ? _player.gameStatsList
                                        .map(
                                          (stat) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            children: <Widget>[
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                      '${stat.gameType.name} : ',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 22))),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Icon(
                                                    FontAwesomeIcons.trophy,
                                                    size: 15),
                                              ),
                                              Text(
                                                ' ' + stat.wonGames.toString(),
                                                style: TextStyle(fontSize: 22),
                                              ),
                                              Text(
                                                ' - ',
                                                style: TextStyle(fontSize: 22),
                                              ),
                                              Text(
                                                stat.playedGames.toString() +
                                                    ' ',
                                                style: TextStyle(fontSize: 22),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Icon(
                                                    FontAwesomeIcons.gamepad,
                                                    size: 22),
                                              )
                                            ],
                                          ),
                                        )
                                        .toList()
                                        .cast<Widget>()
                                    : [Text('Pas encore de statistiques')],
                              ),
                            ),
                            Divider(),
                            Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(children: [
                                  FutureBuilder<bool>(
                                      future: Provider.of<AuthService>(context,
                                              listen: true)
                                          .isLocalLogin(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.done &&
                                            snapshot.data != null) {
                                          if (snapshot.data) {
                                            return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RaisedButton.icon(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    textColor: Theme.of(context)
                                                        .cardColor,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                18.0)),
                                                    onPressed: () async =>
                                                        _showCreateCredentials(),
                                                    label: Flexible(
                                                        child: Padding(
                                                            padding: const EdgeInsets.all(
                                                                12.0),
                                                            child: Text('Créer un compte',
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(fontSize: Theme.of(context).textTheme.bodyText1.fontSize)))),
                                                    icon: FaIcon(FontAwesomeIcons.userPlus, size: 15)));
                                          } else {
                                            return Column(children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: RaisedButton.icon(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      textColor:
                                                          Theme.of(context)
                                                              .cardColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0)),
                                                      onPressed: () async =>
                                                          await _showUpdateCredentials(),
                                                      label: Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Text(
                                                              'Changer mon adresse email',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText1
                                                                      .fontSize)),
                                                        ),
                                                      ),
                                                      icon: Icon(
                                                          FontAwesomeIcons.at,
                                                          size: 20))),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: RaisedButton.icon(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      textColor: Theme.of(context)
                                                          .cardColor,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  18.0)),
                                                      onPressed: () async =>
                                                          _resetPassword(),
                                                      label: Flexible(
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                      12.0),
                                                              child: Text(
                                                                  'Changer mon mot de passe',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize: Theme.of(context).textTheme.bodyText1.fontSize)))),
                                                      icon: Icon(
                                                        FontAwesomeIcons.lock,
                                                        size: 20,
                                                      )))
                                            ]);
                                          }
                                        }
                                        return Container();
                                      }),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RaisedButton.icon(
                                              color: Colors.black,
                                              textColor:
                                                  Theme.of(context).cardColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0)),
                                              onPressed: () async =>
                                                  await showGeneralDialog(
                                                      transitionDuration: Duration(
                                                          milliseconds: 300),
                                                      context: context,
                                                      pageBuilder: (BuildContext context,
                                                          Animation<double>
                                                              animation,
                                                          Animation<double>
                                                              secondaryAnimation) {
                                                        return CargAboutDialog();
                                                      }),
                                              label: Flexible(
                                                  child: Padding(
                                                      padding: const EdgeInsets.all(
                                                          12.0),
                                                      child: Text('A propos',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 15)))),
                                              icon: Icon(
                                                FontAwesomeIcons.infoCircle,
                                                size: 20,
                                              ))),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RaisedButton.icon(
                                              color:
                                                  Theme.of(context).errorColor,
                                              textColor:
                                                  Theme.of(context).cardColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0)),
                                              onPressed: () async => _signOut(),
                                              label: Flexible(
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Text('Déconnexion',
                                                          style: TextStyle(
                                                              fontSize: 15)))),
                                              icon: Icon(
                                                FontAwesomeIcons.signOutAlt,
                                                size: 20,
                                              )))
                                    ],
                                  ),
                                ]))
                          ]))));
                })));
  }
}
