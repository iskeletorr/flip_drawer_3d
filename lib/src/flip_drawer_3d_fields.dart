part of 'flip_drawer_3d.dart';

/// [verticalController] for vertical animation
/// [horizontalController] for horizontal animation
/// and [viewController] for pageView/listView scrolls
typedef MainPageBuilder = CustomPage Function(
    BuildContext context, AnimationController verticalController, AnimationController horizontalController, ScrollController? viewController);

enum MainPageType { pageView, listView, normalView }

extension MainPageBuilderExtension on MainPageBuilder {
  MainPageType get type {
    if (this is _CustomPageViewBuilder) {
      return MainPageType.pageView;
    } else if (this is _CustomListViewBuilder) {
      return MainPageType.listView;
    }
    return MainPageType.normalView;
  }
}

typedef _CustomPageViewBuilder = CustomPageView Function(
    BuildContext context, AnimationController verticalController, AnimationController horizontalController, ScrollController? viewController);

typedef _CustomListViewBuilder = CustomListView Function(
    BuildContext context, AnimationController verticalController, AnimationController horizontalController, ScrollController? viewController);

/// contentPage only needs vertical drag
typedef ContentBuilder = Widget? Function(BuildContext context, AnimationController verticalController);

/// [CustomAppBar] needs both controllers because of transform and animated icon.
typedef AppBarBuilder = CustomAppBar Function(BuildContext context, AnimationController verticalController, AnimationController horizontalController);

class AllowMultipleVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class AllowMultipleHorizontalDragGestureRecognizer extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
