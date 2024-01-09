import 'dart:async';

/// Singleton moduleType streamController to be observed by many different viewModels
class ModuleTypeStreamController {
  // Singleton instance
  static final ModuleTypeStreamController _singleton = ModuleTypeStreamController._internal();

  // Internal constructor
  ModuleTypeStreamController._internal();

  // Factory constructor to get the singleton instance
  factory ModuleTypeStreamController() => _singleton;

  // StreamController for your data
  final _dataController = StreamController<int>.broadcast();

  // Stream to expose data changes
  Stream<int> get dataStream => _dataController.stream;

  // Function to add data to the stream
  void updateData(int newData) {
    _dataController.add(newData);
  }

  // Dispose method to close the stream controller
  void dispose() {
    _dataController.close();
  }
}
