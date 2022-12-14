// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'custom_gesture_widgets.dart';

abstract class CustomPage extends StatelessWidget {
  final PageView? pageView;
  final ListView? listView;
  final List<Widget>? children;
  final ScrollController? controller;

  ScrollPhysics _scrollPhysics = const AlwaysScrollableScrollPhysics();

  CustomPage(
      {Key? key, this.pageView, this.listView, this.controller, this.children})
      : assert(!((pageView != null || listView != null) && controller == null),
            'If you use any scrollable view, you must provide the controller given from the builder method.'),
        super(key: key);

  Axis? get direction {
    if (pageView != null) {
      return pageView!.scrollDirection;
    } else {
      return listView!.scrollDirection;
    }
  }

  ScrollPhysics get physics => _scrollPhysics;

  set physics(ScrollPhysics phy) {
    _scrollPhysics = phy;
  }
}
// ---------------------------------------------------------------------------------------

class CustomListView extends CustomPage {
  CustomListView({
    super.key,
    required ListView listView,
    required List<Widget> children,
    required ScrollController listController,
  }) : super(
            listView: listView, controller: listController, children: children);

  @override
  Widget build(BuildContext context) {
    return listView!;
        // .copyWith(physics: physics, controller: controller, children: children);
  }
}
// ---------------------------------------------------------------------------------------

class CustomPageView extends CustomPage {
  CustomPageView(
      {super.key,
      required PageView pageView,
      required PageController pageController})
      : super(pageView: pageView, controller: pageController);

  @override
  Widget build(BuildContext context) {
    return pageView!;
  }
}

// ---------------------------------------------------------------------------------------

class CustomNormalView extends CustomPage {
  final Widget child;
  CustomNormalView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
