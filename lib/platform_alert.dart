import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlert {
  final String title;

  final String message;

  const PlatformAlert({required this.title, required this.message});

  void show(BuildContext context, TargetPlatform? style) {
    final platform = Theme.of(context).platform;

    if (style == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else if (style == TargetPlatform.android) {
      _buildMaterialAlert(context);
    } else if (platform == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else {
      _buildMaterialAlert(context);
    }
  }

  void _buildMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }

  void _buildCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                CupertinoButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }
}
