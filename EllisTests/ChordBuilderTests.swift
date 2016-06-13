import XCTest
import Ellis

class ChordBuilderTests: XCTestCase
{
    func test_that_it_should_create_major_triad()
    {
        let builder = ChordBuilder(root: Note.c)

        let chord = builder
        .addMajorThird()
        .addPerfectFifth()
        .build()

        let expectedNotes = [Note.c, Note.e, Note.g]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_major_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.c)

        let chord = builder
        .addMajorThird()
        .addPerfectFifth()
        .addMajorSeventh()
        .build()

        let expectedNotes = [Note.c, Note.e, Note.g, Note.b]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_dominant_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.c)

        let chord = builder
        .addMajorThird()
        .addPerfectFifth()
        .addMinorSeventh()
        .build()

        let expectedNotes = [Note.c, Note.e, Note.g, Note.bFlat]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_minor_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.c)

        let chord = builder
        .addMinorThird()
        .addPerfectFifth()
        .addMinorSeventh()
        .build()

        let expectedNotes = [Note.c, Note.eFlat, Note.g, Note.bFlat]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_minor_seventh_flat_5_chord()
    {
        let builder = ChordBuilder(root: Note.c)

        let chord = builder
        .addMinorThird()
        .addDiminishedFifth()
        .addMinorSeventh()
        .build()

        let expectedNotes = [Note.c, Note.eFlat, Note.gFlat, Note.bFlat]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_diminished_seventh_chord()
    {
        let builder = ChordBuilder(root: Note.c)

        let chord = builder
        .addMinorThird()
        .addDiminishedFifth()
        .addDiminishedSeventh()
        .build()

        let expectedNotes = [Note.c, Note.eFlat, Note.gFlat, Note.a]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_diminished_seventh_chord_from_intervals()
    {
        let intervals = ChordFunction.diminished7.Intervals
        let builder = ChordBuilder(root: Note.c)

        var noteFunctionIndex = 1
        for interval in intervals
        {
            let _ = builder.addNoteWithInterval(interval, function: NoteFunction(rawValue: noteFunctionIndex)!)
            noteFunctionIndex += 1
        }

        let chord = builder.build()

        let expectedNotes = [Note.c, Note.eFlat, Note.gFlat, Note.a]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func test_that_it_should_create_chord_from_root_and_function()
    {
        let chord = ChordBuilder(root: Note.c, chordFunction: ChordFunction.diminished7).build()

        let expectedNotes = [Note.c, Note.eFlat, Note.gFlat, Note.a]

        assertNotesSameAsExpectedNotes(expectedNotes, actualNotes: chord.notes)
    }

    func assertNotesSameAsExpectedNotes(_ expectedNotes: [Note], actualNotes: [Note])
    {
        for i in 0 ..< actualNotes.count
        {
            let expectedNote: Note = expectedNotes[i]
            let actualNote: Note = actualNotes[i]
            XCTAssertEqual(expectedNote, actualNote,
                           "expected note:\(expectedNote.Name) actual note:\(actualNote.Name)")
        }
    }
}
