import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/notification/abstract_game_notification.dart';
import 'package:carg/models/notification/abstract_notification.dart';
import 'package:carg/views/dialogs/warning_dialog.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameEndedNotification extends AbstractGameNotification {
  factory GameEndedNotification.fromJSON(
      Map<String, dynamic>? json, String id) {
    return GameEndedNotification(
      id: id,
      notificationStatus:
          EnumToString.fromString(NotificationStatus.values, json?['status'])!,
      timeStamp: DateTime.parse(json?['time_stamp']),
      boundTo: json?['bound_to'],
      gameId: json?['game_id'],
      gameType: EnumToString.fromString(GameType.values, json?['game_type'])!,
    );
  }

  GameEndedNotification(
      {super.id,
      super.notificationStatus,
      super.timeStamp,
      required super.boundTo,
      required super.gameId,
      required super.gameType})
      : super(kind: NotificationKind.gameEnded);

  @override
  Map<String, dynamic> toJSON() {
    var tmpJSON = super.toJSON();
    tmpJSON.addAll({'game_id': gameId, 'game_type': gameType.name});
    return tmpJSON;
  }

  @override
  String getMessage(BuildContext context) {
    return AppLocalizations.of(context)!
        .gameEndedNotificationMessageSmall(gameType.name);
  }

  @override
  IconData getVisualIcon() {
    return FontAwesomeIcons.gamepad;
  }

  @override
  Widget displayDialog(BuildContext context) {
    return WarningDialog(
      onConfirmButtonMessage: AppLocalizations.of(context)!.yes,
      onCancelButtonMessage: AppLocalizations.of(context)!.no,
      onConfirm: () async => {goToGame(context)},
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                getVisualIcon(),
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                gameType.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.gameEndedNotificationMessage(
              gameType.name,
            ),
          ),
        ],
      ),
      title: AppLocalizations.of(context)!.gameEnded,
      color: Theme.of(context).primaryColor,
    );
  }
}
