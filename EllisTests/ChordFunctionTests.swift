import XCTest
import Ellis

class ChordFunctionTests: XCTestCase
{
    func test_that_it_should_relate_major_to_name_major()
    {
        XCTAssertEqual("Major", ChordFunction.major.Name);
    }

    func test_that_it_should_relate_major_to_abreviature_maj()
    {
        XCTAssertEqual("Maj", ChordFunction.major.Abreviature);
    }

    func test_that_it_should_relate_major_third_perfect_fifth_to_major_chord()
    {
        let intervals = [Interval.majorThird, Interval.perfectFifth];

        XCTAssertEqual(ChordFunction.major, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_augmented_to_name_augmented()
    {
        XCTAssertEqual("Augmented", ChordFunction.augmented.Name);
    }

    func test_that_it_should_relate_augmented_to_abreviature_augmented()
    {
        XCTAssertEqual("Aug", ChordFunction.augmented.Abreviature);
    }

    func test_that_it_should_relate_major_third_augmented_fifth_to_augmented_chord()
    {
        let intervals = [Interval.majorThird, Interval.augmentedFifth];

        XCTAssertEqual(ChordFunction.augmented, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minor_to_name_minor()
    {
        XCTAssertEqual("Minor", ChordFunction.minor.Name);
    }

    func test_that_it_should_relate_minor_to_abreviature_min()
    {
        XCTAssertEqual("Min", ChordFunction.minor.Abreviature);
    }

    func test_that_it_should_relate_minor_third_perfect_fifth_to_minor_chord()
    {
        let intervals = [Interval.minorThird, Interval.perfectFifth];

        XCTAssertEqual(ChordFunction.minor, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_diminished_to_name_diminished()
    {
        XCTAssertEqual("Diminished", ChordFunction.diminished.Name);
    }

    func test_that_it_should_relate_diminished_to_abreviature_dim()
    {
        XCTAssertEqual("Dim", ChordFunction.diminished.Abreviature);
    }

    func test_that_it_should_relate_minor_third_diminished_fifth_to_diminished_chord()
    {
        let intervals = [Interval.minorThird, Interval.diminishedFifth];

        XCTAssertEqual(ChordFunction.diminished, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus2_to_name_sus2()
    {
        XCTAssertEqual("Sus2", ChordFunction.sus2.Name);
    }

    func test_that_it_should_relate_sus2_to_abreviature_sus2()
    {
        XCTAssertEqual("Sus2", ChordFunction.sus2.Abreviature);
    }

    func test_that_it_should_relate_major_second_perfect_fifth_to_sus2_chord()
    {
        let intervals = [Interval.majorSecond, Interval.perfectFifth];

        XCTAssertEqual(ChordFunction.sus2, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus2_diminished_to_name_sus2_diminished()
    {
        XCTAssertEqual("Sus2Diminished", ChordFunction.sus2Diminished.Name);
    }

    func test_that_it_should_relate_sus2_diminished_to_abreviature_sus2_dim()
    {
        XCTAssertEqual("Sus2Dim", ChordFunction.sus2Diminished.Abreviature);
    }

    func test_that_it_should_relate_major_second_diminished_fifth_to_sus2_diminished_chord()
    {
        let intervals = [Interval.majorSecond, Interval.diminishedFifth];

        XCTAssertEqual(ChordFunction.sus2Diminished, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus2_augmented_to_name_sus2_augmented()
    {
        XCTAssertEqual("Sus2Augmented", ChordFunction.sus2Augmented.Name);
    }

    func test_that_it_should_relate_sus2_augmented_to_abreviature_sus2_aug()
    {
        XCTAssertEqual("Sus2Aug", ChordFunction.sus2Augmented.Abreviature);
    }

    func test_that_it_should_relate_major_second_augmented_fifth_to_sus2_augmented_chord()
    {
        let intervals = [Interval.majorSecond, Interval.augmentedFifth];

        XCTAssertEqual(ChordFunction.sus2Augmented, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus4_to_name_sus4()
    {
        XCTAssertEqual("Sus4", ChordFunction.sus4.Name);
    }

    func test_that_it_should_relate_sus4_to_abreviature_sus4()
    {
        XCTAssertEqual("Sus4", ChordFunction.sus4.Abreviature);
    }

    func test_that_it_should_relate_major_fourth_perfect_fifth_to_sus4_chord()
    {
        let intervals = [Interval.perfectForth, Interval.perfectFifth];

        XCTAssertEqual(ChordFunction.sus4, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus4_diminished_to_name_sus4_diminished()
    {
        XCTAssertEqual("Sus4Diminished", ChordFunction.sus4Diminished.Name);
    }

    func test_that_it_should_relate_sus4_diminished_to_abreviature_sus4_dim()
    {
        XCTAssertEqual("Sus4Dim", ChordFunction.sus4Diminished.Abreviature);
    }

    func test_that_it_should_relate_major_fourth_diminished_fifth_to_sus4_diminished_chord()
    {
        let intervals = [Interval.perfectForth, Interval.diminishedFifth];

        XCTAssertEqual(ChordFunction.sus4Diminished, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus4_augmented_to_name_sus4_augmented()
    {
        XCTAssertEqual("Sus4Augmented", ChordFunction.sus4Augmented.Name);
    }

    func test_that_it_should_relate_sus4_augmented_to_abreviature_sus4_aug()
    {
        XCTAssertEqual("Sus4Aug", ChordFunction.sus4Augmented.Abreviature);
    }

    func test_that_it_should_relate_major_fourth_augmented_fifth_to_sus4_augmented_chord()
    {
        let intervals = [Interval.perfectForth, Interval.augmentedFifth];

        XCTAssertEqual(ChordFunction.sus4Augmented, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_major7_to_name_major7()
    {
        XCTAssertEqual("Major7", ChordFunction.major7.Name);
    }

    func test_that_it_should_relate_major7_to_abreviature_maj7()
    {
        XCTAssertEqual("Maj7", ChordFunction.major7.Abreviature);
    }

    func test_that_it_should_relate_major_third_perfect_fifth_major_seventh_to_major7_chord()
    {
        let intervals = [Interval.majorThird, Interval.perfectFifth, Interval.majorSeventh];

        XCTAssertEqual(ChordFunction.major7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_dominant7_to_name_dominant7()
    {
        XCTAssertEqual("Dominant7", ChordFunction.dominant7.Name);
    }

    func test_that_it_should_relate_dominant7_to_abreviature_dom7()
    {
        XCTAssertEqual("Dom7", ChordFunction.dominant7.Abreviature);
    }

    func test_that_it_should_relate_major_third_perfect_fifth_minor_seventh_to_dominant7_chord()
    {
        let intervals = [Interval.majorThird, Interval.perfectFifth, Interval.minorSeventh];

        XCTAssertEqual(ChordFunction.dominant7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minor7_to_name_minor7()
    {
        XCTAssertEqual("Minor7", ChordFunction.minor7.Name);
    }

    func test_that_it_should_relate_minor7_to_abreviature_min7()
    {
        XCTAssertEqual("Min7", ChordFunction.minor7.Abreviature);
    }

    func test_that_it_should_relate_minor_third_perfect_fifth_minor_seventh_to_minor7_chord()
    {
        let intervals = [Interval.minorThird, Interval.perfectFifth, Interval.minorSeventh];

        XCTAssertEqual(ChordFunction.minor7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minor7b5_to_name_minor7b5()
    {
        XCTAssertEqual("Minor7b5", ChordFunction.minor7b5.Name);
    }

    func test_that_it_should_relate_minor7b5_to_abreviature_min7b5()
    {
        XCTAssertEqual("Min7b5", ChordFunction.minor7b5.Abreviature);
    }

    func test_that_it_should_relate_minor_third_diminished_fifth_minor_seventh_to_min7b5_chord()
    {
        let intervals = [Interval.minorThird, Interval.diminishedFifth, Interval.minorSeventh];

        XCTAssertEqual(ChordFunction.minor7b5, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_dim7_to_name_dim7()
    {
        XCTAssertEqual("Diminished7", ChordFunction.diminished7.Name);
    }

    func test_that_it_should_relate_dim7_to_abreviature_dim7()
    {
        XCTAssertEqual("Dim7", ChordFunction.diminished7.Abreviature);
    }

    func test_that_it_should_relate_minor_third_diminished_fifth_major_sixth_to_dim7_chord()
    {
        let intervals = [Interval.minorThird, Interval.diminishedFifth, Interval.majorSixth];

        XCTAssertEqual(ChordFunction.diminished7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minMaj7_to_name_minMaj7()
    {
        XCTAssertEqual("MinorMajor7", ChordFunction.minorMaj7.Name);
    }

    func test_that_it_should_relate_minMaj7_to_abreviature_minMaj7()
    {
        XCTAssertEqual("MinMaj7", ChordFunction.minorMaj7.Abreviature);
    }

    func test_that_it_should_relate_minor_third_perfect_fifth_major_seventh_to_minMaj7_chord()
    {
        let intervals = [Interval.minorThird, Interval.perfectFifth, Interval.majorSeventh];

        XCTAssertEqual(ChordFunction.minorMaj7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_augmented7_to_name_augmented7()
    {
        XCTAssertEqual("Augmented7", ChordFunction.augmented7.Name);
    }

    func test_that_it_should_relate_augmented7_to_abreviature_augmented7()
    {
        XCTAssertEqual("Aug7", ChordFunction.augmented7.Abreviature);
    }

    func test_that_it_should_relate_major_third_augmented_fifth_major_seventh_to_augmented_chord()
    {
        let intervals = [Interval.majorThird, Interval.augmentedFifth, Interval.majorSeventh];

        XCTAssertEqual(ChordFunction.augmented7, ChordFunction.functionForIntervals(intervals));
    }
}
