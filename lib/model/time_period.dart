// Time period for use in filters (past results, hot numbers, analytics, etc)
enum TimePeriod {
  year_1(31536000),
  year_2(63072000),
  year_3(94608000),
  year_5(157680000),
  year_10(315360000),
  year_15(473040000),
  all(null);

  const TimePeriod(this.unixTimeStampSeconds);
  final num? unixTimeStampSeconds;
}