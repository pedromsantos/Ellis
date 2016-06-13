import XCTest
import Ellis

class NoteTests: XCTestCase
{
    func testThatItShouldCreateInstanceOfCNote()
    {
        let note = Note.c
        XCTAssertEqual(0, note.Pitch, "")
        XCTAssertEqual("C", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfCSharpNote()
    {
        let note = Note.cSharp
        XCTAssertEqual(1, note.Pitch, "")
        XCTAssertEqual("C#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfDFlatNote()
    {
        let note = Note.dFlat
        XCTAssertEqual(1, note.Pitch, "")
        XCTAssertEqual("Db", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfDNote()
    {
        let note = Note.d
        XCTAssertEqual(2, note.Pitch, "")
        XCTAssertEqual("D", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfDSharpNote()
    {
        let note = Note.dSharp
        XCTAssertEqual(3, note.Pitch, "")
        XCTAssertEqual("D#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfEFlatNote()
    {
        let note = Note.eFlat
        XCTAssertEqual(3, note.Pitch, "")
        XCTAssertEqual("Eb", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfENote()
    {
        let note = Note.e
        XCTAssertEqual(4, note.Pitch, "")
        XCTAssertEqual("E", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfFNote()
    {
        let note = Note.f
        XCTAssertEqual(5, note.Pitch, "")
        XCTAssertEqual("F", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfFSharpNote()
    {
        let note = Note.fSharp
        XCTAssertEqual(6, note.Pitch, "")
        XCTAssertEqual("F#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfGFlatNote()
    {
        let note = Note.gFlat
        XCTAssertEqual(6, note.Pitch, "")
        XCTAssertEqual("Gb", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfGNote()
    {
        let note = Note.g
        XCTAssertEqual(7, note.Pitch, "")
        XCTAssertEqual("G", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfGSharpNote()
    {
        let note = Note.gSharp
        XCTAssertEqual(8, note.Pitch, "")
        XCTAssertEqual("G#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfAFlatNote()
    {
        let note = Note.aFlat
        XCTAssertEqual(8, note.Pitch, "")
        XCTAssertEqual("Ab", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfANote()
    {
        let note = Note.a
        XCTAssertEqual(9, note.Pitch, "")
        XCTAssertEqual("A", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfASharpNote()
    {
        let note = Note.aSharp
        XCTAssertEqual(10, note.Pitch, "")
        XCTAssertEqual("A#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfBFlatNote()
    {
        let note = Note.bFlat
        XCTAssertEqual(10, note.Pitch, "")
        XCTAssertEqual("Bb", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfBNote()
    {
        let note = Note.b
        XCTAssertEqual(11, note.Pitch, "")
        XCTAssertEqual("B", note.Name, "")
    }

    func testThatItShouldReturnCSharpWhenCIsSharped()
    {
        XCTAssert(Note.cSharp == Note.c.sharp(), "")
    }

    func testThatItShouldReturnDWhenCSharpIsSharped()
    {
        XCTAssert(Note.d == Note.cSharp.sharp(), "")
    }

    func testThatItShouldReturnDWhenDFlatIsSharped()
    {
        XCTAssert(Note.d == Note.dFlat.sharp(), "")
    }

    func testThatItShouldReturnDSharpWhenDIsSharped()
    {
        XCTAssert(Note.dSharp == Note.d.sharp(), "")
    }

    func testThatItShouldReturnEWhenDSharpIsSharped()
    {
        XCTAssert(Note.e == Note.dSharp.sharp(), "")
    }

    func testThatItShouldReturnFWhenEIsSharped()
    {
        XCTAssert(Note.f == Note.e.sharp(), "")
    }

    func testThatItShouldReturnFSharpWhenFIsSharped()
    {
        XCTAssert(Note.fSharp == Note.f.sharp(), "")
    }

    func testThatItShouldReturnGWhenFSharpIsSharped()
    {
        XCTAssert(Note.g == Note.fSharp.sharp(), "")
    }

    func testThatItShouldReturnGWhenGFlatIsSharped()
    {
        XCTAssert(Note.g == Note.gFlat.sharp(), "")
    }

    func testThatItShouldReturnGSharpWhenGIsSharped()
    {
        XCTAssert(Note.gSharp == Note.g.sharp(), "")
    }

    func testThatItShouldReturnAWhenGSharpIsSharped()
    {
        XCTAssert(Note.a == Note.gSharp.sharp(), "")
    }

    func testThatItShouldReturnAWhenAFlatIsSharped()
    {
        XCTAssert(Note.a == Note.aFlat.sharp(), "")
    }

    func testThatItShouldReturnASharpWhenAIsSharped()
    {
        XCTAssert(Note.aSharp == Note.a.sharp(), "")
    }

    func testThatItShouldReturnBWhenASharpIsSharped()
    {
        XCTAssert(Note.b == Note.aSharp.sharp(), "")
    }

    func testThatItShouldReturnCWhenBIsSharped()
    {
        XCTAssert(Note.c == Note.b.sharp(), "")
    }

    func testThatItShouldReturnCWhenCSharpIsFlated()
    {
        XCTAssert(Note.c == Note.cSharp.flat(), "")
    }

    func testThatItShouldReturnCWhenDFlatIsFlated()
    {
        XCTAssert(Note.c == Note.dFlat.flat(), "")
    }

    func testThatItShouldReturnDWhenDSharpIsFlated()
    {
        XCTAssert(Note.d == Note.dSharp.flat(), "")
    }

    func testThatItShouldReturnDWhenEFlatIsFlated()
    {
        XCTAssert(Note.d == Note.eFlat.flat(), "")
    }

    func testThatItShouldReturnEFlatWhenEIsFlated()
    {
        XCTAssert(Note.eFlat == Note.e.flat(), "")
    }

    func testThatItShouldReturnEWhenFIsFlated()
    {
        XCTAssert(Note.e == Note.f.flat(), "")
    }

    func testThatItShouldReturnFWhenFSharpIsFlated()
    {
        XCTAssert(Note.f == Note.fSharp.flat(), "")
    }

    func testThatItShouldReturnFWhenGFlatIsFlated()
    {
        XCTAssert(Note.f == Note.gFlat.flat(), "")
    }

    func testThatItShouldReturnGFlatWhenGIsFlated()
    {
        XCTAssert(Note.gFlat == Note.g.flat(), "")
    }

    func testThatItShouldReturnGWhenGSharpIsFlated()
    {
        XCTAssert(Note.g == Note.gSharp.flat(), "")
    }

    func testThatItShouldReturnGWhenAFlatIsFlated()
    {
        XCTAssert(Note.g == Note.aFlat.flat(), "")
    }

    func testThatItShouldReturnAFlatWhenAIsFlated()
    {
        XCTAssert(Note.aFlat == Note.a.flat(), "")
    }

    func testThatItShouldReturnAWhenASharpIsFlated()
    {
        XCTAssert(Note.a == Note.aSharp.flat(), "")
    }

    func testThatItShouldReturnBFlatWhenBIsFlated()
    {
        XCTAssert(Note.bFlat == Note.b.flat(), "")
    }

    func testThatItShouldReturnBWhenCIsFlated()
    {
        XCTAssert(Note.b == Note.c.flat(), "")
    }

    func testThatItShould_return_major_third_as_the_distance_between_c_and_e()
    {
        XCTAssert(Interval.majorThird == Note.c.intervalWithNote(Note.e), "")
    }

    func testThatItShould_return_minor_third_as_the_distance_between_c_and_eb()
    {
        XCTAssert(Interval.minorThird == Note.c.intervalWithNote(Note.eFlat), "")
    }

    func testThatItShould_return_e_when_transposing_by_major_third()
    {

        XCTAssert(Note.e == Note.c.transpose(Interval.majorThird));
    }

    func testThatItShould_return_dsharp_when_transposing_by_minor_third()
    {

        XCTAssert(Note.dSharp == Note.c.transpose(Interval.minorThird));
    }

    func testThatItShouldHaveFrequencyOf55HzForA1()
    {
        let frequency = Note.a.frequency(Octave.contra)

        XCTAssertEqual(440.0 / 8, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf110HzForA2()
    {
        let frequency = Note.a.frequency(Octave.great)

        XCTAssertEqual(440.0 / 4, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf220HzForA3()
    {
        let frequency = Note.a.frequency(Octave.small)

        XCTAssertEqual(440.0 / 2, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf440HzForA4()
    {
        let frequency = Note.a.frequency(Octave.oneLine)

        XCTAssertEqual(440.0, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf880HzForA5()
    {
        let frequency = Note.a.frequency(Octave.twoLine)

        XCTAssertEqual(440.0 * 2, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf1760HzForA6()
    {
        let frequency = Note.a.frequency(Octave.threeLine)

        XCTAssertEqual(440.0 * 4, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf3520HzForA7()
    {
        let frequency = Note.a.frequency(Octave.fourLine)

        XCTAssertEqual(440.0 * 8, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf7040HzForA8()
    {
        let frequency = Note.a.frequency(Octave.fiveLine)

        XCTAssertEqual(440.0 * 16, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf14080HzForA9()
    {
        let frequency = Note.a.frequency(Octave.sixLine)

        XCTAssertEqual(440.0 * 32, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForC4()
    {
        let frequency = Note.c.frequency()

        XCTAssertEqual(261.626, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForCSharp4()
    {
        let frequency = Note.cSharp.frequency()

        XCTAssertEqual(277.183, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForD4()
    {
        let frequency = Note.d.frequency()

        XCTAssertEqual(293.665, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForB4()
    {
        let frequency = Note.b.frequency()

        XCTAssertEqual(493.883, frequency, "")
    }
}
