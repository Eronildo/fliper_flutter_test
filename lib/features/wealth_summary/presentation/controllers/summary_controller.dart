import 'package:fliper_flutter_test/core/presentation/controllers/controller.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/models/summary_card_model.dart';

import 'summary_event.dart';
import 'summary_state.dart';

class SummaryController extends Controller<SummaryEvent, SummaryState> {
  final GetWealthSummary getWealthSummary;

  SummaryController(this.getWealthSummary) : super(EmptyState());

  SummaryCardModel model = SummaryCardModel();

  @override
  Stream<SummaryState> changeStateByEvent(SummaryEvent event) async* {
    if (event is LoadSummaryEvent) {
      yield LoadingState();
      try {
        final wealthSummary = await getWealthSummary();
        model = SummaryCardModel.fromEntity(wealthSummary);
        yield LoadedState(model: model);
      } catch (e) {
        yield ErrorState(message: e.message);
      }
    } else if (event is ShowHideSummaryEvent) {
      model.isValuesHidden = !model.isValuesHidden;
      yield LoadedState(model: model);
    }
  }
}
