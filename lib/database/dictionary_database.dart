
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engineering_dictionary/database/dictionary_dao.dart';
import 'package:flutter_engineering_dictionary/database/dictionary_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'dictionary_database.g.dart';
@DriftDatabase(tables: [DictionaryTable],daos: [DictionaryDao])
class DictionaryDatabase extends _$DictionaryDatabase{
  DictionaryDatabase() : super(_openDatabase());

  @override
  int get schemaVersion => 1;

}

LazyDatabase _openDatabase(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbFile = File(join(dbFolder.path,'enginnering.db'));
    if(!await dbFile.exists()){
      final blob = await rootBundle.load("assets/engineering.db"); 
      final buffer = blob.buffer;
      await dbFile.writeAsBytes(buffer.asUint8List(blob.offsetInBytes,blob.lengthInBytes));

    }
  

    return NativeDatabase(dbFile);
  });

}