import 'package:hive/hive.dart';

part 'search_history_models.g.dart';

@HiveType(typeId: 0)
class SearchHistoryModel {
  @HiveField(0)
  List<String> searchWord;

  SearchHistoryModel({
    required this.searchWord,
  });
}
