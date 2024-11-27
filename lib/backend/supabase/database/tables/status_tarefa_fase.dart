import '../database.dart';

class StatusTarefaFaseTable extends SupabaseTable<StatusTarefaFaseRow> {
  @override
  String get tableName => 'status_tarefa_fase';

  @override
  StatusTarefaFaseRow createRow(Map<String, dynamic> data) =>
      StatusTarefaFaseRow(data);
}

class StatusTarefaFaseRow extends SupabaseDataRow {
  StatusTarefaFaseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StatusTarefaFaseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  bool get ativo => getField<bool>('ativo')!;
  set ativo(bool value) => setField<bool>('ativo', value);
}
