import 'package:flutter/material.dart';

class DynamicBadge extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final double childSize;
  final AlignmentGeometry alignment;
  final Widget child;
  final void Function()? onTap;
  const DynamicBadge({
    Key? key,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    this.childSize = 48,
    this.alignment = Alignment.center,
    this.child = const SizedBox(),
    this.onTap,
  })  : assert(label.length <= 4, "Label must be 4 characters or less"),
        super(key: key);

  const DynamicBadge.counter({
    super.key,
    required int count,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    this.childSize = 32,
    this.alignment = Alignment.center,
    this.child = const SizedBox(),
    this.onTap,
  }) : label = count > 999 ? "999+" : "$count";

  /// Get the size of the badge
  /// The size of the badge is calculated based on the size of the icon
  /// 80% of the size of the icon
  ///
  double get _sizeBadge {
    return childSize * 0.8;
  }

  /// Returns the size of the expected difference between
  /// the badge and the icon
  ///
  double get _differenceExpected => _sizeBadge - (childSize * 0.5);

  /// Returns the total size of the expected difference between the badge
  /// and the icon
  ///
  double get _totalDifferenceExpected {
    return (_differenceExpected * 2).floorToDouble();
  }

  /// Get the position of the badge case the label is not empty
  double get _positionInitialBadge {
    final total = childSize + (_differenceExpected * 2).floorToDouble();
    return total / 2;
  }

  /// Get the position of the badge case the label is empty
  double get _positionSmallBadge {
    final totalWidth = childSize + (_differenceExpected * 2).floorToDouble();
    return totalWidth * 0.70;
  }

  /// Get the font size of the badge
  /// The font size of the badge is calculated based on
  /// the size of the icon.
  ///
  double get _fontSize {
    final total = childSize + (_differenceExpected * 2).floorToDouble();
    return total * 0.3;
  }

  /// Get the size of the badge based on the number of
  /// characters in the label.
  ///
  Size get _getBetterSizeBadge {
    final total = childSize + _totalDifferenceExpected;

    if (label.length <= 1) {
      return Size(
        _sizeBadge,
        _sizeBadge,
      );
    } else {
      return Size(
        (_differenceExpected * 2) + (total * 0.1) * label.length,
        _sizeBadge,
      );
    }
  }

  /// The calculation of the final maximum size is based on the sum of
  /// the difference between half the value of the child widget and
  /// the size of the badge (80% of the child widget size)
  ///
  Size get _resize {
    final total = childSize + _totalDifferenceExpected;

    if (label.length <= 1) {
      return Size(
        total,
        total,
      );
    } else {
      return Size(
        total + (total * 0.1) * label.length,
        total,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        Positioned(
          left: _differenceExpected,
          bottom: _differenceExpected,
          child: child,
        ),
        SizedBox.fromSize(
          size: _resize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (label != '')
                Positioned(
                  left: _positionInitialBadge,
                  bottom: _positionInitialBadge,
                  child: Container(
                    constraints: BoxConstraints.loose(
                      _getBetterSizeBadge,
                    ),
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: backgroundColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Baseline(
                      baseline: _sizeBadge * 0.6,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        label.isEmpty ? '' : label,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                          leadingDistribution:
                              TextLeadingDistribution.proportional,
                          fontWeight: FontWeight.w500,
                          fontSize: _fontSize,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Positioned(
                  left: _positionSmallBadge,
                  bottom: _positionSmallBadge,
                  child: Container(
                    height: childSize * 0.25,
                    width: childSize * 0.25,
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: backgroundColor,
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
