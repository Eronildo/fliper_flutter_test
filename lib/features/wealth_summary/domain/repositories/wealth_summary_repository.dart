import '../entities/wealth_summary.dart';

abstract class WealthSummaryRepository {
  Future<WealthSummary> getWealthSummary();
}
