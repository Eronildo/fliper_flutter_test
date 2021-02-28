import 'package:fliper_flutter_test/features/wealth_summary/presentation/views/wealth_summary_card.dart';
import 'package:fliper_flutter_test/features/your_wallet/presentation/your_wallet_card.dart';
import 'package:flutter/material.dart';

import 'components/home/home_app_bar.dart';
import 'components/home/home_drawer.dart';
import 'components/home/home_floating_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: HomeFloatingButton(),
        drawer: HomeDrawer(),
        body: CustomScrollView(
          slivers: [
            _getHomeAppBar(),
            _getFirstHomeItem(context),
            _getSecondHomeItem(),
            _getHomePageFooterSpace(),
          ],
        ),
      );

  Widget _getHomeAppBar() => HomeAppBar();

  SliverToBoxAdapter _getFirstHomeItem(BuildContext context) =>
      SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 30.0,
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: WealthSummaryCard(),
            ),
          ],
        ),
      );

  SliverToBoxAdapter _getSecondHomeItem() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: YourWalletCard(),
        ),
      );

  SliverToBoxAdapter _getHomePageFooterSpace() => SliverToBoxAdapter(
        child: SizedBox(height: 60.0),
      );
}
