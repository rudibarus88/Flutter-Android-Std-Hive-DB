import 'package:hive/hive.dart';
part 'saham.g.dart';

@HiveType()
class Saham {
  @HiveField(0)
  String name;
  @HiveField(1)
  int level;

  Saham (this.name, this.level);
}