import 'package:drift/drift.dart';


class DictionaryTable extends Table{
  @override
  String get tableName => 'engineers';
  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get eng => text().named('eng')();
  TextColumn get myan => text().named('myan')();
  TextColumn get type => text().named('type')();
  BoolColumn get favourite => boolean().nullable().named('favourite')();

}