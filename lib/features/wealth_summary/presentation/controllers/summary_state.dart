import 'package:fliper_flutter_test/features/wealth_summary/presentation/models/summary_card_model.dart';
import 'package:meta/meta.dart';

abstract class SummaryState {}

class EmptyState extends SummaryState {}

class LoadingState extends SummaryState {}

class LoadedState extends SummaryState {
  final SummaryCardModel model;

  LoadedState({@required this.model});
}

class ErrorState extends SummaryState {
  final String message;

  ErrorState({@required this.message});
}
