// Module type: DMC, TOTO, MAGNUM, etc
enum HistoryWinStatus {
  none(0),
  hit(1), // Exact hit
  pau(2), // Pau (permutation)
  expired(99); // No longer tracked for future hits

  const HistoryWinStatus(this.id);
  final int id;
}