import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../../app/layouts/app_layout.dart';

class RandomWordsPage extends StatefulWidget {
  @override
  _RandomWordsPageState createState() => _RandomWordsPageState();
}

class _RandomWordsPageState extends State<RandomWordsPage> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _isSavedByWordPair = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _onPressListButton,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) {
          return const Divider();
        }

        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool isSaved = _isSavedByWordPair.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        _onTapRow(pair, isSaved);
      },
    );
  }

  void _onPressListButton() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _isSavedByWordPair.map(
        (WordPair pair) {
          return ListTile(
            title: Text(pair.asPascalCase, style: _biggerFont),
          );
        },
      );
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return AppLayout(
          title: 'Saved Suggestions', child: ListView(children: divided));
    }));
  }

  void _onTapRow(WordPair pair, bool isSaved) {
    setState(() {
      if (isSaved) {
        _isSavedByWordPair.remove(pair);
      } else {
        _isSavedByWordPair.add(pair);
      }
    });
  }
}
