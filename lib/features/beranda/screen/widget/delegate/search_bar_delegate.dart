import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

/// A [SliverPersistentHeaderDelegate] for creating a sticky search bar.
///
/// This delegate ensures that the search bar remains visible at the top of the
/// scrollable area, providing a consistent user experience. It also adds a
/// subtle border when the content overlaps, creating a "sticky" effect.
class QSSearchBarDelegate extends SliverPersistentHeaderDelegate {
  const QSSearchBarDelegate({required this.child});

  // The widget to be displayed within the persistent header (e.g., a search container).
  final Widget child;

  @override
  double get minExtent => 70; // The minimum height of the header.
  @override
  double get maxExtent => 70; // The maximum height of the header.

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Determines if the header is in a sticky state (has been scrolled past).
    final bool isSticky = shrinkOffset > 0;

    return Container(
      // The decoration for the search bar container.
      decoration: BoxDecoration(
        color: QSColors.white,
        border: Border(
          // Adds a bottom border to create a shadow effect when sticky.
          bottom: BorderSide(
            color: isSticky ? QSColors.borderPrimary : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      // Centers the child widget within the container.
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant QSSearchBarDelegate oldDelegate) {
    // Returns false to prevent unnecessary rebuilds unless the child widget changes.
    // In this case, since the child is constant, it won't rebuild.
    return false;
  }
}
