import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  MeasureSizeRenderObject(this.onChange);

  Size? oldSize;
  OnWidgetSizeChange onChange;

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  const MeasureSize({
    required this.onChange,
    required super.child,
    super.key,
  });

  final OnWidgetSizeChange onChange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant MeasureSizeRenderObject renderObject,
      ) {
    renderObject.onChange = onChange;
  }
}

enum BadgeType { small, large }

class DynamicBadge extends StatefulWidget {
  /// Constructor to create a badge with a counter,
  /// The counter is limited to 999, if the counter is greater than 999
  /// the label will be "999+"
  const DynamicBadge({
    required int count,
    required this.child,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    super.key,
  }): label = count > 999 ? '999+' : '$count', type = BadgeType.large;

  /// Constructor to create a badge with a small size
  /// Is a badge without label, sometimes is used to indicate
  /// that the icon has a notification
  const DynamicBadge.small({
    required this.child,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    super.key,
  }): label = '', type = BadgeType.small;

  final String label;
  final Color textColor;
  final Color backgroundColor;
  final BadgeType type;
  final Widget child;

  @override
  State<DynamicBadge> createState() => _DynamicBadgeState();
}

class _DynamicBadgeState extends State<DynamicBadge> {

  Size size = Size.zero;
  late Widget child;

  Widget _buildChild() {
    return MeasureSize(
      child: widget.child,
      onChange: (value) {
        setState(() {
          size = value;
        });
      },
    );
  }

  @override
  void didUpdateWidget(covariant DynamicBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != oldWidget.child) {
      child = _buildChild();
    }
  }

  @override
  void initState() {
    child = _buildChild();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case BadgeType.large:
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05,
                horizontal: size.width * 0.30,
              ),
              child: child,
            ),
            Positioned(
              top: 0,
              right: 0,
              //left: (size.width * 1.5) / 2,
              child: LargeBadge(
                size: size,
                value: widget.label,
                textColor: widget.textColor,
                backgroundColor: widget.backgroundColor,
              ),
            ),
          ],
        );
      case BadgeType.small:
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05,
                horizontal: size.width * 0.30,
              ),
              child: child,
            ),
            Positioned(
              top: size.height * 0.10,
              right: size.height * 0.30,
              child: SmallBadge(
                size: size,
                backgroundColor: widget.backgroundColor,
              ),
            ),
          ],
        );
    }
  }
}


class SmallBadge extends StatelessWidget {
  const SmallBadge({
    required this.size,
    this.backgroundColor = Colors.red,
    super.key,
  });

  final Size size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.20,
      width: size.height * 0.20,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
      ),
    );
  }
}

class LargeBadge extends StatelessWidget {
  const LargeBadge({
    required this.value,
    required this.size,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.red,
    super.key,
  });

  final String value;
  final Size size;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: size.width * 0.35,
          color: textColor,
        ),
      ),
    );
  }
}
