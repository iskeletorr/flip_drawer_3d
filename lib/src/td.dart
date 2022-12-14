import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drag_helper.dart';
import 'drawer.dart';
import 'main_base_page.dart';

part 'td_properties.dart';

class TdPage extends StatefulWidget {
  /// Default drawer with given a width,padding and [backgroundColor]
  final CustomDrawer drawer;

  ///
  ///                   CustomPage
  ///                       |
  ///        -------------------------------
  ///        |              |              |
  ///        |              |              |
  ///  CustomListView CustomPageView CustomNormalView
  ///
  /// Main page that will be displayed when you run
  final MainPageBuilder mainPage;

  /// Page that will be displayed when you
  /// dragged vertically in initial state.
  final AnimBuilder? contentPage;

  /// Sliding app bar when you dragged horizontally in initial state.
  /// Changes its leading icon and onPress function if you drag vertically.
  final AnimBuilderV3 appBar;

  const TdPage({
    super.key,
    required this.drawer,
    required this.mainPage,
    this.contentPage,
    required this.appBar,
  });

  @override
  State<TdPage> createState() => _TdPageState();
}

class _TdPageState extends DragHelper<TdPage> {
  late final ScrollController? _scrollController;
  late final PageController? _pageController;

  Axis? _direction;
  int _page = 0;

  CustomPage? _customPage;

  bool get listViewOnEdge {
    if ((_scrollController == null) ||
        (_scrollController != null && !_scrollController!.hasClients)) {
      return false;
    }
    return _scrollController!.position.atEdge &&
        _scrollController!.position.pixels == 0;
  }

