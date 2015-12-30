import XCTest
import Ellis

class SeventhsKeyHarmonizerTests: XCTestCase
{
    func test_that_it_should_create_maj7_from_from_first_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.CMajor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.Major7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_second_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.DMajor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_third_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.EMajor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_fourth_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.FMajor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.Major7, chord.function)
    }

    func test_that_it_should_create_dom7_from_from_fifth_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.GMajor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.Dominant7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_sixth_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.AMajor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_min7b5_from_from_seventh_note_in_major_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.BMajor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.Minor7b5, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_first_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.CMinor)

        let chord = harmonizer.i()

        XCTAssertEqual(ChordFunction.MinorMaj7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_second_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.DMinor)

        let chord = harmonizer.ii()

        XCTAssertEqual(ChordFunction.Minor7b5, chord.function)
    }

    func test_that_it_should_create_min7_from_from_third_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.EMinor)

        let chord = harmonizer.iii()

        XCTAssertEqual(ChordFunction.Augmented7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_fourth_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.FMinor)

        let chord = harmonizer.iv()

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_dom7_from_from_fifth_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.GMinor)

        let chord = harmonizer.v()

        XCTAssertEqual(ChordFunction.Dominant7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_sixth_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.AMinor)

        let chord = harmonizer.vi()

        XCTAssertEqual(ChordFunction.Major7, chord.function)
    }

    func test_that_it_should_create_min7b5_from_from_seventh_note_in_minor_scale()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.BMinor)

        let chord = harmonizer.vii()

        XCTAssertEqual(ChordFunction.Diminished7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_first_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.CMajor)

        let chord = harmonizer.chordForScaleDegree(0)

        XCTAssertEqual(ChordFunction.Major7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_second_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.DMajor)

        let chord = harmonizer.chordForScaleDegree(1)

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_third_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.EMajor)

        let chord = harmonizer.chordForScaleDegree(2)

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_maj7_from_from_fourth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.FMajor)

        let chord = harmonizer.chordForScaleDegree(3)

        XCTAssertEqual(ChordFunction.Major7, chord.function)
    }

    func test_that_it_should_create_dom7_from_from_fifth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.GMajor)

        let chord = harmonizer.chordForScaleDegree(4)

        XCTAssertEqual(ChordFunction.Dominant7, chord.function)
    }

    func test_that_it_should_create_min7_from_from_sixth_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.AMajor)

        let chord = harmonizer.chordForScaleDegree(5)

        XCTAssertEqual(ChordFunction.Minor7, chord.function)
    }

    func test_that_it_should_create_min7b5_from_from_seventh_note_in_major_scale_using_scale_degrees()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.BMajor)

        let chord = harmonizer.chordForScaleDegree(6)

        XCTAssertEqual(ChordFunction.Minor7b5, chord.function)
    }

    func test_that_it_should_update_key()
    {
        let harmonizer = SeventhsKeyHarmonizer(key: Key.BMajor)
        harmonizer.updateKey(Key.CMajor)
        let chord = harmonizer.chordForScaleDegree(0)

        XCTAssertEqual("CMaj7", chord.name)
    }
}