import XCTest
import Ellis

class KeyTests: XCTestCase
{
    func test_that_c_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.C, Note.D, Note.E, Note.F, Note.G, Note.A, Note.B]

        assertKeyNotesSameAsExpectedNotes(Key.CMajor, expectedNotes: expectedNotes)
    }

    func test_that_a_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.A, Note.B, Note.C, Note.D, Note.E, Note.F, Note.G]

        assertKeyNotesSameAsExpectedNotes(Key.AMinor, expectedNotes: expectedNotes)
    }

    func test_that_a_flat_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.AFlat, Note.BFlat, Note.C, Note.DFlat, Note.EFlat, Note.F, Note.G]

        assertKeyNotesSameAsExpectedNotes(Key.AFlatMajor, expectedNotes: expectedNotes)
    }

    func test_that_g_flat_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.GFlat, Note.AFlat, Note.BFlat, Note.B, Note.DFlat, Note.EFlat, Note.F]

        assertKeyNotesSameAsExpectedNotes(Key.GFlatMajor, expectedNotes: expectedNotes)
    }

    func test_that_e_flat_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.EFlat, Note.F, Note.GFlat, Note.AFlat, Note.BFlat, Note.B, Note.DFlat]

        assertKeyNotesSameAsExpectedNotes(Key.EFlatMinor, expectedNotes: expectedNotes)
    }

    func test_that_a_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.A, Note.B, Note.CSharp, Note.D, Note.E, Note.FSharp, Note.GSharp]

        assertKeyNotesSameAsExpectedNotes(Key.AMajor, expectedNotes: expectedNotes)
    }

    func test_that_c_major_relative_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.A, Note.B, Note.C, Note.D, Note.E, Note.F, Note.G]

        assertKeyNotesSameAsExpectedNotes(Key.CMajor.relativeKey, expectedNotes: expectedNotes)
    }

    func test_that_e_flat_minor_returns_e_as_root()
    {
        let rootName = Key.EFlatMinor.rootName
        XCTAssertEqual(rootName, "Eb");
    }

    func test_that_e_flat_minor_returns_minor_quality()
    {
        let quality = Key.EFlatMinor.quality
        XCTAssertEqual(quality, KeyQuality.Minor);
    }

    func test_that_major_key_relative_returns_minor_key()
    {
        XCTAssertEqual(Key.CMajor.relativeKey.quality, KeyQuality.Minor);
    }

    func assertKeyNotesSameAsExpectedNotes(key: Key, expectedNotes: [Note])
    {
        let actualKeyNotes = key.keyNotes

        XCTAssert(actualKeyNotes[0] == expectedNotes[0], "")
        XCTAssert(actualKeyNotes[1] == expectedNotes[1], "")
        XCTAssert(actualKeyNotes[2] == expectedNotes[2], "")
        XCTAssert(actualKeyNotes[3] == expectedNotes[3], "")
        XCTAssert(actualKeyNotes[4] == expectedNotes[4], "")
        XCTAssert(actualKeyNotes[5] == expectedNotes[5], "")
        XCTAssert(actualKeyNotes[6] == expectedNotes[6], "")
    }
}