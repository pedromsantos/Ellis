import XCTest
import Ellis

class KeyTests: XCTestCase
{
    func test_that_c_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.c, Note.d, Note.e, Note.f, Note.g, Note.a, Note.b]

        XCTAssertEqual(Key.cMajor.keyNotes, expectedNotes)
    }

    func test_that_a_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.a, Note.b, Note.c, Note.d, Note.e, Note.f, Note.g]

        XCTAssertEqual(Key.aMinor.keyNotes, expectedNotes)
    }

    func test_that_a_flat_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.aFlat, Note.bFlat, Note.c, Note.dFlat, Note.eFlat, Note.f, Note.g]

        XCTAssertEqual(Key.aFlatMajor.keyNotes, expectedNotes)
    }

    func test_that_g_flat_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.gFlat, Note.aFlat, Note.bFlat, Note.b, Note.dFlat, Note.eFlat, Note.f]

        XCTAssertEqual(Key.gFlatMajor.keyNotes, expectedNotes)
    }

    func test_that_e_flat_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.eFlat, Note.f, Note.gFlat, Note.aFlat, Note.bFlat, Note.b, Note.dFlat]

        XCTAssertEqual(Key.eFlatMinor.keyNotes, expectedNotes)
    }

    func test_that_a_major_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.a, Note.b, Note.cSharp, Note.d, Note.e, Note.fSharp, Note.gSharp]

        XCTAssertEqual(Key.aMajor.keyNotes, expectedNotes)
    }

    func test_that_c_major_relative_minor_returns_correct_notes_for_key()
    {
        let expectedNotes = [Note.a, Note.b, Note.c, Note.d, Note.e, Note.f, Note.g]

        XCTAssertEqual(Key.cMajor.relativeKey.keyNotes, expectedNotes)
    }

    func test_that_e_flat_minor_returns_e_as_root()
    {
        let rootName = Key.eFlatMinor.rootName
        XCTAssertEqual(rootName, "Eb");
    }

    func test_that_e_flat_minor_returns_minor_quality()
    {
        let quality = Key.eFlatMinor.quality
        XCTAssertEqual(quality, KeyQuality.minor);
    }

    func test_that_major_key_relative_returns_minor_key()
    {
        XCTAssertEqual(Key.cMajor.relativeKey.quality, KeyQuality.minor);
    }
}
