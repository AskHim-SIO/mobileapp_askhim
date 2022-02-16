import 'package:ap4_askhim/services/auth_service.dart';
import 'package:ap4_askhim/services/base_service.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../constants.dart';

class SearchBar extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchBar> {
  static const historyLength = 5;

  List<String> filteredSearchHistory = [];

  String? selectedTerm;

  FloatingSearchBarController? controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
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
          setState(() {});
        },
        onSubmitted: (query) {
          setState(() {
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
                                  setState(() {});
                                },
                              ),
                              onTap: () {
                                setState(() {
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

      return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
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
        ),
      );
    }
  }
}
