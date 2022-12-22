// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'custom_constructor_widgets.dart';

abstract class CustomPage extends StatelessWidget {
  // // ListView
  // final List<Widget>? children;
  // // ListView.builder && ListView.separated && PageView.builder
  // final Widget Function(BuildContext, int)? itemBuilder;
  // // ListView.separated
  // final Widget Function(BuildContext, int)? separatorBuilder;
  // // ListView.separated && PageView.builder
  // final int? itemCount;
  // // ListView.custom && PageView.custom
  // final SliverChildDelegate? childrenDelegate;

  final ListViewOptions? listViewOptions;
  final PageViewOptions? pageViewOptions;

  ScrollPhysics _scrollPhysics = const AlwaysScrollableScrollPhysics();
  set physics(ScrollPhysics phy) {
    _scrollPhysics = phy;
  }

  ScrollController? _controller;
  set setController(ScrollController sc) {
    _controller = sc;
  }

  CustomPage(
      {Key? key,
      // this.controller,
      // this.children,
      // this.itemBuilder,
      // this.separatorBuilder,
      // this.childrenDelegate,
      this.listViewOptions,
      // this.itemCount,
      this.pageViewOptions})
      : super(key: key);

  // ScrollPhysics get physics => _scrollPhysics;

  // CustomPage({Key? key, this.pageView, this.listView, this.controller, this.children})
  //     : assert(!((pageView != null || listView != null) && controller == null),
  //           'If you use any scrollable view, you must provide the controller given from the builder method.'),
  //       super(key: key);

  ListView? get listView {
    if (listViewOptions?.children != null) {
      return ListView(
          scrollDirection: listViewOptions?.scrollDirection ?? Axis.vertical,
          reverse: listViewOptions?.reverse ?? false,
          controller: _controller,
          primary: listViewOptions?.primary ?? true,
          physics: _scrollPhysics,
          shrinkWrap: listViewOptions?.shrinkWrap ?? false,
          padding: listViewOptions?.padding,
          itemExtent: listViewOptions?.itemExtent,
          prototypeItem: listViewOptions?.prototypeItem,
          addAutomaticKeepAlives: listViewOptions?.addAutomaticKeepAlives ?? true,
          addRepaintBoundaries: listViewOptions?.addRepaintBoundaries ?? true,
          addSemanticIndexes: listViewOptions?.addSemanticIndexes ?? true,
          cacheExtent: listViewOptions?.cacheExtent,
          children: listViewOptions!.children!,
          semanticChildCount: listViewOptions?.semanticChildCount,
          dragStartBehavior: listViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
          keyboardDismissBehavior: listViewOptions?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
          restorationId: listViewOptions?.restorationId,
          clipBehavior: listViewOptions?.clipBehavior ?? Clip.hardEdge);
    } else if (listViewOptions?.itemBuilder != null && listViewOptions?.separatorBuilder == null) {
      return ListView.builder(
          scrollDirection: listViewOptions?.scrollDirection ?? Axis.vertical,
          reverse: listViewOptions?.reverse ?? false,
          controller: _controller,
          primary: listViewOptions?.primary ?? true,
          physics: _scrollPhysics,
          shrinkWrap: listViewOptions?.shrinkWrap ?? false,
          padding: listViewOptions?.padding,
          itemExtent: listViewOptions?.itemExtent,
          prototypeItem: listViewOptions?.prototypeItem,
          addAutomaticKeepAlives: listViewOptions?.addAutomaticKeepAlives ?? true,
          addRepaintBoundaries: listViewOptions?.addRepaintBoundaries ?? true,
          addSemanticIndexes: listViewOptions?.addSemanticIndexes ?? true,
          cacheExtent: listViewOptions?.cacheExtent,
          semanticChildCount: listViewOptions?.semanticChildCount,
          dragStartBehavior: listViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
          keyboardDismissBehavior: listViewOptions?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
          restorationId: listViewOptions?.restorationId,
          clipBehavior: listViewOptions?.clipBehavior ?? Clip.hardEdge,
          findChildIndexCallback: listViewOptions?.findChildIndexCallback,
          itemCount: listViewOptions?.itemCount,
          itemBuilder: listViewOptions!.itemBuilder!);
    } else if (listViewOptions?.itemCount != null && listViewOptions?.itemBuilder != null && listViewOptions?.separatorBuilder != null) {
      return ListView.separated(
          scrollDirection: listViewOptions?.scrollDirection ?? Axis.vertical,
          reverse: listViewOptions?.reverse ?? false,
          controller: _controller,
          primary: listViewOptions?.primary ?? true,
          physics: _scrollPhysics,
          shrinkWrap: listViewOptions?.shrinkWrap ?? false,
          padding: listViewOptions?.padding,
          addAutomaticKeepAlives: listViewOptions?.addAutomaticKeepAlives ?? true,
          addRepaintBoundaries: listViewOptions?.addRepaintBoundaries ?? true,
          addSemanticIndexes: listViewOptions?.addSemanticIndexes ?? true,
          cacheExtent: listViewOptions?.cacheExtent,
          dragStartBehavior: listViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
          keyboardDismissBehavior: listViewOptions?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
          restorationId: listViewOptions?.restorationId,
          clipBehavior: listViewOptions?.clipBehavior ?? Clip.hardEdge,
          findChildIndexCallback: listViewOptions?.findChildIndexCallback,
          itemCount: listViewOptions!.itemCount!,
          itemBuilder: listViewOptions!.itemBuilder!,
          separatorBuilder: listViewOptions!.separatorBuilder!);
    } else if (listViewOptions?.childrenDelegate != null) {
      return ListView.custom(
          scrollDirection: listViewOptions?.scrollDirection ?? Axis.vertical,
          reverse: listViewOptions?.reverse ?? false,
          controller: _controller,
          primary: listViewOptions?.primary ?? true,
          physics: _scrollPhysics,
          shrinkWrap: listViewOptions?.shrinkWrap ?? false,
          padding: listViewOptions?.padding,
          itemExtent: listViewOptions?.itemExtent,
          prototypeItem: listViewOptions?.prototypeItem,
          cacheExtent: listViewOptions?.cacheExtent,
          semanticChildCount: listViewOptions?.semanticChildCount,
          dragStartBehavior: listViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
          keyboardDismissBehavior: listViewOptions?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
          restorationId: listViewOptions?.restorationId,
          clipBehavior: listViewOptions?.clipBehavior ?? Clip.hardEdge,
          childrenDelegate: listViewOptions!.childrenDelegate!);
    }
    return null;
  }

