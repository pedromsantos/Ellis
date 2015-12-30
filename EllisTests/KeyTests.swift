import XCTest
import Ellis

class KeyTests: XCTestCase
{
    func test_that_c_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.C, Note.D, Note.E, Note.F, Note.G, Note.A, Note.B]

        XCTAssertEqual(Key.CMajor.keyNotes, expectedNotes)
    }

    func test_that_a_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.A, Note.B, Note.C, Note.D, Note.E, Note.F, Note.G]

        XCTAssertEqual(Key.AMinor.keyNotes, expectedNotes)
    }

    func test_that_a_flat_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.AFlat, Note.BFlat, Note.C, Note.DFlat, Note.EFlat, Note.F, Note.G]

        XCTAssertEqual(Key.AFlatMajor.keyNotes, expectedNotes)
    }

    func test_that_g_flat_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.GFlat, Note.AFlat, Note.BFlat, Note.B, Note.DFlat, Note.EFlat, Note.F]

        XCTAssertEqual(Key.GFlatMajor.keyNotes, expectedNotes)
    }

    func test_that_e_flat_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.EFlat, Note.F, Note.GFlat, Note.AFlat, Note.BFlat, Note.B, Note.DFlat]

        XCTAssertEqual(Key.EFlatMinor.keyNotes, expectedNotes)
    }

    func test_that_a_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.A, Note.B, Note.CSharp, Note.D, Note.E, Note.FSharp, Note.GSharp]

        XCTAssertEqual(Key.AMajor.keyNotes, expectedNotes)
    }

    func test_that_c_major_relative_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.A, Note.B, Note.C, Note.D, Note.E, Note.F, Note.G]

        XCTAssertEqual(Key.CMajor.relativeKey.keyNotes, expectedNotes)
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
}