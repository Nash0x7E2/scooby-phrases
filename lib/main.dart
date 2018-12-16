import 'package:flutter/material.dart';
import 'package:scooby_phrases/bloc/scooby_bloc.dart';
import 'package:scooby_phrases/model/scooby_model.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Scooby Phrases",
      color: Colors.green,
      home: ScoobyPhrases(),
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        accentColor: Colors.deepOrangeAccent,
        textTheme: TextTheme(
          body1: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
              color: Colors.white,
              letterSpacing: 1.2),
          body2: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Colors.white,
              letterSpacing: 1.2),
        ),
      ),
    ),
  );
}

class ScoobyPhrases extends StatefulWidget {
  @override
  ScoobyPhrasesState createState() => ScoobyPhrasesState();
}

class ScoobyPhrasesState extends State<ScoobyPhrases>
    with SingleTickerProviderStateMixin {
  ScoobyBloc bloc;
  AnimationController _controller;
  Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    bloc = ScoobyBloc();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _controller.forward();
  }

  @override
  void dispose() {
    bloc.dispose();
    _controller.dispose();
    super.dispose();
  }

  void onFABPress() {
    _controller.reverse().then((_) => _controller.forward());
    bloc.generatePhrase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RotationTransition(
        turns: _controller,
        child: GestureDetector(
          child: Image.asset(
            "assets/Scooby_face.png",
            height: 125.0,
            width: 125.0,
          ),
          onTap: onFABPress,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.pinkAccent,
        child: Center(
          child: StreamBuilder(
            stream: bloc.scoobyStream,
            builder:
                (BuildContext context, AsyncSnapshot<ScoobyModel> snapshot) {
              if (snapshot.hasData) {
                return AnimatedSwitcher(
                    duration: Duration(milliseconds: 800),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: ScoobyContent(
                        key: ValueKey<ScoobyModel>(snapshot.data),
                        model: snapshot.data));
              }
              if (snapshot.hasError) {
                return ScoobyContent(
                  model: ScoobyModel(
                      characterName: "",
                      characterPhrase: "Something went wrong :(",
                      imagePath: null),
                );
              } else {
                return ScoobyContent(
                  model: ScoobyModel(
                      characterName: "Let's being!",
                      characterPhrase:
                          "Click the Scooby Icon in the bottom left",
                      imagePath: null),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ScoobyContent extends StatelessWidget {
  const ScoobyContent({Key key, this.model}) : super(key: key);

  final ScoobyModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          model.imagePath == null
              ? Image.asset(
                  "assets/main_logo.png",
                  height: 250.0,
                  width: 200.0,
                )
              : Image.asset(
                  model.imagePath,
                  height: 250.0,
                  width: 200.0,
                ),
          const SizedBox(height: 20.0),
          Text(
            model.characterName,
            style: theme.textTheme.body2,
          ),
          const SizedBox(height: 20.0),
          Text(
            "'${model.characterPhrase}'",
            textAlign: TextAlign.center,
            style: theme.textTheme.body1,
          ),
        ],
      ),
    );
  }
}
