import "dart:async";
import "dart:math" as math;

import 'package:scooby_phrases/model/scooby_model.dart';

class ScoobyBloc {
  StreamController<ScoobyModel> _streamController = StreamController();
  Stream<ScoobyModel> get scoobyStream => _streamController.stream;
  int index = 0;
  void generatePhrase() {
    _streamController.sink.add(_randomPhrase());
  }

  ScoobyModel _randomPhrase() {
    return scoobyDooPhrases[math.Random().nextInt(scoobyDooPhrases.length)];
  }

  void dispose() {
    _streamController.close();
  }
}
