import 'package:carg/models/score/french_belote_score.dart';
import 'package:carg/services/score/french_belote_score_service.dart';
import 'package:flutter/material.dart';

class BeloteRoundWidget extends StatefulWidget {
  final String beloteGameId;

  BeloteRoundWidget({
    @required this.beloteGameId,
  });

  @override
  State<StatefulWidget> createState() {
    return _BeloteRoundWidgetState(beloteGameId);
  }
}

class _BeloteRoundWidgetState extends State<BeloteRoundWidget> {
  final _roundService = FrenchBeloteScoreService();
  final String _beloteGameId;

  _BeloteRoundWidgetState(this._beloteGameId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FrenchBeloteScore>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container(
              alignment: Alignment.center, child: Icon(Icons.error));
        }
        if (snapshot.data != null) {
          return Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text('Score'),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                          itemCount: snapshot.data.rounds.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: <Widget>[
                                Flexible(
                                  child: Center(
                                    child: Text(snapshot
                                        .data.rounds[index].takerScore
                                        .toString()),
                                  ),
                                ),
                                Flexible(
                                  child: Center(
                                    child: Text(snapshot
                                        .data.rounds[index].defenderScore
                                        .toString()),
                                  ),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Center(
                                child: Text(
                                    snapshot.data.usTotalPoints.toString())),
                          ),
                          Flexible(
                            child: Center(
                                child: Text(
                                    snapshot.data.themTotalPoints.toString())),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Text('Pas de score pour le moment');
      },
      future: _roundService.getScoreByGame(_beloteGameId),
    );
  }
}
