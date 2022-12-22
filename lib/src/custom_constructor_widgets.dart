import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListViewOptions {
  // final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final bool? reverse;
  final bool? primary;
  final bool? shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool? addAutomaticKeepAlives;
  final bool? addRepaintBoundaries;
  final bool? addSemanticIndexes;
  final double? cacheExtent;
  final List<Widget>? children;
  final int? semanticChildCount;
  final DragStartBehavior? dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final String? restorationId;
  final Clip? clipBehavior;
  final SliverChildDelegate? childrenDelegate;
  final Widget Function(BuildContext, int)? itemBuilder;
  final int? Function(Key)? findChildIndexCallback;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final int? itemCount;

  const ListViewOptions(
      {
        // this.physics,
      this.scrollDirection,
      this.reverse,
      this.primary,
      this.shrinkWrap,
      this.padding,
      this.itemExtent, ///////////// separate--
      this.prototypeItem, ////////// separate--
      this.addAutomaticKeepAlives, //// custom --
      this.addRepaintBoundaries, ////  custom --
      this.addSemanticIndexes, //// custom --
      this.cacheExtent,
      this.children,
      this.semanticChildCount, ///////// separate--
      this.dragStartBehavior,
      this.keyboardDismissBehavior,
      this.restorationId,
      this.clipBehavior,
      this.childrenDelegate, ///// only custom
      this.itemBuilder, // builder & separate
      this.findChildIndexCallback, // builder & separate
      this.separatorBuilder, //// only separate
      this.itemCount // builder & separate
      })
      : assert(
            !((children != null &&
                (itemBuilder != null ||
                    itemCount != null ||
                    findChildIndexCallback != null ||
                    childrenDelegate != null ||
                    separatorBuilder != null))),
            'You can\'t use ListView.builder/ListView.separate/ListView.custom options with ListView.'),
        // assert(!((children != null && (itemBuilder != null || itemCount != null || findChildIndexCallback != null))),
        //       'You can\'t use ListView and ListView.builder options simultaneously.'),
        //   assert(!((children != null && separatorBuilder != null)),
        // 'You can\'t use ListView and ListView.separated options simultaneously.'),
        // assert(!(children != null && childrenDelegate != null ), 'You can\'t use ListView and ListView.custom options simultaneously.'),
        assert(
            !(childrenDelegate != null &&
                ((addAutomaticKeepAlives != null ||
                    addRepaintBoundaries != null ||
                    addSemanticIndexes != null ||
                    children != null ||
                    itemBuilder != null ||
                    itemCount != null ||
                    findChildIndexCallback != null ||
                    separatorBuilder != null))),
            'You can\'t use ListView.builder/ListView.separate/ListView options with ListView.custom'),
        assert(!((semanticChildCount != null || prototypeItem != null || itemExtent != null) && separatorBuilder != null),
            'You can\'t use semanticChildCount/prototypeItem/itemExtent options with ListView.separate.'),
        assert(!((itemBuilder == null || itemCount == null ) && separatorBuilder != null),
            'You have to specify itemBuilder & itemCount to use ListView.separate.');
}

class PageViewOptions {
  // Axis? scrollDirection = Axis.horizontal;
  // bool? reverse = false;
  // bool? pageSnapping = true;
  // ValueChanged<int>? onPageChanged;
  // Widget Function(BuildContext, int)? itemBuilder;
  // //ChildIndexGetter? findChildIndexCallback;
  // int? Function(Key)? findChildIndexCallback;
  // int? itemCount;
  // DragStartBehavior? dragStartBehavior = DragStartBehavior.start;
  // bool? allowImplicitScrolling = false;
  // List<Widget>? children = const <Widget>[];
  // String? restorationId;
  // Clip? clipBehavior = Clip.hardEdge;
  // ScrollBehavior? scrollBehavior;
  // bool? padEnds = true;
  // SliverChildDelegate? childrenDelegate;

  // final Key? key;
  final bool? pageSnapping;
  final void Function(int)? onPageChanged;
  final bool? allowImplicitScrolling;
  final ScrollBehavior? scrollBehavior;
  // final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final bool? reverse;
  final bool? padEnds;
  final List<Widget>? children;
  final DragStartBehavior? dragStartBehavior;
  final String? restorationId;
  final Clip? clipBehavior;
  final SliverChildDelegate? childrenDelegate;
  final Widget Function(BuildContext, int)? itemBuilder;
  final int? Function(Key)? findChildIndexCallback;
  final int? itemCount;

  PageViewOptions(
      {this.scrollDirection,
      this.reverse,
      this.children,
      this.dragStartBehavior,
      this.restorationId,
      this.clipBehavior,
      this.childrenDelegate,
      this.itemBuilder,
      this.findChildIndexCallback,
      this.allowImplicitScrolling,
      this.pageSnapping,
      this.onPageChanged,
      this.scrollBehavior,
      this.padEnds,
      this.itemCount})
      : assert(!(children != null && (childrenDelegate != null || itemBuilder != null || itemCount != null || findChildIndexCallback != null)),
            'You can\'t use PageView.builder/custom options with PageView.'),
        // assert(!(children != null && (itemBuilder != null || itemCount != null || findChildIndexCallback != null)),
        // 'You can\'t use PageView and PageView.builder options simultaneously.'),
        // assert(!(children != null && childrenDelegate != null), 'You can\'t use PageView and PageView.custom options simultaneously.'),
        assert(!(childrenDelegate != null && ((itemBuilder != null || itemCount != null || findChildIndexCallback != null))),
            'You can\'t use PageView.custom and PageView.builder options simultaneously.');
}
