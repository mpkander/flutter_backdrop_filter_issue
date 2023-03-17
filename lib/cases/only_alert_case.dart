import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_backdrop_ios_issue/main.dart';
import 'package:flutter_backdrop_ios_issue/platform_view_map.dart';

class OnlyAlertCase extends StatefulWidget {
  const OnlyAlertCase({super.key});

  @override
  State<OnlyAlertCase> createState() => _OnlyAlertCaseState();
}

class _OnlyAlertCaseState extends State<OnlyAlertCase> {
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
    return Scaffold(
      body: Stack(
        children: [
          PlatfromViewMap(),
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
    );
  }
}
