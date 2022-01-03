import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Body extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Body> {
  static const historyLength = 5;
  final List<String> _searchHistory = ['1', "20", '2', 'new'];

  List<String>? filteredSearchHistory;

  String? selectedTerm;

  List<String>? filteredSearchTerm({
    @required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    }
  }
  // TODO: Add search history here

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,

      // TODO: Add the FloatingSearchBar here
      // ignore: prefer_const_constructors
      body: SearchResultsListView(
        searchTerm: null,
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String? searchTerm;

  const SearchResultsListView({
    Key? key,
    required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Text('Acceuil', style: TextStyle(fontSize: 60))],
        ),
      );
    }

    return ListView(
      children: List.generate(
        50,
        (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
