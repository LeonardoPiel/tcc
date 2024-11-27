import '../database.dart';

class ProjetoTable extends SupabaseTable<ProjetoRow> {
  @override
  String get tableName => 'projeto';

  @override
  ProjetoRow createRow(Map<String, dynamic> data) => ProjetoRow(data);
}

class ProjetoRow extends SupabaseDataRow {
  ProjetoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProjetoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  DateTime? get dataInicio => getField<DateTime>('data_inicio');
  set dataInicio(DateTime? value) => setField<DateTime>('data_inicio', value);

  String? get contatoProjeto => getField<String>('contato_projeto');
  set contatoProjeto(String? value) =>
      setField<String>('contato_projeto', value);

  int? get clienteId => getField<int>('cliente_id');
  set clienteId(int? value) => setField<int>('cliente_id', value);

  bool get ativo => getField<bool>('ativo')!;
  set ativo(bool value) => setField<bool>('ativo', value);
}
