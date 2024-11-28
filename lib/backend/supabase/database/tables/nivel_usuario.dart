import '../database.dart';

class NivelUsuarioTable extends SupabaseTable<NivelUsuarioRow> {
  @override
  String get tableName => 'nivel_usuario';

  @override
  NivelUsuarioRow createRow(Map<String, dynamic> data) => NivelUsuarioRow(data);
}

class NivelUsuarioRow extends SupabaseDataRow {
  NivelUsuarioRow(super.data);

  @override
  SupabaseTable get table => NivelUsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nivel => getField<String>('nivel');
  set nivel(String? value) => setField<String>('nivel', value);
}
