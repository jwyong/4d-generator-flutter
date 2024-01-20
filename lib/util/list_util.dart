extension SafeListAccess<T> on List<T> {
  T? getOrNull(int index) => (index >= 0 && index < length) ? this[index] : null;
}

extension ListExtension<E> on List<E>? {
  List<E> orEmpty() {
    return this ?? <E>[];
  }
}
