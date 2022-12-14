import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform_alert.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showSnackBar(context),
              child: const Text('Show toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Show alert dialog'),
            ),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () => _showBottomsheet(context),
                child: const Text('Show bottom sheet'),
              );
            }),

/*
            ElevatedButton(
              onPressed: () =>
                  _showDialog(context, style: TargetPlatform.android),
              child: const Text('Show alert dialog (material)'),
            ),
            ElevatedButton(
              onPressed: () => _showDialog(context, style: TargetPlatform.iOS),
              child: const Text('Show alert dialog (cupertino)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showDialog(context),
              child: const Text('Show alert dialog (platform)'),
            ),
*/
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('This is a message'),
        action:
            SnackBarAction(label: 'X', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showBottomsheet(BuildContext context) {
    final controller = showBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Container(
            color: Colors.red[200],
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('BottomSheet',
                      style: Theme.of(context).textTheme.headline6),
                  const Text('Questo ?? un messaggio')
                ])),
          ));
        });

    Future.delayed(const Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

  void _showAlertDialog(BuildContext context, {TargetPlatform? style}) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: const Text("AlertDialog"),
              content: const Text("qusto ?? un messaggio"),
              actions: [
                CupertinoButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }

/*
    const alert = PlatformAlert(
      title: 'AlertDialog test!',
      message: 'This is a message',
    );
    alert.show(context, style);
*/

}
