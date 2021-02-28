import 'package:fliper_flutter_test/core/presentation/views/components/builders/controller_builder.dart';
import 'package:fliper_flutter_test/core/presentation/views/components/providers/provider.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_controller.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_event.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_state.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/views/components/summary_card.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/views/components/summary_card_error.dart';
import 'package:flutter/material.dart';

class WealthSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SummaryController>(context);
    return Center(
      child: ControllerBuilder<SummaryController, SummaryState>(
        controller: controller..add(LoadSummaryEvent()),
        builder: (context, state) {
          if (state is EmptyState || state is LoadingState)
            return _getLoadingWidget(context);
          else if (state is LoadedState)
            return SummaryCard(model: state.model);
          else if (state is ErrorState)
            return SummaryCardError(
              errorMessage: state.message,
              tryAgainButtonOnPressed: () {
                controller.add(LoadSummaryEvent());
              },
            );
          return Container();
        },
      ),
    );
  }

  Widget _getLoadingWidget(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
