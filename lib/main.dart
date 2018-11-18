import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loc Bo'),
        ),
        body: Center(
            //child: Text('Hey Jude, Lale'),
            //child: Text(wordPair.asPascalCase),
            //child: RandomWords(),
            child: _container,
        ),
      ),
    );
  }
}
var _ltext = Text("Ro",
  style: TextStyle(
      color: Colors.white.withOpacity(1.0),
      fontSize: 50.0
  ),);


var _container = Container(
  color: Colors.purple,
  width: 300,
  height: 400,
  margin: EdgeInsets.all(16.0),
  child: Center(
    child: Column(
      children: <Widget>[_ltext, _ltext, _ltext, _ltext, _ltext],

    ),
  )
);


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


//Lưu trạng thái của RandomWords
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];  //Mảng WordPair
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
   // final wordPair = WordPair.random();
   // return Text(wordPair.asUpperCase);
    return Scaffold (
      appBar: AppBar(
        title: Text('List view of WordPair'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested word pairing,
        // and places each suggestion into a ListTile row.
        // For even rows, the function adds a ListTile row for the word pairing.
        // For odd rows, the function adds a Divider widget to visually
        // separate the entries. Note that the divider may be difficult
        // to see on smaller devices.
        itemBuilder: (context, i) {
          // Add a one-pixel-high divider widget before each row in theListView.
          if (i.isOdd) return Divider();

          // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView,
          // minus the divider widgets.
          final index = i ~/ 2;
          // If you've reached the end of the available word pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}