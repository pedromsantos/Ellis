import XCTest
import Ellis

class NoteTests: XCTestCase
{
    func testThatItShouldCreateInstanceOfCNote()
    {
        let note = Note.C
        XCTAssertEqual(0, note.Pitch, "")
        XCTAssertEqual("C", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfCSharpNote()
    {
        let note = Note.CSharp
        XCTAssertEqual(1, note.Pitch, "")
        XCTAssertEqual("C#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfDFlatNote()
    {
        let note = Note.DFlat
        XCTAssertEqual(1, note.Pitch, "")
        XCTAssertEqual("Db", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfDNote()
    {
        let note = Note.D
        XCTAssertEqual(2, note.Pitch, "")
        XCTAssertEqual("D", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfDSharpNote()
    {
        let note = Note.DSharp
        XCTAssertEqual(3, note.Pitch, "")
        XCTAssertEqual("D#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfEFlatNote()
    {
        let note = Note.EFlat
        XCTAssertEqual(3, note.Pitch, "")
        XCTAssertEqual("Eb", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfENote()
    {
        let note = Note.E
        XCTAssertEqual(4, note.Pitch, "")
        XCTAssertEqual("E", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfFNote()
    {
        let note = Note.F
        XCTAssertEqual(5, note.Pitch, "")
        XCTAssertEqual("F", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfFSharpNote()
    {
        let note = Note.FSharp
        XCTAssertEqual(6, note.Pitch, "")
        XCTAssertEqual("F#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfGFlatNote()
    {
        let note = Note.GFlat
        XCTAssertEqual(6, note.Pitch, "")
        XCTAssertEqual("Gb", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfGNote()
    {
        let note = Note.G
        XCTAssertEqual(7, note.Pitch, "")
        XCTAssertEqual("G", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfGSharpNote()
    {
        let note = Note.GSharp
        XCTAssertEqual(8, note.Pitch, "")
        XCTAssertEqual("G#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfAFlatNote()
    {
        let note = Note.AFlat
        XCTAssertEqual(8, note.Pitch, "")
        XCTAssertEqual("Ab", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfANote()
    {
        let note = Note.A
        XCTAssertEqual(9, note.Pitch, "")
        XCTAssertEqual("A", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfASharpNote()
    {
        let note = Note.ASharp
        XCTAssertEqual(10, note.Pitch, "")
        XCTAssertEqual("A#", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfBFlatNote()
    {
        let note = Note.BFlat
        XCTAssertEqual(10, note.Pitch, "")
        XCTAssertEqual("Bb", note.Name, "")
    }

    func testThatItShouldCreateInstanceOfBNote()
    {
        let note = Note.B
        XCTAssertEqual(11, note.Pitch, "")
        XCTAssertEqual("B", note.Name, "")
    }

    func testThatItShouldReturnCSharpWhenCIsSharped()
    {
        XCTAssert(Note.CSharp == Note.C.sharp(), "")
    }

    func testThatItShouldReturnDWhenCSharpIsSharped()
    {
        XCTAssert(Note.D == Note.CSharp.sharp(), "")
    }

    func testThatItShouldReturnDWhenDFlatIsSharped()
    {
        XCTAssert(Note.D == Note.DFlat.sharp(), "")
    }

    func testThatItShouldReturnDSharpWhenDIsSharped()
    {
        XCTAssert(Note.DSharp == Note.D.sharp(), "")
    }

    func testThatItShouldReturnEWhenDSharpIsSharped()
    {
        XCTAssert(Note.E == Note.DSharp.sharp(), "")
    }

    func testThatItShouldReturnFWhenEIsSharped()
    {
        XCTAssert(Note.F == Note.E.sharp(), "")
    }

    func testThatItShouldReturnFSharpWhenFIsSharped()
    {
        XCTAssert(Note.FSharp == Note.F.sharp(), "")
    }

    func testThatItShouldReturnGWhenFSharpIsSharped()
    {
        XCTAssert(Note.G == Note.FSharp.sharp(), "")
    }

    func testThatItShouldReturnGWhenGFlatIsSharped()
    {
        XCTAssert(Note.G == Note.GFlat.sharp(), "")
    }

    func testThatItShouldReturnGSharpWhenGIsSharped()
    {
        XCTAssert(Note.GSharp == Note.G.sharp(), "")
    }

    func testThatItShouldReturnAWhenGSharpIsSharped()
    {
        XCTAssert(Note.A == Note.GSharp.sharp(), "")
    }

    func testThatItShouldReturnAWhenAFlatIsSharped()
    {
        XCTAssert(Note.A == Note.AFlat.sharp(), "")
    }

    func testThatItShouldReturnASharpWhenAIsSharped()
    {
        XCTAssert(Note.ASharp == Note.A.sharp(), "")
    }

    func testThatItShouldReturnBWhenASharpIsSharped()
    {
        XCTAssert(Note.B == Note.ASharp.sharp(), "")
    }

    func testThatItShouldReturnCWhenBIsSharped()
    {
        XCTAssert(Note.C == Note.B.sharp(), "")
    }

    func testThatItShouldReturnCWhenCSharpIsFlated()
    {
        XCTAssert(Note.C == Note.CSharp.flat(), "")
    }

    func testThatItShouldReturnCWhenDFlatIsFlated()
    {
        XCTAssert(Note.C == Note.DFlat.flat(), "")
    }

    func testThatItShouldReturnDWhenDSharpIsFlated()
    {
        XCTAssert(Note.D == Note.DSharp.flat(), "")
    }

    func testThatItShouldReturnDWhenEFlatIsFlated()
    {
        XCTAssert(Note.D == Note.EFlat.flat(), "")
    }

    func testThatItShouldReturnEFlatWhenEIsFlated()
    {
        XCTAssert(Note.EFlat == Note.E.flat(), "")
    }

    func testThatItShouldReturnEWhenFIsFlated()
    {
        XCTAssert(Note.E == Note.F.flat(), "")
    }

    func testThatItShouldReturnFWhenFSharpIsFlated()
    {
        XCTAssert(Note.F == Note.FSharp.flat(), "")
    }

    func testThatItShouldReturnFWhenGFlatIsFlated()
    {
        XCTAssert(Note.F == Note.GFlat.flat(), "")
    }

    func testThatItShouldReturnGFlatWhenGIsFlated()
    {
        XCTAssert(Note.GFlat == Note.G.flat(), "")
    }

    func testThatItShouldReturnGWhenGSharpIsFlated()
    {
        XCTAssert(Note.G == Note.GSharp.flat(), "")
    }

    func testThatItShouldReturnGWhenAFlatIsFlated()
    {
        XCTAssert(Note.G == Note.AFlat.flat(), "")
    }

    func testThatItShouldReturnAFlatWhenAIsFlated()
    {
        XCTAssert(Note.AFlat == Note.A.flat(), "")
    }

    func testThatItShouldReturnAWhenASharpIsFlated()
    {
        XCTAssert(Note.A == Note.ASharp.flat(), "")
    }

    func testThatItShouldReturnBFlatWhenBIsFlated()
    {
        XCTAssert(Note.BFlat == Note.B.flat(), "")
    }

    func testThatItShouldReturnBWhenCIsFlated()
    {
        XCTAssert(Note.B == Note.C.flat(), "")
    }

    func testThatItShould_return_major_third_as_the_distance_between_c_and_e()
    {
        XCTAssert(Interval.MajorThird == Note.C.intervalWithNote(Note.E), "")
    }

    func testThatItShould_return_minor_third_as_the_distance_between_c_and_eb()
    {
        XCTAssert(Interval.MinorThird == Note.C.intervalWithNote(Note.EFlat), "")
    }

    func testThatItShould_return_e_when_transposing_by_major_third()
    {

        XCTAssert(Note.E == Note.C.transpose(Interval.MajorThird));
    }

    func testThatItShould_return_dsharp_when_transposing_by_minor_third()
    {

        XCTAssert(Note.DSharp == Note.C.transpose(Interval.MinorThird));
    }

    func testThatItShouldHaveFrequencyOf55HzForA1()
    {
        let frequency = Note.A.frequency(Octave.Contra)

        XCTAssertEqual(440.0 / 8, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf110HzForA2()
    {
        let frequency = Note.A.frequency(Octave.Great)

        XCTAssertEqual(440.0 / 4, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf220HzForA3()
    {
        let frequency = Note.A.frequency(Octave.Small)

        XCTAssertEqual(440.0 / 2, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf440HzForA4()
    {
        let frequency = Note.A.frequency(Octave.OneLine)

        XCTAssertEqual(440.0, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf880HzForA5()
    {
        let frequency = Note.A.frequency(Octave.TwoLine)

        XCTAssertEqual(440.0 * 2, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf1760HzForA6()
    {
        let frequency = Note.A.frequency(Octave.ThreeLine)

        XCTAssertEqual(440.0 * 4, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf3520HzForA7()
    {
        let frequency = Note.A.frequency(Octave.FourLine)

        XCTAssertEqual(440.0 * 8, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf7040HzForA8()
    {
        let frequency = Note.A.frequency(Octave.FiveLine)

        XCTAssertEqual(440.0 * 16, frequency, "")
    }

    func testThatItShouldHaveFrequencyOf14080HzForA9()
    {
        let frequency = Note.A.frequency(Octave.SixLine)

        XCTAssertEqual(440.0 * 32, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForC4()
    {
        let frequency = Note.C.frequency()

        XCTAssertEqual(261.626, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForCSharp4()
    {
        let frequency = Note.CSharp.frequency()

        XCTAssertEqual(277.183, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForD4()
    {
        let frequency = Note.D.frequency()

        XCTAssertEqual(293.665, frequency, "")
    }

    func testThatItShouldHaveCorrectFrequencyForB4()
    {
        let frequency = Note.B.frequency()

        XCTAssertEqual(493.883, frequency, "")
    }
}
