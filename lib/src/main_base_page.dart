import 'package:flutter/material.dart';

abstract class CustomPage extends StatelessWidget {
  final PageView? pageView;
  final ListView? listView;
  const CustomPage({Key? key, this.pageView, this.listView}) : super(key: key);

  Axis? get direction {
    if (pageView != null) {
      return pageView!.scrollDirection;
    } else {
      return listView!.scrollDirection;
    }
  }
}
// ---------------------------------------------------------------------------------------

class CustomListView extends CustomPage {
  const CustomListView({
    super.key,
    required ListView listView,
  }) : super(listView: listView);

  @override
  Widget build(BuildContext context) {
    return listView!;
  }
}
// ---------------------------------------------------------------------------------------

class CustomPageView extends CustomPage {
  const CustomPageView({
    super.key,
    required PageView pageView,
  }) : super(pageView: pageView);

  @override
  Widget build(BuildContext context) {
    return pageView!;
  }
}

// ---------------------------------------------------------------------------------------

class CustomNormalView extends CustomPage {
  final Widget child;
  const CustomNormalView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
