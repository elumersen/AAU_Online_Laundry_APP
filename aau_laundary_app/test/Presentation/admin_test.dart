import 'package:aau_laundary_app/presentation/screens/Admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets("my widget has a refresh,description and  a title",
      (WidgetTester tester) async {
    await tester.pumpWidget(Admin(
     
    ));
    final testFinder = find.text('refresh');
    expect(testFinder, findsOneWidget);
  });

  testWidgets("add a widget todo", (WidgetTester tester) async {
    final addField = find.byKey(ValueKey("icon"));
    final addbutton = find.byKey(ValueKey('drawer'));
    final addnewbutton = find.byKey(ValueKey("column"));
    await tester.pumpWidget(Admin(
    
    ));
    await tester.enterText(addField, "add a widget");
    await tester.tap(addbutton);
    await tester.pump();

    expect(find.text("add a widget"), findsOneWidget);
  });
}
