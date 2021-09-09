import 'package:carg/styles/properties.dart';
import 'package:carg/views/screens/change_log_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class CargAboutDialog extends StatelessWidget {
  final String _repoUrl = 'https://github.com/vareversat/carg';
  final String _legalLease = '© ${DateTime.now().year} - Valentin REVERSAT';
  final String _errorMessage =
      'Impossible d\'obtenir les informations de l\'application';
  final String _appInfo =
      'L\'application pour enregistrer vos parties de Belote, Coinche et Tarot ! \n';
  final String _sourceCode = 'Code source';
  final String _changeLog = 'Journal des modifications';
  final Widget _iconWidget = Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 60,
        width: 60,
        child: SvgPicture.asset('assets/images/card_game.svg'),
      ));

  void _launchURL() async {
    if (await canLaunch(_repoUrl)) {
      await launch(_repoUrl, forceSafariVC: false);
    } else {
      throw 'Impossible d\'ouvrir $_repoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.data == null) {
            return Text(_errorMessage);
          }
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            titlePadding: const EdgeInsets.all(20),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            actionsPadding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                    data: Theme.of(context).iconTheme, child: _iconWidget),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(snapshot.data!.appName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                            Text(
                                ' | v${snapshot.data!.version}+${snapshot.data!.buildNumber}',
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(_legalLease,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(CustomProperties.borderRadius)),
            content: ListBody(
              children: <Widget>[
                Text(
                  _appInfo,
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton.icon(
                    key: ValueKey('sourceCodeButton'),
                    onPressed: () => _launchURL(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).cardColor),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    CustomProperties.borderRadius)))),
                    label: Text(_sourceCode, style: TextStyle(fontSize: 18)),
                    icon: Icon(
                      FontAwesomeIcons.github,
                      size: 20,
                    )),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).cardColor),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    CustomProperties.borderRadius)))),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeLogScreen(),
                          ),
                        ),
                    label: Text(_changeLog, style: TextStyle(fontSize: 18)),
                    icon: Icon(
                      FontAwesomeIcons.fileCode,
                      size: 20,
                    )),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).cardColor),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    CustomProperties.borderRadius)))),
                    onPressed: () {
                      showLicensePage(
                        context: context,
                        applicationName: snapshot.data!.appName,
                        applicationVersion:
                            'v${snapshot.data!.version}+${snapshot.data!.buildNumber}',
                        applicationIcon: _iconWidget,
                        applicationLegalese: _legalLease,
                      );
                    },
                    label: Text(
                        MaterialLocalizations.of(context)
                                .viewLicensesButtonLabel[0] +
                            MaterialLocalizations.of(context)
                                .viewLicensesButtonLabel
                                .substring(1)
                                .toLowerCase(),
                        style: TextStyle(fontSize: 18)),
                    icon: Icon(
                      FontAwesomeIcons.fileAlt,
                      size: 20,
                    ))
              ],
            ),
            actions: <Widget>[
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                CustomProperties.borderRadius)))),
                onPressed: () => {Navigator.pop(context)},
                icon: Icon(Icons.close),
                label: Text(
                  MaterialLocalizations.of(context).closeButtonLabel,
                ),
              )
            ],
            scrollable: true,
          );
        },
        future: PackageInfo.fromPlatform());
  }
}
