import '../database.dart';

class FaseProjetoTable extends SupabaseTable<FaseProjetoRow> {
  @override
  String get tableName => 'fase_projeto';

  @override
  FaseProjetoRow createRow(Map<String, dynamic> data) => FaseProjetoRow(data);
}

class FaseProjetoRow extends SupabaseDataRow {
  FaseProjetoRow(super.data);

  @override
  SupabaseTable get table => FaseProjetoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get projetoId => getField<int>('projeto_id');
  set projetoId(int? value) => setField<int>('projeto_id', value);

  DateTime? get dataInicio => getField<DateTime>('data_inicio');
  set dataInicio(DateTime? value) => setField<DateTime>('data_inicio', value);

  DateTime? get dataFim => getField<DateTime>('data_fim');
  set dataFim(DateTime? value) => setField<DateTime>('data_fim', value);
}
