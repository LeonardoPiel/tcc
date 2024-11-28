import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:tcc_leo/backend/supabase/supabase.dart';
import 'package:tcc_leo/clientes/clientes/clientes_widget.dart';
import 'package:tcc_leo/main.dart';
import 'package:tcc_leo/paginas/biblioteca/biblioteca_widget.dart';
import 'package:tcc_leo/paginas/equipe/equipe_widget.dart';
import 'package:tcc_leo/paginas/financeiro/financeiro_widget.dart';
import 'package:tcc_leo/projetos/projetos/projetos_widget.dart';

void main() {
  late SupabaseClient mockSupabase;
  late MockSupabaseHttpClient mockHttpClient;
  SharedPreferences.setMockInitialValues({});

  setUpAll(() async {
    await Supabase.initialize(
      url: 'https://mock.supabase.co',
      anonKey: 'fakeAnonKey',
      debug: true,
      httpClient: MockSupabaseHttpClient(),
    );

    // Mock Supabase client for backend calls
    mockHttpClient = MockSupabaseHttpClient();
    mockSupabase = SupabaseClient('https://mock.supabase.co', 'fakeAnonKey',
        httpClient: mockHttpClient);
  });

  testWidgets('O sistema deve iniciar sem erros', (WidgetTester tester) async {
    //builda o sistema
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // verifica se o main widget MyApp renderizou.
    expect(find.byType(MyApp), findsOneWidget);
  });

  testWidgets('Tela "Financeiro" deve iniciar sem erros',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: FinanceiroWidget(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that our widget is rendered.
    expect(find.byType(FinanceiroWidget), findsOneWidget);
  });
  testWidgets('Tela "Clientes" deve iniciar sem erros',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ClientesWidget(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that our widget is rendered.
    expect(find.byType(ClientesWidget), findsOneWidget);
  });
  testWidgets('Tela "Projetos" deve iniciar sem erros',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ProjetosWidget(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that our widget is rendered.
    expect(find.byType(ProjetosWidget), findsOneWidget);
  });
  testWidgets('Tela "Biblioteca" deve iniciar sem erros',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BibliotecaWidget(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that our widget is rendered.
    expect(find.byType(BibliotecaWidget), findsOneWidget);
  });
  testWidgets('Tela "Equipe" deve iniciar sem erros',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: EquipeWidget(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that our widget is rendered.
    expect(find.byType(EquipeWidget), findsOneWidget);
  });
}
