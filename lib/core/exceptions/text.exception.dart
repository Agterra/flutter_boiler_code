class TextException implements Exception {
  final String message;

  TextException({required this.message});

  @override
  String toString() {
    return message;
  }
}
