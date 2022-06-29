import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Destini(),
      theme: ThemeData.dark(),
    ),
  );
}

StoryBrain storyBrain = StoryBrain();

class Destini extends StatefulWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  State<Destini> createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  Visibility button(
    String choice,
    int choiceNumber,
    bool isVisible,
  ) {
    return Visibility(
      visible: isVisible,
      replacement: const SizedBox(height: 10),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
            ),
            onPressed: () {
              setState(() {
                storyBrain.increment(choiceNumber);
              });
            },
            child: Text(
              choice,
              style: textStyle.copyWith(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      storyBrain.getTitle(),
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              button(storyBrain.getChoiceOne(), 1, true),
              button(
                storyBrain.getChoiceTwo(),
                2,
                storyBrain.isVisible(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
