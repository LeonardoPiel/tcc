import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(super.data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  DateTime? get dataCadastro => getField<DateTime>('data_cadastro');
  set dataCadastro(DateTime? value) =>
      setField<DateTime>('data_cadastro', value);

  int? get nivelId => getField<int>('nivel_id');
  set nivelId(int? value) => setField<int>('nivel_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool get ativo => getField<bool>('ativo')!;
  set ativo(bool value) => setField<bool>('ativo', value);
}
