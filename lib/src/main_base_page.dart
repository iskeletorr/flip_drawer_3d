// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'custom_gesture_widgets.dart';

abstract class CustomPage extends StatelessWidget {
  final ScrollController? controller;

  // ListView
  final List<Widget>? children;
  // ListView.builder && ListView.separated && PageBuilder
  final Widget Function(BuildContext, int)? itemBuilder;
  // ListView.separated
  final Widget Function(BuildContext, int)? separatorBuilder;
  // ListView.separated
  final int? itemCount;
  // ListView.custom
  final SliverChildDelegate? childrenDelegate;
  // ListViewOptions
  final ListViewOptions? listViewOptions;
  // PageView
  final PageViewOptions? pageViewOptions;

  ScrollPhysics _scrollPhysics = const AlwaysScrollableScrollPhysics();

  Axis get direction {
    if (listView != null) return listView!.scrollDirection;
    // TODO: control
    return Axis.vertical;
  }

  ListView? get listView {
    if (children != null) {
      return ListView(
        controller: controller,
        physics: _scrollPhysics,
        scrollDirection: listViewOptions?.scrollDirection ?? Axis.vertical,
        reverse: listViewOptions?.reverse ?? false,
        children: children!,
      );
    } else if (itemBuilder != null && separatorBuilder == null) {
      return ListView.builder(itemBuilder: itemBuilder!, itemCount: itemCount);
    } else if (itemBuilder != null && separatorBuilder == null) {
      return ListView.separated(
          itemBuilder: itemBuilder!,
          separatorBuilder: separatorBuilder!,
          itemCount: itemCount!);
    } else if (childrenDelegate != null) {
      ListView.custom(childrenDelegate: childrenDelegate!);
    }
    return null;
  }

  PageView? get pageView {
    PageView();
    if (itemBuilder != null && children == null) {
      return PageView.builder(
        itemBuilder: itemBuilder!,
      );
    }

    PageView.custom(childrenDelegate: childrenDelegate!);

    return null;
  }

  CustomPage(
      {Key? key,
      this.controller,
      this.children,
      this.itemBuilder,
      this.separatorBuilder,
      this.childrenDelegate,
      this.listViewOptions,
      this.itemCount,
      this.pageViewOptions})
      : super(key: key);

  ScrollPhysics get physics => _scrollPhysics;

  set physics(ScrollPhysics phy) {
    _scrollPhysics = phy;
  }
}
// ---------------------------------------------------------------------------------------

class CustomListView extends CustomPage {
  CustomListView({
    super.key,
    // required TdListView listView,
    required List<Widget> children,
    required ScrollController listController,
    required ListViewOptions options,
  }) : super(
            controller: listController,
            children: children,
            listViewOptions: options);

  @override
  Widget build(BuildContext context) {
    return listView!;
  }
}
// // ---------------------------------------------------------------------------------------

class CustomPageView extends CustomPage {
  CustomPageView(
      {super.key,
      required PageView pageView,
      required PageController pageController,
      required PageViewOptions pageViewOptions})
      : super(controller: pageController, pageViewOptions: pageViewOptions);

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
