import 'package:hive/hive.dart';
part 'notemodile.g.dart';
@HiveType(typeId: 0)
class Notemodile extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String suptitle;
  @HiveField(2)
  final String data;
  @HiveField(3)
  final int color;

  Notemodile({
    required this.title,
    required this.suptitle,
    required this.data,
    required this.color,
  });
}
