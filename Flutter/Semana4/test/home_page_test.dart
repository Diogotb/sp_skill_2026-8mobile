import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_notes/providers/theme_provider.dart';
import 'package:my_notes/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  testWidgets('HomePage has QuickNotes button, AppBar, and RecentNotes Container',
          (WidgetTester tester) async {
            await tester.pumpWidget(
              MultiProvider(
                providers: [
                  ChangeNotifierProvider<ThemeProvider>(
                    create: (_) => ThemeProvider(),
                  ),
                ],
                child: MaterialApp(
                  home: MediaQuery(
                    data: const MediaQueryData(size: Size(600, 1200)),
                    child: const Scaffold(
                      body: SingleChildScrollView(child: HomePage()),
                    ),
                  ),
                ),
              ),
            );


        await tester.pumpAndSettle();

        expect(find.text('Nota Rápida'), findsOneWidget);

        expect(find.text('Recentes'), findsOneWidget);

        expect(find.byIcon(Icons.book), findsOneWidget);
        expect(find.byIcon(Icons.category), findsOneWidget);
      });
}
