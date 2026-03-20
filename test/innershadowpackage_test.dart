void main() {
  // group('InnerShadow Widget Tests', () {
  //   testWidgets('renders child widget', (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       MaterialApp(
  //         home: InnerShadow(
  //           shadows: const [
  //             Shadow(
  //               color: Colors.black38,
  //               blurRadius: 10,
  //               offset: Offset(4, 4),
  //             ),
  //           ],
  //           child: Container(width: 100, height: 100, color: Colors.grey),
  //         ),
  //       ),
  //     );
  //
  //     expect(find.byType(Container), findsOneWidget);
  //   });
  //
  //   testWidgets('renders with empty shadows list', (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       MaterialApp(
  //         home: InnerShadow(
  //           shadows: const [],
  //           child: Container(width: 100, height: 100, color: Colors.blue),
  //         ),
  //       ),
  //     );
  //
  //     expect(find.byType(Container), findsOneWidget);
  //   });
  //
  //   testWidgets('renders with BorderRadius', (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       MaterialApp(
  //         home: InnerShadow(
  //           shadows: const [
  //             Shadow(
  //               color: Colors.black26,
  //               blurRadius: 8,
  //               offset: Offset(3, 3),
  //             ),
  //           ],
  //           borderRadius: BorderRadius.circular(16), // ✅ removed const issue
  //           child: Container(
  //             width: 120,
  //             height: 120,
  //             decoration: BoxDecoration(
  //               color: Colors.grey.shade300,
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //
  //     expect(find.byType(InnerShadow), findsOneWidget);
  //   });
  //
  //   testWidgets('renders with multiple shadows', (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       MaterialApp(
  //         home: InnerShadow(
  //           shadows: const [
  //             Shadow(
  //               color: Colors.black26,
  //               blurRadius: 12,
  //               offset: Offset(6, 6),
  //             ),
  //             Shadow(
  //               color: Colors.white70,
  //               blurRadius: 12,
  //               offset: Offset(-6, -6),
  //             ),
  //           ],
  //           borderRadius: BorderRadius.circular(20),
  //           child: Container(
  //             width: 150,
  //             height: 150,
  //             decoration: const BoxDecoration(
  //               color: Color(0xFFE0E0E0),
  //               borderRadius: BorderRadius.all( // ✅ FIXED
  //                 Radius.circular(20),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //
  //     expect(find.byType(InnerShadow), findsOneWidget);
  //
  //     final widget = tester.widget<InnerShadow>(
  //       find.byType(InnerShadow),
  //     );
  //
  //     expect(widget.shadows.length, 2); // ✅ better assertion
  //   });
  //
  //   testWidgets('InnerShadowContainer renders correctly',
  //           (WidgetTester tester) async {
  //         await tester.pumpWidget(
  //           MaterialApp(
  //             home: InnerShadowContainer(
  //               width: 160,
  //               height: 160,
  //               decoration: const BoxDecoration(
  //                 color: Color(0xFFE0E0E0),
  //                 borderRadius: BorderRadius.all( // ✅ FIXED
  //                   Radius.circular(20),
  //                 ),
  //               ),
  //               shadows: const [
  //                 Shadow(
  //                   color: Colors.black26,
  //                   blurRadius: 12,
  //                   offset:  Offset(5, 5),
  //                 ),
  //               ],
  //               child: const Icon(Icons.favorite),
  //             ),
  //           ),
  //         );
  //
  //         expect(find.byType(InnerShadowContainer), findsOneWidget);
  //         expect(find.byIcon(Icons.favorite), findsOneWidget);
  //       });
  // });
}