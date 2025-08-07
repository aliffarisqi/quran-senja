import 'package:flutter/material.dart';

import '../../../common/widget/appbar/appbar.dart';
import '../../../common/widget/shape/app_spacing.dart';
import '../../../common/widget/shape/search_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import 'widget/delegate/search_bar_delegate.dart';
import 'widget/header_beranda.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: QSColors.white,
      body: CustomScrollView(
        slivers: [
          // Header
          _header(context),

          // Sticky Search
          SliverToBoxAdapter(child: QSAppSpacing.verticalSm),
          _search(),
        ],
      ),
    );
  }

  _appBar() {
    return QSAppBar(
      showBackArrow: false,
      backgroundColor: QSColors.primaryLight,
      isHide: true,
    );
  }

  _search() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: QSSearchBarDelegate(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QSSizes.spacingLg),
          child: QSSearchContainer(
            text: QSTexts.searchPlaceHolder,
            onTap: () {},
          ),
        ),
      ),
    );
  }

  _header(BuildContext context) => SliverToBoxAdapter(child: HeaderBeranda());
}
