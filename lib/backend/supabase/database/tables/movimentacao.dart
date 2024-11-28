import '../database.dart';

class MovimentacaoTable extends SupabaseTable<MovimentacaoRow> {
  @override
  String get tableName => 'movimentacao';

  @override
  MovimentacaoRow createRow(Map<String, dynamic> data) => MovimentacaoRow(data);
}

class MovimentacaoRow extends SupabaseDataRow {
  MovimentacaoRow(super.data);

  @override
  SupabaseTable get table => MovimentacaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get lancamentoTipo => getField<int>('lancamento_tipo');
  set lancamentoTipo(int? value) => setField<int>('lancamento_tipo', value);

  double get valor => getField<double>('valor')!;
  set valor(double value) => setField<double>('valor', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get clienteId => getField<int>('cliente_id');
  set clienteId(int? value) => setField<int>('cliente_id', value);

  int? get usuarioId => getField<int>('usuario_id');
  set usuarioId(int? value) => setField<int>('usuario_id', value);

  int? get projetoId => getField<int>('projeto_id');
  set projetoId(int? value) => setField<int>('projeto_id', value);

  DateTime? get dataLancamento => getField<DateTime>('data_lancamento');
  set dataLancamento(DateTime? value) =>
      setField<DateTime>('data_lancamento', value);

  DateTime? get dataVencimento => getField<DateTime>('data_vencimento');
  set dataVencimento(DateTime? value) =>
      setField<DateTime>('data_vencimento', value);

  bool get statusPagamento => getField<bool>('status_pagamento')!;
  set statusPagamento(bool value) => setField<bool>('status_pagamento', value);
}
