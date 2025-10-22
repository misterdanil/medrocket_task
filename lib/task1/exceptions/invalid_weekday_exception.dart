class InvalidWeekdayException implements Exception {
  int weekday;

  InvalidWeekdayException(this.weekday);

  @override
  String toString() {
    return "The week day '$weekday' is invalid";
  }
}