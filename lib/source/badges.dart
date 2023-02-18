import 'package:flutter/material.dart';

/// This class is used to create a badge with a label
/// The label is limited to 4 characters, if the label is greater than 4
/// characters the label will be truncated
///
class DynamicBadge extends StatelessWidget {
  const DynamicBadge({
    required String label,
    required double childSize,
    Color? textColor,
    Color? backgroundColor,
    AlignmentGeometry? alignment,
    Widget? child,
    super.key,
  })  : _label = label,
        _textColor = textColor ?? Colors.white,
        _backgroundColor = backgroundColor ?? Colors.redAccent,
        _alignment = alignment ?? Alignment.center,
        _childSize = childSize,
        _child = child ?? const SizedBox(),
        assert(label.length <= 4, 'Label must be 4 characters or less');

  /// Constructor to create a badge with a small size
  /// Is a badge without label, sometimes is used to indicate
  /// that the icon has a notification
  ///
  const DynamicBadge.small({
    required double childSize,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    Widget? child,
    super.key,
  })  : _label = '',
        _textColor = Colors.white,
        _childSize = childSize,
        _alignment = alignment ?? Alignment.center,
        _backgroundColor = backgroundColor ?? Colors.redAccent,
        _child = child ?? const SizedBox();

  /// Constructor to create a badge with a counter,
  /// The counter is limited to 999, if the counter is greater than 999
  /// the label will be "999+"
  ///
  const DynamicBadge.counter({
    required int count,
    required double childSize,
    Color? textColor,
    Color? backgroundColor,
    AlignmentGeometry? alignment,
    Widget? child,
    super.key,
  })  : _label = count > 999 ? '999+' : '$count',
        _backgroundColor = backgroundColor ?? Colors.redAccent,
        _childSize = childSize,
        _alignment = alignment ?? Alignment.center,
        _textColor = textColor ?? Colors.white,
        _child = child ?? const SizedBox();

  final String _label;
  final Color _textColor;
  final Color _backgroundColor;
  final double _childSize;
  final AlignmentGeometry _alignment;
  final Widget _child;

  /// Get the size of the badge
  /// The size of the badge is calculated based on the size of the icon
  /// 80% of the size of the icon
  ///
  double get _sizeBadge {
    return _childSize * 0.8;
  }

  /// Returns the size of the expected difference between
  /// the badge and the icon
  ///
  double get _differenceExpected => _sizeBadge - (_childSize * 0.5);

  /// Returns the total size of the expected difference between the badge
  /// and the icon
  ///
  double get _totalDifferenceExpected {
    return (_differenceExpected * 2).floorToDouble();
  }

  /// Get the position of the badge case the label is not empty
  double get _positionInitialBadge {
    final total = _childSize + (_differenceExpected * 2).floorToDouble();
    return total / 2;
  }

  /// Get the position of the badge case the label is empty
  double get _positionSmallBadge {
    final totalWidth = _childSize + (_differenceExpected * 2).floorToDouble();
    return totalWidth * 0.70;
  }

  /// Get the font size of the badge
  /// The font size of the badge is calculated based on
  /// the size of the icon.
  ///
  double get _fontSize {
    final total = _childSize + (_differenceExpected * 2).floorToDouble();
    return total * 0.3;
  }

  /// Get the size of the badge based on the number of
  /// characters in the label.
  ///
  Size get _getBetterSizeBadge {
    final total = _childSize + _totalDifferenceExpected;

    if (_label.length <= 1) {
      return Size(
        _sizeBadge,
        _sizeBadge,
      );
    } else {
      return Size(
        (_differenceExpected * 2) + (total * 0.1) * _label.length,
        _sizeBadge,
      );
    }
  }

  /// The calculation of the final maximum size is based on the sum of
  /// the difference between half the value of the child widget and
  /// the size of the badge (80% of the child widget size)
  ///
  Size get _resize {
    final total = _childSize + _totalDifferenceExpected;

    if (_label.length <= 1) {
      return Size(
        total,
        total,
      );
    } else {
      return Size(
        total + (total * 0.1) * _label.length,
        total,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _alignment,
      children: [
        Positioned(
          left: _differenceExpected,
          bottom: _differenceExpected,
          child: _child,
        ),
        SizedBox.fromSize(
          size: _resize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (_label != '')
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
                      color: _backgroundColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Baseline(
                      baseline: _sizeBadge * 0.6,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        _label.isEmpty ? '' : _label,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: _textColor,
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
                    height: _childSize * 0.25,
                    width: _childSize * 0.25,
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: _backgroundColor,
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
