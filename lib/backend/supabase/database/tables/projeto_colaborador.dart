import '../database.dart';

class ProjetoColaboradorTable extends SupabaseTable<ProjetoColaboradorRow> {
  @override
  String get tableName => 'projeto_colaborador';

  @override
  ProjetoColaboradorRow createRow(Map<String, dynamic> data) =>
      ProjetoColaboradorRow(data);
}

class ProjetoColaboradorRow extends SupabaseDataRow {
  ProjetoColaboradorRow(super.data);

  @override
  SupabaseTable get table => ProjetoColaboradorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get projetoId => getField<int>('projeto_id');
  set projetoId(int? value) => setField<int>('projeto_id', value);

  int? get usuarioId => getField<int>('usuario_id');
  set usuarioId(int? value) => setField<int>('usuario_id', value);
}
