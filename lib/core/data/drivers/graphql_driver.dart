abstract class GraphqlDriver {
  String toJson();
}

class GraphqlDriverImpl implements GraphqlDriver {
  final String query;

  GraphqlDriverImpl(this.query);

  @override
  String toJson() {
    return '''{"query":"${query.trim()}"}''';
  }
}
