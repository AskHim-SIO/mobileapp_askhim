import 'package:ap4_askhim/Screens/servicePage/servicePage.dart';
import 'package:ap4_askhim/components/card_bloc_rectangle.dart';
import 'package:ap4_askhim/models/getSearchByQuery.dart';
import 'package:ap4_askhim/services/search_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultSearchPage extends StatefulWidget {
  final String searchTerm;
  ResultSearchPage({Key? key, required this.searchTerm}) : super(key: key);

  @override
  State<ResultSearchPage> createState() => _ResultSearchPageState();
}

class _ResultSearchPageState extends State<ResultSearchPage> {
  Future<List<GetSearchByQuery?>?>? _searchByQuery;
  Future<List<GetSearchByQuery?>?>? _filteredSearch;

  @override
  void initState() {
    super.initState();
    _searchByQuery = _filteredSearch =
        SearchService.getSearchByQuery(widget.searchTerm, 100);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true, //appbar transparent
      resizeToAvoidBottomInset:
          true, //permet de remonter les input quand le clavier apparait
      backgroundColor: Colors.white,
      body: NestedScrollView(
        // permet de cacher l'appbar quand la page descend
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIScrolled) => [
          SliverAppBar(
            title: Text('Résultat de : ${widget.searchTerm}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                )),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  FutureBuilder<List<GetSearchByQuery?>?>(
                    future: _searchByQuery,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var service = snapshot.data![index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => servicePage(
                                      id: service!.id,
                                    ),
                                  ),
                                );
                              },
                              child: buildCard(
                                borderRadius: 15,
                                width: double.infinity,
                                height: double.infinity,
                                linkImage: service!.photos.isEmpty
                                    ? service.type.defaultPhoto
                                    : service.photos[0].libelle.toString(),
                                titleCard: service.name,
                                prix: '${service.price}€',
                                sizeTitle: 15,
                                sizeSubtitle: 15,
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            crossAxisCount: !kIsWeb ? 2 : 4,
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
