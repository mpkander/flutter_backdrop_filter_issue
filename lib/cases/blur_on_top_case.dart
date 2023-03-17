import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_backdrop_ios_issue/main.dart';
import 'package:flutter_backdrop_ios_issue/platform_view_map.dart';

class BlurOnTopCase extends StatefulWidget {
  const BlurOnTopCase({super.key});

  @override
  State<BlurOnTopCase> createState() => _BlurOnTopCaseState();
}

class _BlurOnTopCaseState extends State<BlurOnTopCase> {
  void _showModalPopup() => showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Test alert dialog'),
          content: const Text('Test alert dialog?'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              PlatfromViewMap(),
              const Center(
                child: Text(
                  'TEXT ON MAP',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _showModalPopup,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: _showModalPopup,
                tooltip: 'Increment',
                child: const Icon(Icons.sync),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: _showModalPopup,
                tooltip: 'Increment',
                child: const Icon(Icons.settings),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore),
                label: 'Map',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_border),
                label: 'Saved',
              ),
            ],
          ),
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Center(
              child: Material(
                color: Colors.grey.withOpacity(0),
                child: const Text(
                  'BLUR',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