  @override
  void initState() {
    super.initState();
    _scrollController =
        widget.mainPage is _CustomListViewBuilder ? ScrollController() : null;
    _pageController =
        widget.mainPage is _CustomPageViewBuilder ? PageController() : null;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _customPage = widget.mainPage(
        context,
        horizontalController!,
        verticalController!,
        widget.mainPage is _CustomPageViewBuilder
            ? _pageController!
            : (widget.mainPage is _CustomListViewBuilder
                ? _scrollController!
                : null),
      );
      _direction = _customPage!.direction;
      setState(() {});

      // animValueListener.addListener(() {
      //   _customPage!.physics = animValueListener.value > 0
      //       ? const NeverScrollableScrollPhysics()
      //       : const AlwaysScrollableScrollPhysics();
      // });
    });

    if (_pageController != null) {
      _pageController!.addListener(() {
        _page = _pageController!.page!.round();
        setState(() {});
      });
    }
    if (_scrollController != null) {
      _scrollController!.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  late final singleVerticalGestureSet = {
    AllowMultipleVerticalDragGestureRecognizer:
        GestureRecognizerFactoryWithHandlers<
            AllowMultipleVerticalDragGestureRecognizer>(
      () => AllowMultipleVerticalDragGestureRecognizer(),
      (AllowMultipleVerticalDragGestureRecognizer instance) {
        instance
          ..onStart = onDragStartVertical
          ..onEnd = onDragEndVertical
          ..onUpdate = onDragUpdateVertical;
      },
    )
  };

  late final gestureSet = {
    AllowMultipleVerticalDragGestureRecognizer:
        GestureRecognizerFactoryWithHandlers<
            AllowMultipleVerticalDragGestureRecognizer>(
      () => AllowMultipleVerticalDragGestureRecognizer(),
      (AllowMultipleVerticalDragGestureRecognizer instance) {
        instance
          ..onStart = onDragStartVertical
          ..onEnd = onDragEndVertical
          ..onUpdate = onDragUpdateVertical;
      },
    ),
    AllowMultipleHorizontalDragGestureRecognizer:
        GestureRecognizerFactoryWithHandlers<
            AllowMultipleHorizontalDragGestureRecognizer>(
      () => AllowMultipleHorizontalDragGestureRecognizer(),
      (AllowMultipleHorizontalDragGestureRecognizer instance) {
        instance
          ..onStart = onDragStartHorizontal
          ..onEnd = onDragEndHorizontal
          ..onUpdate = onDragUpdateHorizontal;
      },
    )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: horizontalController!,
          builder: (context, child) => Stack(
            children: [
              backgroundDrag(),
              drawerTransform(),
              mainPageTransform(),
              contentTransform(),
              animatedAppBar(),
            ],
          ),
        ),
      ),
    );
  }

  /// GestureDetector is for enabling horizontal drag from
  /// background when drawer is open
  GestureDetector backgroundDrag() {
    return GestureDetector(
        onHorizontalDragStart: onDragStartHorizontal,
        onHorizontalDragEnd: onDragEndHorizontal,
        onHorizontalDragUpdate: onDragUpdateHorizontal,
        child: Container(
          color: Colors.transparent,
        ));
  }

  GestureDetector drawerTransform() {
    return GestureDetector(
        onHorizontalDragStart: onDragStartHorizontal,
        onHorizontalDragEnd: onDragEndHorizontal,
        onHorizontalDragUpdate: onDragUpdateHorizontal,
        child: AnimatedBuilder(
          animation: horizontalController!,
          builder: (context, child) => Transform.translate(
              offset: Offset(
                  MediaQuery.of(context).size.width *
                      0.8 *
                      (horizontalController!.value - 1),
                  0),
              child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(1, 2, 0.001)
                    ..rotateY(math.pi / 2 * (1 - horizontalController!.value)),
                  alignment: Alignment.centerRight,
                  child: widget.drawer)),
        ));
  }

  Widget mainPageTransform() {
    return ValueListenableBuilder(
      valueListenable: animValueListener,
      builder: (BuildContext context, value, Widget? child) => AnimatedBuilder(
        animation: verticalController!,
        builder: (context, child) {
          _customPage?.physics = value > 0
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics();
          return Transform.translate(
            offset: Offset(
                MediaQuery.of(context).size.width *
                    0.8 *
                    (horizontalController!.value),
                MediaQuery.of(context).size.height *
                    0.01 *
                    (verticalController!.value)),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(-math.pi * horizontalController!.value / 2)
                ..rotateX(-math.pi * (3 / 4) * (verticalController!.value)),
              alignment: horizontalController!.value == 0
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Opacity(
                opacity: verticalController!.value > 0.67 ? 0 : 1,
                child: RawGestureDetector(
                  gestures: widget.mainPage.type == MainPageType.pageView
                      ? _direction == Axis.vertical
                          ? gestureSet
                          : _page == 0
                              ? gestureSet
                              : singleVerticalGestureSet
                      : widget.mainPage.type == MainPageType.listView
                          ? (_direction == Axis.vertical
                              ? gestureSet
                              : listViewOnEdge
                                  ? gestureSet
                                  : singleVerticalGestureSet)
                          : gestureSet,
                  child: _customPage?.listView!.copyWith(
                          physics: _customPage?.physics,
                          children: _customPage?.children) ??
                      Container(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  GestureDetector contentTransform() {
    return GestureDetector(
      onVerticalDragStart: onDragStartVertical,
      onVerticalDragEnd: onDragEndVertical,
      onVerticalDragUpdate: onDragUpdateVertical,
      child: AnimatedBuilder(
        animation: verticalController!,
        builder: (context, child) => Transform.translate(
            offset: Offset(
              0,
              MediaQuery.of(context).size.height * 0.1 +
                  MediaQuery.of(context).size.height *
                      1.15 *
                      (1 - verticalController!.value), //
            ),
            child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, -0.001)
                  ..rotateY(math.pi * horizontalController!.value),
                alignment: Alignment.centerLeft,
                child:
                    widget.contentPage!(context, verticalController!))), // !!!
      ),
    );
  }

  Transform animatedAppBar() {
    return Transform.translate(
      offset: Offset(
          MediaQuery.of(context).size.width * 0.8 * horizontalController!.value,
          0),
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child:
            widget.appBar(context, horizontalController!, verticalController!),
      ),
    );
  }
}
