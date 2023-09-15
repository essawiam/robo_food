import 'dart:collection';

extension QueueExtension<T> on Queue<T> {
  List<T> getAndRemoveItems() {
    List<T> items = [];

    // Determine how many items to get (up to 12 or the queue size).
    int countToGet = length <= 12 ? length : 12;

    for (int i = 0; i < countToGet; i++) {
      items.add(removeFirst());
    }

    return items;
  }
}
