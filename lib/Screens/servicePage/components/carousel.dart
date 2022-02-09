import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ap4_askhim/models/serviceDetails.dart';
import 'package:ap4_askhim/services/serviceDetails.dart';

// ignore: camel_case_types
class carousel extends StatefulWidget {
  final int id;
  const carousel({Key? key, required this.id}) : super(key: key);

  @override
  State<carousel> createState() => _carouselState();
}

class _carouselState extends State<carousel> {
  Future<Map<String, dynamic>?>? _service_details;
  initState() {
    _service_details = serviceDetails.getServiceDetails(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
      ),
      items: [
        FutureBuilder<Map<String, dynamic>?>(
          future: _service_details,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(snapshot.data!['photos'].length == 0
                        ? snapshot.data!["type"]["defaultPhoto"]
                        : snapshot.data!["photos"]["libelle"]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
