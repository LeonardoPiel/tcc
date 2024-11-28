import '../database.dart';

class AnexoBibliotecaTable extends SupabaseTable<AnexoBibliotecaRow> {
  @override
  String get tableName => 'anexo_biblioteca';

  @override
  AnexoBibliotecaRow createRow(Map<String, dynamic> data) =>
      AnexoBibliotecaRow(data);
}

class AnexoBibliotecaRow extends SupabaseDataRow {
  AnexoBibliotecaRow(super.data);

  @override
  SupabaseTable get table => AnexoBibliotecaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get nomeArquivo => getField<String>('nome_arquivo');
  set nomeArquivo(String? value) => setField<String>('nome_arquivo', value);

  int? get bibliotecaId => getField<int>('biblioteca_id');
  set bibliotecaId(int? value) => setField<int>('biblioteca_id', value);
}
