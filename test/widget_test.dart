import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:menu_umkm/main.dart';

void main() {
  testWidgets('ikon favorit berubah saat ditekan', (tester) async {
    await tester.pumpWidget(const MenuUmkmApp());

    // Awalnya belum ada hati penuh
    expect(find.byIcon(Icons.favorite), findsNothing);
    expect(find.byIcon(Icons.favorite_border), findsWidgets);

    // Tekan hati pertama
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();

    // Sekarang ada tepat satu hati penuh
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}