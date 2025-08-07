import 'package:flutter/material.dart';
import 'package:quransenja/common/widget/space/rounded_container.dart';
import 'package:quransenja/utils/constants/images_string.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../common/widget/appbar/appbar.dart';
import '../../../common/widget/shape/app_spacing.dart';
import '../../../common/widget/shape/search_container.dart';
import '../../../common/widget/text/title_text.dart';
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

          // List of surah
          SliverToBoxAdapter(child: QSAppSpacing.verticalSm),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // final product = controller.orderHistories[index];
                return QSRoundedContainer(
                  padding: EdgeInsets.all(QSSizes.spacingMd),
                  margin: EdgeInsets.only(
                    left: QSSizes.spacingLg,
                    right: QSSizes.spacingLg,
                    bottom: QSSizes.spacingMd,
                  ),
                  radius: QSSizes.cardRadiusLg,
                  showBorder: true,
                  borderColor: QSColors.primaryLight,
                  hasShadow: true,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(QSImages.frameUpperGrey, width: QSSizes.iconLg),
                          Text("1", style: context.textTheme.titleLarge?.copyWith(color: QSColors.primaryMedium)),
                          Image.asset(QSImages.frameBottomGrey, width: QSSizes.iconLg),
                        ],
                      ),
                      QSAppSpacing.horizontalMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QSTextTitle(text: "Al - Fatihah"),
                            Text(
                              "Pembukaan",
                              style: context.textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text("الفاتحة", style: context.textTheme.titleLarge),
                    ],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  _appBar() {
    return QSAppBar(
      showBackArrow: false,
      backgroundColor: QSColors.white,
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
            showBorder: false,
            text: QSTexts.searchPlaceHolder,
            onTap: () {},
          ),
        ),
      ),
    );
  }

  _header(BuildContext context) => SliverToBoxAdapter(child: HeaderBeranda());
}
