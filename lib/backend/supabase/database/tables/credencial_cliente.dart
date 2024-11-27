import '../database.dart';

class CredencialClienteTable extends SupabaseTable<CredencialClienteRow> {
  @override
  String get tableName => 'credencial_cliente';

  @override
  CredencialClienteRow createRow(Map<String, dynamic> data) =>
      CredencialClienteRow(data);
}

class CredencialClienteRow extends SupabaseDataRow {
  CredencialClienteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CredencialClienteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  String? get detalhes => getField<String>('detalhes');
  set detalhes(String? value) => setField<String>('detalhes', value);

  int? get clienteId => getField<int>('cliente_id');
  set clienteId(int? value) => setField<int>('cliente_id', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);
}
