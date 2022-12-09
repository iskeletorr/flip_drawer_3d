part of 'td.dart';

/// If you need just one direction you can use this.
/// For example, contentPage only needs vertical drag
/// so we did contentPage with AnimBuilder
typedef AnimBuilder = Widget Function(
    BuildContext context, AnimationController controller);

/// [controller] for vertical animation and
/// [controller2] for horizontal animation
typedef MainPageBuilder = CustomPage Function(
    BuildContext context,
    AnimationController controller,
    AnimationController controller2,
    ScrollController? controller3);

enum MainPageType { pageView, listView, normalView }

extension MainPageBuilderExtension on MainPageBuilder {
  MainPageType get type {
    if (this is _CustomPageViewBuilder) {
      return MainPageType.pageView;
    } else if (this is _CustomListViewBuilder) {
      return MainPageType.pageView;
    }

    return MainPageType.normalView;
  }
}

typedef _CustomPageViewBuilder = CustomPageView Function(
    BuildContext context,
    AnimationController controller,
    AnimationController controller2,
    ScrollController? controller3);

typedef _CustomListViewBuilder = CustomListView Function(
    BuildContext context,
    AnimationController controller,
    AnimationController controller2,
    ScrollController? controller3);

/// Same as [MainPageBuilder] but with a [CustomAppBar] return type.
typedef AnimBuilderV3 = CustomAppBar Function(BuildContext context,
    AnimationController controller, AnimationController controller2);

class AllowMultipleVerticalDragGestureRecognizer
    extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class AllowMultipleHorizontalDragGestureRecognizer
    extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
