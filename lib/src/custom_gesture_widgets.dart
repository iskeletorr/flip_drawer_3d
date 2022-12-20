import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum ConstructorType { normal, builder, seprator, custom }

class PageViewOptions {
  final Axis scrollDirection = Axis.horizontal;
  final bool reverse = false;
  final ScrollPhysics? physics;
  final bool pageSnapping = true;
  final void Function(int)? onPageChanged;
  final List<Widget> children = const <Widget>[];
  final DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  final bool allowImplicitScrolling = false;
  final String? restorationId;
  final Clip clipBehavior = Clip.hardEdge;
  final ScrollBehavior? scrollBehavior;
  final bool padEnds = true;

  PageViewOptions(this.physics, this.onPageChanged, this.restorationId,
      this.scrollBehavior);
}

class ListViewOptions {
  final ScrollPhysics? physics;
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
      {this.physics,
      this.scrollDirection,
      this.reverse,
      this.primary,
      this.shrinkWrap,
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
      this.clipBehavior,
      this.childrenDelegate,
      this.itemBuilder,
      this.findChildIndexCallback,
      this.separatorBuilder,
      this.itemCount});
}

class TdListView extends ListView {
  final ConstructorType constructorType;

  TdListView copyWith({
    ScrollController? controller,
    ScrollPhysics? physics,
    Axis? scrollDirection,
    bool? reverse,
    bool? primary,
    bool? shrinkWrap,
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
    SliverChildDelegate? childrenDelegate,
    Widget Function(BuildContext, int)? itemBuilder,
    int? Function(Key)? findChildIndexCallback,
    Widget Function(BuildContext, int)? separatorBuilder,
    int? itemCount,
  }) {
    switch (constructorType) {
      case ConstructorType.normal:
        return TdListView(
          scrollDirection: scrollDirection ?? this.scrollDirection,
          reverse: reverse ?? this.reverse,
          primary: primary ?? this.primary,
          shrinkWrap: shrinkWrap ?? this.shrinkWrap,
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
          controller: controller ?? this.controller,
          physics: physics ?? this.physics,
          children: children!,
        );
      case ConstructorType.builder:
        return TdListView.builder(
          itemBuilder: itemBuilder!,
          scrollDirection: scrollDirection ?? this.scrollDirection,
          reverse: reverse ?? this.reverse,
          primary: primary ?? this.primary,
          shrinkWrap: shrinkWrap ?? this.shrinkWrap,
          padding: padding ?? this.padding,
          itemExtent: itemExtent ?? this.itemExtent,
          prototypeItem: prototypeItem ?? this.prototypeItem,
          findChildIndexCallback: findChildIndexCallback,
          itemCount: itemCount,
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
        );
      case ConstructorType.seprator:
        return TdListView.separated(
          itemBuilder: itemBuilder!,
          separatorBuilder: separatorBuilder!,
          itemCount: itemCount!,
          controller: controller ?? this.controller,
          physics: physics ?? this.physics,
          scrollDirection: scrollDirection ?? this.scrollDirection,
          reverse: reverse ?? this.reverse,
          primary: primary ?? this.primary,
          shrinkWrap: shrinkWrap ?? this.shrinkWrap,
          padding: padding ?? this.padding,
          addAutomaticKeepAlives: addAutomaticKeepAlives ?? true,
          addRepaintBoundaries: addRepaintBoundaries ?? true,
          addSemanticIndexes: addSemanticIndexes ?? true,
          cacheExtent: cacheExtent ?? this.cacheExtent,
          dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
          keyboardDismissBehavior:
              keyboardDismissBehavior ?? this.keyboardDismissBehavior,
          restorationId: restorationId ?? this.restorationId,
          clipBehavior: clipBehavior ?? this.clipBehavior,
          findChildIndexCallback: findChildIndexCallback,
        );
      case ConstructorType.custom:
        return TdListView.custom(
          childrenDelegate: childrenDelegate!,
          scrollDirection: scrollDirection ?? this.scrollDirection,
          reverse: reverse ?? this.reverse,
          primary: primary ?? this.primary,
          shrinkWrap: shrinkWrap ?? this.shrinkWrap,
          padding: padding ?? this.padding,
          itemExtent: itemExtent ?? this.itemExtent,
          prototypeItem: prototypeItem ?? this.prototypeItem,
          cacheExtent: cacheExtent ?? this.cacheExtent,
          semanticChildCount: semanticChildCount ?? this.semanticChildCount,
          dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
          keyboardDismissBehavior:
              keyboardDismissBehavior ?? this.keyboardDismissBehavior,
          restorationId: restorationId ?? this.restorationId,
          clipBehavior: clipBehavior ?? this.clipBehavior,
        );
    }
  }

  TdListView({
    super.key,
    this.constructorType = ConstructorType.normal,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super(
          children: children,
          controller: controller,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          primary: primary,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        );

  TdListView.builder({
    super.key,
    this.constructorType = ConstructorType.builder,
    required Widget Function(BuildContext, int) itemBuilder,
    ScrollController? controller,
    ScrollPhysics? physics,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    int? Function(Key)? findChildIndexCallback,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super.builder(
          itemBuilder: itemBuilder,
          scrollDirection: scrollDirection,
          reverse: reverse,
          primary: primary,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          findChildIndexCallback: findChildIndexCallback,
          itemCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        );

  TdListView.separated({
    super.key,
    this.constructorType = ConstructorType.seprator,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    required Widget Function(BuildContext, int) itemBuilder,
    int? Function(Key)? findChildIndexCallback,
    required Widget Function(BuildContext, int) separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: itemCount,
          controller: controller,
          physics: physics,
          scrollDirection: scrollDirection,
          reverse: reverse,
          primary: primary,
          shrinkWrap: shrinkWrap,
          padding: padding,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
          findChildIndexCallback: findChildIndexCallback,
        );

  const TdListView.custom({
    super.key,
    this.constructorType = ConstructorType.custom,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    required SliverChildDelegate childrenDelegate,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super.custom(
          childrenDelegate: childrenDelegate,
          scrollDirection: scrollDirection,
          reverse: reverse,
          primary: primary,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        );
}
