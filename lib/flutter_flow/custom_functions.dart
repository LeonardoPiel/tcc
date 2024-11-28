

DateTime stringToDate(String string) {
  // vou informar uma string com numeros e / e preciso converter para o formato data yyyy-mm-dd
  final List<String> parts = string.split('/');
  final int day = int.parse(parts[0]);
  final int month = int.parse(parts[1]);
  final int year = int.parse(parts[2]);
  final String formattedDate =
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  return DateTime.parse(formattedDate);
}

double currencyRealDouble(String input) {
// Tratando entradas vazias
  if (input.isEmpty) return 0.0;

  // Remove todos os caracteres não numéricos
  var noSpecialChar = input.replaceAll(RegExp(r'[^0-9.,-]'), '');

  // verifica se é negativo.
  final isNegative = noSpecialChar.startsWith('-');
  if (isNegative) {
    noSpecialChar = noSpecialChar.substring(1);
  }

  // Substitui vírgula por ponto.
  final normalizedInput = noSpecialChar.replaceAll(',', '.');

  final parts = normalizedInput.split('.');
  final intPart = parts[0];
  final decimalPart = parts.length > 1 ? parts[1] : '00';

  final combinedInput = '$intPart,$decimalPart';

  final value = double.tryParse(combinedInput) ?? 0.0;

  return isNegative ? -value : value;
}

