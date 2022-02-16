// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/body.dart';

// ignore: camel_case_types
class servicePage extends StatefulWidget {
  const servicePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<servicePage> createState() => _servicePageState();
}

// ignore: camel_case_types
class _servicePageState extends State<servicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true, //appbar transparent

        body: NestedScrollView(
          // permet de cacher l'appbar quand la page descend
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIScrolled) => [
            SliverAppBar(
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
          body: Body(
            id: widget.id,
          ),
        ));
  }
}
