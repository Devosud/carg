import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/player.dart';
import 'package:carg/services/player_service.dart';
import 'package:carg/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerInfoDialog extends StatefulWidget {
  final Player player;
  final bool isEditing;

  PlayerInfoDialog({this.player, @required this.isEditing});

  @override
  State<StatefulWidget> createState() {
    return _PlayerInfoDialogState(player, isEditing);
  }
}

class _PlayerInfoDialogState extends State<PlayerInfoDialog> {
  final _usernameTextController = TextEditingController();
  final _profilePictureTextController = TextEditingController();
  final _playerService = PlayerService();
  var _title = 'Infos';
  var _isCreating = false;
  var _isEditing = false;
  var _isLoading = false;

  String _profilePictureUrl = '';
  Player _player;

  _PlayerInfoDialogState(Player player, bool isEditing) {
    if (player == null && !isEditing) {
      _isCreating = true;
      _title = 'Nouveau joueur';
    } else if (player != null && isEditing) {
      _isEditing = true;
      _title = 'Edition du profil';
      _usernameTextController.text = player.userName;
      _profilePictureTextController.text = player.profilePicture;
    }
    _player = player ?? Player();
  }

  void _setProfilePictureUrl(String url) {
    setState(() {
      _profilePictureUrl = url;
    });
  }

  Future _commitPlayer() async {
    setState(() {
      _isLoading = true;
    });
    if (_isCreating) {
      _player = Player(
          userName: _usernameTextController.text,
          profilePicture: _profilePictureUrl);
      await _playerService.addPlayer(_player);
    } else {
      _player.userName = _usernameTextController.text;
      _player.profilePicture = _profilePictureTextController.text;
      await _playerService.updatePlayer(_player);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _getInitialValues() {
    if (_player != null) {
      _profilePictureUrl = _player.profilePicture;
      _usernameTextController.text = _player.userName;
      _profilePictureTextController.text = _player.profilePicture;
    }
  }

  @override
  void initState() {
    _getInitialValues();
    super.initState();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _profilePictureTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      actionsPadding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0))),
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 15),
        child: Text(
          _title,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyle.dialogHeaderStyle(context),
        ),
      ),
      content: ListBody(children: [
        Row(
          children: <Widget>[
            if (!_isEditing)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(_profilePictureUrl)))),
              ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    enabled: _isCreating || _isEditing,
                    controller: _usernameTextController,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    maxLines: null,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: 25, color: Theme.of(context).hintColor),
                        labelText: _isCreating || _isEditing
                            ? 'Nom d\'utilisateur'
                            : null)),
              ),
            ),
          ],
        ),
        if (_isCreating || _isEditing)
          Container(
            child: TextFormField(
                enabled: _isCreating || _isEditing,
                onChanged: (text) => _setProfilePictureUrl(text),
                controller: _profilePictureTextController,
                style: TextStyle(fontSize: 20),
                maxLines: null,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 15, color: Theme.of(context).hintColor),
                    labelText: 'Image de profile (url)')),
          )
        else
          Container(),
        if (!_isEditing && !_isCreating)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: _player.gameStatsList
                  .map(
                    (stat) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        SizedBox(
                            width: 100,
                            child: Text('${stat.gameType.name} : ',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 22))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(FontAwesomeIcons.trophy, size: 15),
                        ),
                        Text(
                          ' ' + stat.wonGames.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          ' - ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          stat.playedGames.toString() + ' ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(FontAwesomeIcons.gamepad, size: 15),
                        )
                      ],
                    ),
                  )
                  .toList()
                  .cast<Widget>(),
            ),
          ),
      ]),
      actions: <Widget>[
        if (_isLoading)
          CircularProgressIndicator()
        else
          RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              onPressed: () async => _isCreating || _isEditing
                  ? {
                      await _commitPlayer(),
                      Navigator.pop(context, 'Joueur mis à jour')
                    }
                  : Navigator.pop(context),
              label: Text(_isCreating || _isEditing
                  ? MaterialLocalizations.of(context).okButtonLabel
                  : MaterialLocalizations.of(context).closeButtonLabel),
              icon:
                  Icon(_isCreating || _isEditing ? Icons.check : Icons.close)),
        if (_isCreating || _isEditing)
          FlatButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Theme.of(context).primaryColor)),
            onPressed: () => {Navigator.pop(context, null)},
            color: Colors.white,
            textColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.close),
            label: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          )
        else
          Container(),
      ],
      scrollable: true,
    );
  }
}
