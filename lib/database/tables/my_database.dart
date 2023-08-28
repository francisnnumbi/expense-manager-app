import 'dart:io';


import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../daos/categories/categories_dao.dart';
import '../daos/costs/costs_dao.dart';
import 'categories.dart';
import 'costs.dart';


part 'my_database.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(
  tables: [Costs, Categories],
  daos: [CostsDao, CategoriesDao],
)
class MyDatabase extends _$MyDatabase{
  MyDatabase():super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration{
    return MigrationStrategy(
      onCreate: (Migrator m)async{
        await m.createAll();
      }
    );
  }
}