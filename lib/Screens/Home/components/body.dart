import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Positioned(
              top: size.height * 0.17,
              child: const Text(
                "Services récents",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: size.height * 0.37,
              child: const Text(
                "Catégories",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: size.height * 0.57,
              child: const Text(
                "Fil d'actualité",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SearchBar(),
          ])
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchBar> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];

  List<String> filteredSearchHistory = [];

  String? selectedTerm;

  List<String> filterSearchTerms({
    required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController? controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: FloatingSearchBar(
        automaticallyImplyBackButton: false,
        backgroundColor: greyInput,
        shadowColor: Colors.white,
        backdropColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(29)),
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Center(
          child: Text(selectedTerm ?? 'Rechercher un service ou un membre',
              style: TextStyle(fontSize: 15, color: greyInputText)),
        ),
        hint: 'Taper ici pour chercher..',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller?.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller!.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller!.query),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller!.query);
                          selectedTerm = controller!.query;
                        });
                        controller?.close();
                      },
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
                                });
                                controller?.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
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
      return Container();
    } else {
      final fsb = FloatingSearchBar.of(context);

      return Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: ListView(
          children: List.generate(
            50,
            (index) => ListTile(
              title: Text('$searchTerm search result'),
              subtitle: Text(index.toString()),
            ),
          ),
        ),
      );
    }
  }
}
