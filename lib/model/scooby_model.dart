import 'package:meta/meta.dart';

class ScoobyModel {
  const ScoobyModel({
    @required this.characterName,
    @required this.characterPhrase,
    @required this.imagePath,
  });
  final String characterName;
  final String characterPhrase;
  final String imagePath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ScoobyModel &&
              runtimeType == other.runtimeType &&
              characterName == other.characterName &&
              characterPhrase == other.characterPhrase &&
              imagePath == other.imagePath;

  @override
  int get hashCode =>
      characterName.hashCode ^ characterPhrase.hashCode ^ imagePath.hashCode;
}

List<ScoobyModel> scoobyDooPhrases = [
  ScoobyModel(
    characterName: "Velma Dinkley",
    characterPhrase: "Zoinks",
    imagePath: "assets/Velma.png",
  ),
  ScoobyModel(
    characterName: "Velma Dinkley",
    characterPhrase: "Jinkies",
    imagePath: "assets/Velma.png",
  ),
  ScoobyModel(
    characterName: "Daphne Blake",
    characterPhrase: "Jeepers",
    imagePath: "assets/Daphne.png",
  ),
  ScoobyModel(
    characterName: "Scooby-Doo",
    characterPhrase: "Scooby-Dooby-Doo!",
    imagePath: "assets/Scooby.png",
  ),
  ScoobyModel(
    characterName: "Fred Jones",
    characterPhrase: "Hold the phone",
    imagePath: "assets/Fred.png",
  ),
  ScoobyModel(
    characterName: "Fred Jones",
    characterPhrase: "Light it up",
    imagePath: "assets/Fred.png",
  ),
  ScoobyModel(
    characterName: "Shaggy Rogers",
    characterPhrase:
    "One for the money, Two for the show, Three to get ready and here I go...",
    imagePath: "assets/Shaggy.png",
  ),
  ScoobyModel(
    characterName: "Scrappy Doo",
    characterPhrase: "Puppy power",
    imagePath: "assets/Scrappy.png",
  ),
  ScoobyModel(
    characterName: "Evil People",
    characterPhrase: "You meddling kids",
    imagePath: "assets/Villian.png",
  ),
];
