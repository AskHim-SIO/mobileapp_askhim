import 'package:ap4_askhim/Screens/Search/components/resultPage.dart';
import 'package:ap4_askhim/models/categorieServicePage.dart';
import 'package:ap4_askhim/models/getSearchByQuery.dart';
import 'package:ap4_askhim/services/auth_service.dart';
import 'package:ap4_askhim/services/base_service.dart';
import 'package:ap4_askhim/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchBar> {
  Future<List<GetSearchByQuery?>?>? _searchByQuery;

  List<String> filteredSearchHistory = [];

  String? selectedTerm;
  int count = 4;

  FloatingSearchBarController? controller;

  @override
  void initState() {
    controller = FloatingSearchBarController();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  redirect() {
    if (selectedTerm != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ResultSearchPage(searchTerm: selectedTerm.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 800,
      child: FloatingSearchBar(
        automaticallyImplyBackButton: false,
        backgroundColor: greyInput,
        shadowColor: Colors.white,
        backdropColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(29)),
        controller: controller,
        body: Container(),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: const Center(
          child: Text('Rechercher un service',
              style: TextStyle(fontSize: 15, color: greyInputText)),
        ),
        hint: 'Taper ici pour chercher..',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          // ici qu'on appelle les nouvelle a chque fois que c'est tapé
          _searchByQuery = SearchService.getSearchByQuery(query, count);

          setState(() {});
        },
        onSubmitted: (query) {
          // redirect avec le bouton 'rechercher'
          setState(() {
            selectedTerm = query;
          });
          redirect();
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
                    //redirect vers la page
                    return Container(
                      child: FutureBuilder<List<GetSearchByQuery?>?>(
                          future: _searchByQuery,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.isNotEmpty) {
                                return ListView.separated(
                                    shrinkWrap: true,
                                    separatorBuilder: (context, _) =>
                                        SizedBox(width: 2),
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var recherche = snapshot.data![index];

                                      return Container(
                                        width: 100,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(recherche!.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              onTap: () {
                                                print('tapped');
                                                setState(() {
                                                  selectedTerm = recherche.name;
                                                });
                                                redirect();
                                                controller?.close();
                                              },
                                            ),
                                            Divider(indent: 25, endIndent: 25),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(25.0),
                                    child:
                                        Text('Aucune recherche correspondante'),
                                  ),
                                );
                              }
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
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
                                  // ici qu'on clique sur la croix pour delete
                                  setState(() {});
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  // ici qu'on doit redirect vers la page
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
