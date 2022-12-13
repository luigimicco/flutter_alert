import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ElevatedButton(
                onPressed: null,
                child: Text('AlertDialog'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: null,
                child: Text('BottomSheet'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: null,
                child: Text('SnackBar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
