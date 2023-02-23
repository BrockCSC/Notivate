import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notivate/views/screens/home.dart'
    show Note, NoteFeedList, NoteFeedListItem;

void main() {
  testWidgets('NoteFeedListItem should display title and subtitle',
      (WidgetTester tester) async {
    // Arrange
    const note = Note(
      id: "1",
      title: "Note #1 Title",
      subtitle: "note #1 subtitle",
    );

    const widget = NoteFeedListItem(note: note);

    // Act: Build NoteFeedListItem widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: widget,
    ));

    // Assert: NoteFeedListItem should display the appropriate title
    expect(
      find.text(note.title),
      findsOneWidget,
      reason: "NoteFeedListItem should display the appropriate title",
    );
    // Assert: NoteFeedListItem should display the appropriate subtitle
    expect(
      find.text(note.subtitle),
      findsOneWidget,
      reason: "NoteFeedListItem should display the appropriate subtitle",
    );
  });

  testWidgets('NoteFeedList should display notes', (WidgetTester tester) async {
    // Arrange
    const notes = [
      Note(
        id: "1",
        title: "Note #1 Title",
        subtitle: "note #1 subtitle",
      ),
      Note(
        id: "2",
        title: "Note #2 Title",
        subtitle: "note #2 subtitle",
      ),
    ];

    const widget = NoteFeedList(notes: notes);

    // Act: Build NoteFeedList widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: widget,
    ));

    // Assert: NoteFeedList should display NoteFeedListItem for each note
    expect(
      find.byWidgetPredicate((widget) => widget is NoteFeedListItem),
      findsNWidgets(2),
      reason: "NoteFeedList should display NoteFeedListItem for each note",
    );
  });
}
