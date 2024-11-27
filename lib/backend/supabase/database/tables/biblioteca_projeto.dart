import '../database.dart';

class BibliotecaProjetoTable extends SupabaseTable<BibliotecaProjetoRow> {
  @override
  String get tableName => 'biblioteca_projeto';

  @override
  BibliotecaProjetoRow createRow(Map<String, dynamic> data) =>
      BibliotecaProjetoRow(data);
}

class BibliotecaProjetoRow extends SupabaseDataRow {
  BibliotecaProjetoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BibliotecaProjetoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  int? get projetoId => getField<int>('projeto_id');
  set projetoId(int? value) => setField<int>('projeto_id', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  String? get arquivo => getField<String>('arquivo');
  set arquivo(String? value) => setField<String>('arquivo', value);
}
