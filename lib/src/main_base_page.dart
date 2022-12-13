// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

abstract class CustomPage extends StatelessWidget {
  final PageView? pageView;
  final ListView? listView;
  final ScrollController? controller;

  ScrollPhysics _scrollPhysics = const AlwaysScrollableScrollPhysics();

  CustomPage({Key? key, this.pageView, this.listView, this.controller})
      : super(key: key);

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
    required ScrollController listController,
  }) : super(listView: listView, controller: listController);

  @override
  Widget build(BuildContext context) {
    return listView!.copyWith(
        physics: _scrollPhysics, controller: controller, children: [listView!]);
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

extension ListViewExtension on ListView {
  ListView copyWith({
    Axis? scrollDirection,
    bool? reverse,
    bool? shrinkWrap,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    bool? addAutomaticKeepAlives,
    bool? addRepaintBoundaries,
    bool? addSemanticIndexes,
    double? cacheExtent,
    List<Widget>? children,
    int? semanticChildCount,
    DragStartBehavior? dragStartBehavior,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    String? restorationId,
    Clip? clipBehavior,
  }) {
    return ListView(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      padding: padding ?? this.padding,
      itemExtent: itemExtent ?? this.itemExtent,
      prototypeItem: prototypeItem ?? this.prototypeItem,
      addAutomaticKeepAlives: addAutomaticKeepAlives ?? true,
      addRepaintBoundaries: addRepaintBoundaries ?? true,
      addSemanticIndexes: addSemanticIndexes ?? true,
      cacheExtent: cacheExtent ?? this.cacheExtent,
      semanticChildCount: semanticChildCount ?? this.semanticChildCount,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? this.keyboardDismissBehavior,
      restorationId: restorationId ?? this.restorationId,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      // itemBuilder: itemBuilder ?? this.ite,
      children: children ?? [],
    );
  }
}
