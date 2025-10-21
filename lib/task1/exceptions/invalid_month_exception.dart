class InvalidMonthException implements Exception {
  final int month;

  InvalidMonthException(this.month);

  @override
  String toString() {
    return "The month '$month' is invalid";
  }
}
