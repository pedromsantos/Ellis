import XCTest
import Ellis

class SeventhsKeyHarmonizerTests: XCTestCase
{
    func test_that_it_should_create_maj7_from_from_first_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.cMajor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.major7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_second_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.dMajor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_third_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.eMajor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_fourth_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.fMajor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.major7, chord.function)
    }

    func test_that_it_should_create_dom7_from_from_fifth_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.gMajor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.dominant7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_sixth_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.aMajor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_min7b5_from_from_seventh_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.bMajor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.minor7b5, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_first_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.cMinor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.minorMaj7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_second_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.dMinor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.minor7b5, chord.function)
    }

    func test_that_it_should_create_min7_from_from_third_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.eMinor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.augmented7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_fourth_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.fMinor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_dom7_from_from_fifth_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.gMinor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.dominant7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_sixth_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.aMinor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.major7, chord.function)
    }

    func test_that_it_should_create_min7b5_from_from_seventh_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.bMinor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.diminished7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_first_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.cMajor)

        let chord = harmonizer.chordForScaleDegree(0)

        XCTAssertEqual(ChordFunction.major7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_second_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.dMajor)

        let chord = harmonizer.chordForScaleDegree(1)

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_third_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.eMajor)

        let chord = harmonizer.chordForScaleDegree(2)

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_fourth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.fMajor)

        let chord = harmonizer.chordForScaleDegree(3)

        XCTAssertEqual(ChordFunction.major7, chord.function)
    }

    func test_that_it_should_create_dom7_from_from_fifth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.gMajor)

        let chord = harmonizer.chordForScaleDegree(4)

        XCTAssertEqual(ChordFunction.dominant7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_sixth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.aMajor)

        let chord = harmonizer.chordForScaleDegree(5)

        XCTAssertEqual(ChordFunction.minor7, chord.function)
    }

    func test_that_it_should_create_min7b5_from_from_seventh_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.bMajor)

        let chord = harmonizer.chordForScaleDegree(6)

        XCTAssertEqual(ChordFunction.minor7b5, chord.function)
    }

    func test_that_it_should_update_key()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.bMajor)
        harmonizer.updateKey(Key.cMajor)
        let chord = harmonizer.chordForScaleDegree(0)

        XCTAssertEqual("CMaj7", chord.name)
    }
}
