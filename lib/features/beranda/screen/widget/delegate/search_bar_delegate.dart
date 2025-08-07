import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class QSSearchBarDelegate extends SliverPersistentHeaderDelegate {
  QSSearchBarDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 70; // tinggi minimal
  @override
  double get maxExtent => 70; // tinggi maksimal

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool isSticky = shrinkOffset > 0;

    return Container(
      decoration: BoxDecoration(
        color: QSColors.white,
        border: Border(
          bottom: BorderSide(
            color: isSticky ? QSColors.borderPrimary : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  bool shouldRebuild(QSSearchBarDelegate oldDelegate) => false;
}
