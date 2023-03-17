import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_backdrop_ios_issue/cases/blur_animation_case.dart';
import 'package:flutter_backdrop_ios_issue/cases/blur_on_top_case.dart';
import 'package:flutter_backdrop_ios_issue/cases/blur_without_view_case.dart';
import 'package:flutter_backdrop_ios_issue/cases/only_alert_case.dart';

void main() {
  runApp(const MyApp(
    issueCase: IssueCase.blurAnimation,
  ));
}

class MyApp extends StatelessWidget {
  final IssueCase issueCase;

  const MyApp({super.key, required this.issueCase});

  @override
  Widget build(BuildContext context) {
    final Widget child;
    switch (issueCase) {
      case IssueCase.blurWithoutView:
        child = const BlurWithoutViewCase();
        break;
      case IssueCase.onlyAlert:
        child = const OnlyAlertCase();
        break;
      case IssueCase.blurOnTop:
        child = const BlurOnTopCase();
        break;
      case IssueCase.blurAnimation:
        child = const BlurAnimationCase();
        break;
    }

    return MaterialApp(
      title: 'Backdrop Issue Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: child,
    );
  }
}

enum IssueCase {
  /// Simple case with widget on top and blur behind.
  blurWithoutView,

  /// First PlatformView example. Simple Cupertino alert open.
  /// 
  /// Opens by pressing any FAB.
  onlyAlert,

  /// Blur on top.
  blurOnTop,

  /// Animated blur square.
  blurAnimation,
}
