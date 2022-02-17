import 'package:flutter/material.dart';

class ResultSearchPage extends StatefulWidget {
  final String searchTerm;
  ResultSearchPage({Key? key, required this.searchTerm}) : super(key: key);

  @override
  State<ResultSearchPage> createState() => _ResultSearchPageState();
}

class _ResultSearchPageState extends State<ResultSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('${widget.searchTerm}'));
  }
}
