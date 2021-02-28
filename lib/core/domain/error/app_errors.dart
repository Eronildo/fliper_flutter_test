abstract class AppError implements Exception {
  String get message;
}

class ServerError extends AppError {
  final String message;
  ServerError({this.message});
}

class ConnectionError extends AppError {
  final String message;
  ConnectionError({this.message});
}