  PageView? get pageView {
    if (pageViewOptions?.children != null) {
      return PageView(
        scrollDirection: pageViewOptions?.scrollDirection ?? Axis.horizontal,
        reverse: pageViewOptions?.reverse ?? false,
        controller: _controller as PageController,
        physics: _scrollPhysics,
        pageSnapping: pageViewOptions?.pageSnapping ?? true,
        onPageChanged: pageViewOptions?.onPageChanged,
        children: pageViewOptions!.children!,
        dragStartBehavior: pageViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
        allowImplicitScrolling: pageViewOptions?.allowImplicitScrolling ?? false,
        restorationId: pageViewOptions?.restorationId,
        clipBehavior: pageViewOptions?.clipBehavior ?? Clip.hardEdge,
        scrollBehavior: pageViewOptions?.scrollBehavior,
        padEnds: true,
      );
    } else if (pageViewOptions?.itemBuilder != null) {
      return PageView.builder(
        scrollDirection: pageViewOptions?.scrollDirection ?? Axis.horizontal,
        reverse: pageViewOptions?.reverse ?? false,
        controller: _controller as PageController,
        physics: _scrollPhysics,
        pageSnapping: pageViewOptions?.pageSnapping ?? true,
        onPageChanged: pageViewOptions?.onPageChanged,
        itemBuilder: pageViewOptions!.itemBuilder!,
        findChildIndexCallback: pageViewOptions?.findChildIndexCallback,
        itemCount: pageViewOptions?.itemCount,
        dragStartBehavior: pageViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
        allowImplicitScrolling: pageViewOptions?.allowImplicitScrolling ?? false,
        restorationId: pageViewOptions?.restorationId,
        clipBehavior: pageViewOptions?.clipBehavior ?? Clip.hardEdge,
        scrollBehavior: pageViewOptions?.scrollBehavior,
        padEnds: true,
      );
    } else if (pageViewOptions?.childrenDelegate != null) {
      return PageView.custom(
        scrollDirection: pageViewOptions?.scrollDirection ?? Axis.horizontal,
        reverse: pageViewOptions?.reverse ?? false,
        controller: _controller as PageController,
        physics: _scrollPhysics,
        pageSnapping: pageViewOptions?.pageSnapping ?? true,
        onPageChanged: pageViewOptions?.onPageChanged,
        childrenDelegate: pageViewOptions!.childrenDelegate!,
        dragStartBehavior: pageViewOptions?.dragStartBehavior ?? DragStartBehavior.start,
        allowImplicitScrolling: pageViewOptions?.allowImplicitScrolling ?? false,
        restorationId: pageViewOptions?.restorationId,
        clipBehavior: pageViewOptions?.clipBehavior ?? Clip.hardEdge,
        scrollBehavior: pageViewOptions?.scrollBehavior,
        padEnds: true,
      );
    }
    return null;
  }

  Axis? get direction {
    if (pageViewOptions != null) {
      return pageView?.scrollDirection;
    } else {
      return listView?.scrollDirection;
    }
  }
}
// ---------------------------------------------------------------------------------------

class CustomListView extends CustomPage {
  CustomListView({
    super.key,
    required ListViewOptions listViewOptions,
  }) : super(listViewOptions: listViewOptions);

  @override
  Widget build(BuildContext context) {
    return listView!;
  }
}
// ---------------------------------------------------------------------------------------

class CustomPageView extends CustomPage {
  CustomPageView({
    super.key,
    required PageViewOptions pageViewOptions,
  }) : super(pageViewOptions: pageViewOptions);

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
