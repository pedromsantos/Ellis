import XCTest
import Ellis

class ChordBuilderTests: XCTestCase
{
    func test_that_it_should_create_major_triad()
    {
        let builder = ChordBuilder(root: Note.C)

        let chord = builder
        .addMajorThird()
        .addPerfectFifth()
        .build()

        let expectedNotes = [Note.C, Note.E, Note.G]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_major_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.C)

        let chord = builder
        .addMajorThird()
        .addPerfectFifth()
        .addMajorSeventh()
        .build()

        let expectedNotes = [Note.C, Note.E, Note.G, Note.B]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_dominant_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.C)

        let chord = builder
        .addMajorThird()
        .addPerfectFifth()
        .addMinorSeventh()
        .build()

        let expectedNotes = [Note.C, Note.E, Note.G, Note.BFlat]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_minor_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.C)

        let chord = builder
        .addMinorThird()
        .addPerfectFifth()
        .addMinorSeventh()
        .build()

        let expectedNotes = [Note.C, Note.EFlat, Note.G, Note.BFlat]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_minor_seventh_flat_5_chord()
    {
        let builder = ChordBuilder(root: Note.C)

        let chord = builder
        .addMinorThird()
        .addDiminishedFifth()
        .addMinorSeventh()
        .build()

        let expectedNotes = [Note.C, Note.EFlat, Note.GFlat, Note.BFlat]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_diminished_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.C)

        let chord = builder
        .addMinorThird()
        .addDiminishedFifth()
        .addDiminishedSeventh()
        .build()

        let expectedNotes = [Note.C, Note.EFlat, Note.GFlat, Note.A]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_diminished_seventh_chord_from_intervals()
    {
        let intervals = ChordFunction.Diminished7.Intervals
        let builder = ChordBuilder(root: Note.C)

        var noteFunctionIndex = 1
        for interval in intervals
        {
            builder.addNoteWithInterval(interval, function: NoteFunction(rawValue: noteFunctionIndex)!)
            noteFunctionIndex++
        }

        let chord = builder.build()

        let expectedNotes = [Note.C, Note.EFlat, Note.GFlat, Note.A]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_chord_from_root_and_function()
    {
        let chord = ChordBuilder(root: Note.C, chordFunction: ChordFunction.Diminished7).build()

        let expectedNotes = [Note.C, Note.EFlat, Note.GFlat, Note.A]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func assertNotesSameAsExpectedNotes(expectedNotes: [Note], actualNotes: [Note])
    {
        for var i = 0; i < actualNotes.count; i++
        {
            let expectedNote: Note = expectedNotes[i]
            let actualNote: Note = actualNotes[i]
            XCTAssertEqual(expectedNote, actualNote,
                           "expected note:\(expectedNote.Name) actual note:\(actualNote.Name)")
        }
    }
}