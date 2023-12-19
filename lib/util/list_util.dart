extension SafeListAccess<T> on List<T> {
  T? getOrNull(int index) => (index >= 0 && index < length) ? this[index] : null;
}
