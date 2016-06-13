import XCTest
import Ellis

class TriadsKeyHarmonizerTests: XCTestCase
{
    func test_that_it_should_create_maj_from_from_first_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.cMajor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_min_from_from_second_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.dMajor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_min_from_from_third_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.eMajor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_maj_from_from_fourth_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.fMajor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_dom_from_from_fifth_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.gMajor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_min_from_from_sixth_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.aMajor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_minb5_from_from_seventh_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.bMajor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.diminished, chord.function)
    }

    func test_that_it_should_create_maj_from_from_first_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.cMinor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_min_from_from_second_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.dMinor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.diminished, chord.function)
    }

    func test_that_it_should_create_min_from_from_third_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.eMinor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.augmented, chord.function)
    }

    func test_that_it_should_create_maj_from_from_fourth_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.fMinor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_dom_from_from_fifth_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.gMinor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_min_from_from_sixth_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.aMinor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_minb5_from_from_seventh_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.bMinor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.diminished, chord.function)
    }

    func test_that_it_should_create_maj_from_from_first_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.cMajor)

        let chord = harmonizer.chordForScaleDegree(0)

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_min_from_from_second_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.dMajor)

        let chord = harmonizer.chordForScaleDegree(1)

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_min_from_from_third_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.eMajor)

        let chord = harmonizer.chordForScaleDegree(2)

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_maj_from_from_fourth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.fMajor)

        let chord = harmonizer.chordForScaleDegree(3)

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_dom_from_from_fifth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.gMajor)

        let chord = harmonizer.chordForScaleDegree(4)

        XCTAssertEqual(ChordFunction.major, chord.function)
    }

    func test_that_it_should_create_min_from_from_sixth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.aMajor)

        let chord = harmonizer.chordForScaleDegree(5)

        XCTAssertEqual(ChordFunction.minor, chord.function)
    }

    func test_that_it_should_create_minb5_from_from_seventh_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.bMajor)

        let chord = harmonizer.chordForScaleDegree(6)

        XCTAssertEqual(ChordFunction.diminished, chord.function)
    }
}
