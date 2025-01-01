class Logger {
  static void log(String message, {StackTrace? stackTrace}) {
    final timeStamp = DateTime.now().toIso8601String();

    log("$timeStamp: $message");
    if (stackTrace != null) {
      print(stackTrace);
    }
  }
}
