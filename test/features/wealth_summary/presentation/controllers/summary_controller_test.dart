import 'dart:async';

import 'package:fliper_flutter_test/core/domain/error/app_errors.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_controller.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_event.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GetWealthSummaryMock extends Mock implements GetWealthSummary {}

void main() {
  final getWealthSummary = GetWealthSummaryMock();
  final controller = SummaryController(getWealthSummary);

  test('Should return a Wealth Summary Card Model', () async {
    when(getWealthSummary.call()).thenAnswer((_) async => WealthSummary());
    scheduleMicrotask(() {
      controller.add(LoadSummaryEvent());
    });
    await expectLater(
      controller.stateStream,
      emitsInOrder([
        isA<LoadingState>(),
        isA<LoadedState>(),
      ]),
    );
  });

  test('Should throw a Server Error', () async {
    when(getWealthSummary.call()).thenThrow(ServerError());
    scheduleMicrotask(() {
      controller.add(LoadSummaryEvent());
    });
    await expectLater(
      controller.stateStream,
      emitsInOrder([
        isA<LoadingState>(),
        isA<ErrorState>(),
      ]),
    );
  });

  test('Should throw a Connection Error', () async {
    when(getWealthSummary.call()).thenThrow(ConnectionError());
    scheduleMicrotask(() {
      controller.add(LoadSummaryEvent());
    });
    await expectLater(
      controller.stateStream,
      emitsInOrder([
        isA<LoadingState>(),
        isA<ErrorState>(),
      ]),
    );
  });
}
