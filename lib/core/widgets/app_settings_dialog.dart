import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void showAppSettingsDialog({required BuildContext context}) {
  showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(S.of(context).warning),
                    content: Text(
                      S.of(context).location_permission_message,
                    ),
                    actions: [
                      TextButton(
                        child: Text(S.of(context).cancel),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: Text(S.of(context).settings),
                        onPressed: () => openAppSettings(),
                      ),
                    ],
                  );
                },
              );
}