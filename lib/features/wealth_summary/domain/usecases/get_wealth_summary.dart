import 'package:fliper_flutter_test/core/domain/error/app_errors.dart';
import 'package:fliper_flutter_test/core/domain/services/connection_service.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';
import '../entities/wealth_summary.dart';

abstract class GetWealthSummary {
  Future<WealthSummary> call();
}

class GetWealthSummaryImpl implements GetWealthSummary {
  final WealthSummaryRepository repository;
  final ConnectionService connectionService;

  GetWealthSummaryImpl(this.repository, this.connectionService);

  @override
  Future<WealthSummary> call() async {
    final connectionResult = await connectionService.isOnline();
    if (!connectionResult) throw ConnectionError(message: 'Você está offline.');
    return repository.getWealthSummary();
  }
}
