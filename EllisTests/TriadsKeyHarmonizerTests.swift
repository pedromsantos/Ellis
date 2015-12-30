import XCTest
import Ellis

class TriadsKeyHarmonizerTests: XCTestCase
{
    func test_that_it_should_create_maj_from_from_first_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.CMajor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_min_from_from_second_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.DMajor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_min_from_from_third_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.EMajor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_maj_from_from_fourth_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.FMajor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_dom_from_from_fifth_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.GMajor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_min_from_from_sixth_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.AMajor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_minb5_from_from_seventh_note_in_major_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.BMajor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.Diminished, chord.function)
    }

    func test_that_it_should_create_maj_from_from_first_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.CMinor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_min_from_from_second_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.DMinor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.Diminished, chord.function)
    }

    func test_that_it_should_create_min_from_from_third_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.EMinor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.Augmented, chord.function)
    }

    func test_that_it_should_create_maj_from_from_fourth_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.FMinor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_dom_from_from_fifth_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.GMinor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_min_from_from_sixth_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.AMinor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_minb5_from_from_seventh_note_in_minor_scale()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.BMinor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.Diminished, chord.function)
    }

    func test_that_it_should_create_maj_from_from_first_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.CMajor)

        let chord = harmonizer.chordForScaleDegree(0)

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_min_from_from_second_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.DMajor)

        let chord = harmonizer.chordForScaleDegree(1)

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_min_from_from_third_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.EMajor)

        let chord = harmonizer.chordForScaleDegree(2)

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_maj_from_from_fourth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.FMajor)

        let chord = harmonizer.chordForScaleDegree(3)

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_dom_from_from_fifth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.GMajor)

        let chord = harmonizer.chordForScaleDegree(4)

        XCTAssertEqual(ChordFunction.Major, chord.function)
    }

    func test_that_it_should_create_min_from_from_sixth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.AMajor)

        let chord = harmonizer.chordForScaleDegree(5)

        XCTAssertEqual(ChordFunction.Minor, chord.function)
    }

    func test_that_it_should_create_minb5_from_from_seventh_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = TriadsKeyHarmonizer(key: Key.BMajor)

        let chord = harmonizer.chordForScaleDegree(6)

        XCTAssertEqual(ChordFunction.Diminished, chord.function)
    }
}