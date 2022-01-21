import 'package:hive/hive.dart';

part 'token_models.g.dart';

@HiveType(typeId: 1)
class TokenModel {
  @HiveField(0)
  String token;

  TokenModel({required this.token});
}
