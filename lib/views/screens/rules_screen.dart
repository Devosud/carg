import 'package:carg/models/game/game_type.dart';
import 'package:carg/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

class RulesScreen extends StatelessWidget {
  final GameType gameType;

  const RulesScreen({required this.gameType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${gameType.name} - Règles',
            style: CustomTextStyle.screenHeadLine1(context),
          ),
        ),
        body: FutureBuilder(
            future: rootBundle.loadString('assets/rules/${gameType.rulesFile}'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  onTapLink: (text, url, title) {
                    Future.delayed(Duration(seconds: 1))
                        .then((value) => launch(url!));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      margin: EdgeInsets.all(20),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      content: Text('Overture de $text...',
                          style: CustomTextStyle.snackBarTextStyle(context)),
                    ));
                  },
                  data: snapshot.data!,
                  selectable: true,
                  extensionSet: md.ExtensionSet(
                    md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                    [
                      md.EmojiSyntax(),
                      md.LinkSyntax(),
                      ...md.ExtensionSet.gitHubWeb.inlineSyntaxes
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
