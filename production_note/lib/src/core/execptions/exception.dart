abstract class GlobalException {
  final String message;
  final StackTrace? stackTrace;

  const GlobalException(this.message, [this.stackTrace]);

  @override
  String toString() {
    var traceText = '';

    if (stackTrace != null) {
      traceText = '\n$stackTrace';
    }

    return '$runtimeType: $message$traceText';
  }
}
