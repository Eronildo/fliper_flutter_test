class WealthSummaryQueries {
  WealthSummaryQueries._();

  static String get summaryQuery => '''
query MyQuery {
  wealthSummary {
    total
    profitability
    cdi
    gain
  }
}
''';
}
