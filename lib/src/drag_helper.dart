import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class DragHelper<T extends StatefulWidget> extends State<T> with TickerProviderStateMixin {
  AnimationController? verticalController;
  AnimationController? horizontalController;
  bool verticalDrag = false;
  bool horizontalDrag = false;
  bool contentIsAvailable = true;
  static const double _degreeRadian = 1.55968567;

  Offset _verticalStartPosition = Offset.zero;
  Offset _horizontalStartPosition = Offset.zero;

  Offset _verticalCurrentPosition = Offset.zero;
  Offset _horizontalCurrentPosition = Offset.zero;

  double _verticalAngle = 0;
  double _horizontalAngle = 0;
  // m = tanQ => atan(m) = Q
  double calcAngle(Offset o1, Offset o2) {
    double m = (o1.dy - o2.dy) / (o1.dx - o2.dx);
    return math.atan(-m);
  }

  bool get isAllowedHorizontalDrag {
    Direction direction = Direction.getDirection(_verticalStartPosition, _verticalCurrentPosition, _verticalAngle);
    if ((direction == Direction.bltr && _degreeRadian / 2 > _verticalAngle) || (direction == Direction.tlbr && _verticalAngle > -_degreeRadian / 2)) {
      return true;
    } else if (horizontalController!.value > 0.51) {
      return true;
    }
    return false;
  }

  bool get isAllowedVerticalDrag {
    Direction direction = Direction.getDirection(_horizontalStartPosition, _horizontalCurrentPosition, _horizontalAngle);
    if ((direction == Direction.bltr && _degreeRadian / 2 < _verticalAngle) || (direction == Direction.brtl && _verticalAngle < -_degreeRadian / 2)) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    verticalController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    horizontalController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    verticalController!.dispose();
    horizontalController!.dispose();
    super.dispose();
  }

  void onDragStartVertical(DragStartDetails details) {
    _verticalStartPosition = details.localPosition;
    verticalDrag = verticalController!.isDismissed || verticalController!.isCompleted;
  }

  void onDragUpdateVertical(DragUpdateDetails details) {
    if (verticalDrag && !isAllowedHorizontalDrag) {
      _verticalCurrentPosition = details.localPosition;
      _verticalAngle = calcAngle(_verticalStartPosition, _verticalCurrentPosition);
      double delta = details.primaryDelta! / MediaQuery.of(context).size.height;
      if ((_verticalCurrentPosition.dy - _verticalStartPosition.dy).abs() > MediaQuery.of(context).size.height * 0.15) {
        if (contentIsAvailable) {
          verticalController!.value -= delta;
        }
      }
    }
  }

  void onDragEndVertical(DragEndDetails details) {
    double minFlingVelocity = MediaQuery.of(context).size.height;
    if (verticalController!.isDismissed || verticalController!.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= minFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.height;
      verticalController!.fling(velocity: visualVelocity);
    } else if (verticalController!.value < 0.5) {
      verticalController!.reverse();
    } else {
      verticalController!.forward();
    }
  }

  void onDragStartHorizontal(DragStartDetails details) {
    _horizontalStartPosition = details.localPosition;
    horizontalDrag = horizontalController!.isDismissed || horizontalController!.isCompleted;
  }

  void onDragUpdateHorizontal(DragUpdateDetails details) {
    if (horizontalDrag && isAllowedHorizontalDrag) {
      _horizontalCurrentPosition = details.localPosition;
      _horizontalAngle = calcAngle(_horizontalStartPosition, _horizontalCurrentPosition);
      double delta = details.primaryDelta! / MediaQuery.of(context).size.width;
      horizontalController!.value += delta;
    }
  }

  void onDragEndHorizontal(DragEndDetails details) {
    double minFlingVelocity = MediaQuery.of(context).size.width;

    if (horizontalController!.isDismissed || horizontalController!.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dy.abs() >= minFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dy / MediaQuery.of(context).size.width;
      horizontalController!.fling(velocity: visualVelocity);
    } else if (horizontalController!.value < 0.5) {
      horizontalController!.reverse();
    } else {
      horizontalController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

enum Direction {
  bltr,
  brtl,
  trbl,
  tlbr,
  none;

  static Direction getDirection(Offset start, Offset end, double radian) {
    if (radian > 0 && end.dx > start.dx && end.dy < start.dy) {
      return Direction.bltr;
    }
    if (radian > 0 && end.dx <= start.dx && end.dy >= start.dy) {
      return Direction.trbl;
    }
    if (radian < 0 && end.dx <= start.dx && end.dy <= start.dy) {
      return Direction.brtl;
    }
    if (radian < 0 && end.dx > start.dx && end.dy > start.dy) {
      return Direction.tlbr;
    }
    return Direction.none;
  }
}
