import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IListView {
  final Axis scrollDirection;
  final bool reverse = false;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap = false;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final List<Widget> children;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  IListView(
      this.scrollDirection,
      this.controller,
      this.primary,
      this.physics,
      this.padding,
      this.itemExtent,
      this.prototypeItem,
      this.addAutomaticKeepAlives,
      this.addRepaintBoundaries,
      this.addSemanticIndexes,
      this.cacheExtent,
      this.children,
      this.semanticChildCount,
      this.dragStartBehavior,
      this.keyboardDismissBehavior,
      this.restorationId,
      this.clipBehavior);

  IListView copyWith({
    Axis? scrollDirection,
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
    return IListView(
      scrollDirection ?? this.scrollDirection,
      controller ?? this.controller,
      primary ?? this.primary,
      physics ?? this.physics,
      padding ?? this.padding,
      itemExtent ?? this.itemExtent,
      prototypeItem ?? this.prototypeItem,
      addAutomaticKeepAlives ?? this.addAutomaticKeepAlives,
      addRepaintBoundaries ?? this.addRepaintBoundaries,
      addSemanticIndexes ?? this.addSemanticIndexes,
      cacheExtent ?? this.cacheExtent,
      children ?? this.children,
      semanticChildCount ?? this.semanticChildCount,
      dragStartBehavior ?? this.dragStartBehavior,
      keyboardDismissBehavior ?? this.keyboardDismissBehavior,
      restorationId ?? this.restorationId,
      clipBehavior ?? this.clipBehavior,
    );
  }
}
