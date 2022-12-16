import 'package:flutter/material.dart';
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
              onPressed: () =>
                  _showDialog(context, style: TargetPlatform.android),
              child: const Text('Show alert dialog (material)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showDialog(context, style: TargetPlatform.iOS),
              child: const Text('Show alert dialog (cupertino)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showDialog(context),
              child: const Text('Show alert dialog (platform)'),
            ),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () => _showBottomsheet(context),
                child: const Text('Show bottom sheet'),
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showToast(context),
              child: const Text('Show toast'),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
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
    final controller =
        showBottomSheet(context: context, builder: _buildRunCompleteSheet);

    Future.delayed(const Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

  Widget _buildRunCompleteSheet(context) {
    return SafeArea(
        child: Container(
      color: Theme.of(context).cardColor,
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('BottomSheet test!',
                style: Theme.of(context).textTheme.headline6),
            const Text('This is a message')
          ])),
    ));
  }

  void _showDialog(BuildContext context, {TargetPlatform? style}) {
    const alert = PlatformAlert(
      title: 'AlertDialog test!',
      message: 'This is a message',
    );
    alert.show(context, style);
  }
}
