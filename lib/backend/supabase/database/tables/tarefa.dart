import '../database.dart';

class TarefaTable extends SupabaseTable<TarefaRow> {
  @override
  String get tableName => 'tarefa';

  @override
  TarefaRow createRow(Map<String, dynamic> data) => TarefaRow(data);
}

class TarefaRow extends SupabaseDataRow {
  TarefaRow(super.data);

  @override
  SupabaseTable get table => TarefaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get faseProjetoId => getField<int>('fase_projeto_id');
  set faseProjetoId(int? value) => setField<int>('fase_projeto_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
