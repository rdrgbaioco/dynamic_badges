import 'package:flutter/material.dart';

class DynamicBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color textColor;
  final Color backgroundColor;
  final double size;
  final AlignmentGeometry alignment;
  final bool visibleLabel;

  const DynamicBadge({
    Key? key,
    required this.label,
    required this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    this.size = 24,
    this.alignment = Alignment.center,
  }) : visibleLabel = true, super(key: key);


  const DynamicBadge.counter({
    super.key,
    required int count,
    required this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    this.size = 24,
    this.alignment = Alignment.center,
  }) : visibleLabel = true, label = count > 999 ? "999+" : "$count";

  const DynamicBadge.icon({
    super.key,
    required this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    this.size = 24,
    this.alignment = Alignment.bottomLeft,
  }) : visibleLabel = true, label = '';

  @override
  Widget build(BuildContext context) {
    double maxScale = 0.0;
    if (label.length <= 1) {
      maxScale = 0.10;
    } else if (label.length <= 2) {
      maxScale = 0.20;
    } else if (label.length <= 3) {
      maxScale = 0.25;
    } else {
      maxScale = 0.30;
    }

    return SizedBox.fromSize(
      size: Size(
        size + (size * maxScale).floorToDouble(),
        size,
      ),
      child: Stack(
        alignment: alignment,
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
              left: 0.0,
              bottom: 0.0,
              child: Icon(
                icon,
                size: size,
              )
          ),
          if (visibleLabel && label != '') Positioned(
            left: label.length <= 1 ? size * 0.6 : size * 0.5,
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.bottomLeft,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: backgroundColor,
                shape: const StadiumBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size * 0.03,
                    right: size * 0.03,
                    bottom: size * 0.03
                ),
                child: Text(
                  label.isEmpty ? '' : label,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size / 4,
                  ),
                ),
              ),
            ),
          ) else Positioned(
            right: size * 0.05,
            top: size * 0.05,
            child: Container(
              height: size * 0.25,
              width: size * 0.25,
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
    );
  }
}