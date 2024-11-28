import '../database.dart';

class LancamentoTipoTable extends SupabaseTable<LancamentoTipoRow> {
  @override
  String get tableName => 'lancamento_tipo';

  @override
  LancamentoTipoRow createRow(Map<String, dynamic> data) =>
      LancamentoTipoRow(data);
}

class LancamentoTipoRow extends SupabaseDataRow {
  LancamentoTipoRow(super.data);

  @override
  SupabaseTable get table => LancamentoTipoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get apelido => getField<String>('apelido');
  set apelido(String? value) => setField<String>('apelido', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String get tipo => getField<String>('tipo')!;
  set tipo(String value) => setField<String>('tipo', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);
}
