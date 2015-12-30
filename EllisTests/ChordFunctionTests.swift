import XCTest
import Ellis

class ChordFunctionTests: XCTestCase
{
    func test_that_it_should_relate_major_to_name_major()
    {
        XCTAssertEqual("Major", ChordFunction.Major.Name);
    }

    func test_that_it_should_relate_major_to_abreviature_maj()
    {
        XCTAssertEqual("Maj", ChordFunction.Major.Abreviature);
    }

    func test_that_it_should_relate_major_third_perfect_fifth_to_major_chord()
    {
        let intervals = [Interval.MajorThird, Interval.PerfectFifth];

        XCTAssertEqual(ChordFunction.Major, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_augmented_to_name_augmented()
    {
        XCTAssertEqual("Augmented", ChordFunction.Augmented.Name);
    }

    func test_that_it_should_relate_augmented_to_abreviature_augmented()
    {
        XCTAssertEqual("Aug", ChordFunction.Augmented.Abreviature);
    }

    func test_that_it_should_relate_major_third_augmented_fifth_to_augmented_chord()
    {
        let intervals = [Interval.MajorThird, Interval.AugmentedFifth];

        XCTAssertEqual(ChordFunction.Augmented, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minor_to_name_minor()
    {
        XCTAssertEqual("Minor", ChordFunction.Minor.Name);
    }

    func test_that_it_should_relate_minor_to_abreviature_min()
    {
        XCTAssertEqual("Min", ChordFunction.Minor.Abreviature);
    }

    func test_that_it_should_relate_minor_third_perfect_fifth_to_minor_chord()
    {
        let intervals = [Interval.MinorThird, Interval.PerfectFifth];

        XCTAssertEqual(ChordFunction.Minor, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_diminished_to_name_diminished()
    {
        XCTAssertEqual("Diminished", ChordFunction.Diminished.Name);
    }

    func test_that_it_should_relate_diminished_to_abreviature_dim()
    {
        XCTAssertEqual("Dim", ChordFunction.Diminished.Abreviature);
    }

    func test_that_it_should_relate_minor_third_diminished_fifth_to_diminished_chord()
    {
        let intervals = [Interval.MinorThird, Interval.DiminishedFifth];

        XCTAssertEqual(ChordFunction.Diminished, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus2_to_name_sus2()
    {
        XCTAssertEqual("Sus2", ChordFunction.Sus2.Name);
    }

    func test_that_it_should_relate_sus2_to_abreviature_sus2()
    {
        XCTAssertEqual("Sus2", ChordFunction.Sus2.Abreviature);
    }

    func test_that_it_should_relate_major_second_perfect_fifth_to_sus2_chord()
    {
        let intervals = [Interval.MajorSecond, Interval.PerfectFifth];

        XCTAssertEqual(ChordFunction.Sus2, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus2_diminished_to_name_sus2_diminished()
    {
        XCTAssertEqual("Sus2Diminished", ChordFunction.Sus2Diminished.Name);
    }

    func test_that_it_should_relate_sus2_diminished_to_abreviature_sus2_dim()
    {
        XCTAssertEqual("Sus2Dim", ChordFunction.Sus2Diminished.Abreviature);
    }

    func test_that_it_should_relate_major_second_diminished_fifth_to_sus2_diminished_chord()
    {
        let intervals = [Interval.MajorSecond, Interval.DiminishedFifth];

        XCTAssertEqual(ChordFunction.Sus2Diminished, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus2_augmented_to_name_sus2_augmented()
    {
        XCTAssertEqual("Sus2Augmented", ChordFunction.Sus2Augmented.Name);
    }

    func test_that_it_should_relate_sus2_augmented_to_abreviature_sus2_aug()
    {
        XCTAssertEqual("Sus2Aug", ChordFunction.Sus2Augmented.Abreviature);
    }

    func test_that_it_should_relate_major_second_augmented_fifth_to_sus2_augmented_chord()
    {
        let intervals = [Interval.MajorSecond, Interval.AugmentedFifth];

        XCTAssertEqual(ChordFunction.Sus2Augmented, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus4_to_name_sus4()
    {
        XCTAssertEqual("Sus4", ChordFunction.Sus4.Name);
    }

    func test_that_it_should_relate_sus4_to_abreviature_sus4()
    {
        XCTAssertEqual("Sus4", ChordFunction.Sus4.Abreviature);
    }

    func test_that_it_should_relate_major_fourth_perfect_fifth_to_sus4_chord()
    {
        let intervals = [Interval.PerfectForth, Interval.PerfectFifth];

        XCTAssertEqual(ChordFunction.Sus4, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus4_diminished_to_name_sus4_diminished()
    {
        XCTAssertEqual("Sus4Diminished", ChordFunction.Sus4Diminished.Name);
    }

    func test_that_it_should_relate_sus4_diminished_to_abreviature_sus4_dim()
    {
        XCTAssertEqual("Sus4Dim", ChordFunction.Sus4Diminished.Abreviature);
    }

    func test_that_it_should_relate_major_fourth_diminished_fifth_to_sus4_diminished_chord()
    {
        let intervals = [Interval.PerfectForth, Interval.DiminishedFifth];

        XCTAssertEqual(ChordFunction.Sus4Diminished, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_sus4_augmented_to_name_sus4_augmented()
    {
        XCTAssertEqual("Sus4Augmented", ChordFunction.Sus4Augmented.Name);
    }

    func test_that_it_should_relate_sus4_augmented_to_abreviature_sus4_aug()
    {
        XCTAssertEqual("Sus4Aug", ChordFunction.Sus4Augmented.Abreviature);
    }

    func test_that_it_should_relate_major_fourth_augmented_fifth_to_sus4_augmented_chord()
    {
        let intervals = [Interval.PerfectForth, Interval.AugmentedFifth];

        XCTAssertEqual(ChordFunction.Sus4Augmented, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_major7_to_name_major7()
    {
        XCTAssertEqual("Major7", ChordFunction.Major7.Name);
    }

    func test_that_it_should_relate_major7_to_abreviature_maj7()
    {
        XCTAssertEqual("Maj7", ChordFunction.Major7.Abreviature);
    }

    func test_that_it_should_relate_major_third_perfect_fifth_major_seventh_to_major7_chord()
    {
        let intervals = [Interval.MajorThird, Interval.PerfectFifth, Interval.MajorSeventh];

        XCTAssertEqual(ChordFunction.Major7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_dominant7_to_name_dominant7()
    {
        XCTAssertEqual("Dominant7", ChordFunction.Dominant7.Name);
    }

    func test_that_it_should_relate_dominant7_to_abreviature_dom7()
    {
        XCTAssertEqual("Dom7", ChordFunction.Dominant7.Abreviature);
    }

    func test_that_it_should_relate_major_third_perfect_fifth_minor_seventh_to_dominant7_chord()
    {
        let intervals = [Interval.MajorThird, Interval.PerfectFifth, Interval.MinorSeventh];

        XCTAssertEqual(ChordFunction.Dominant7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minor7_to_name_minor7()
    {
        XCTAssertEqual("Minor7", ChordFunction.Minor7.Name);
    }

    func test_that_it_should_relate_minor7_to_abreviature_min7()
    {
        XCTAssertEqual("Min7", ChordFunction.Minor7.Abreviature);
    }

    func test_that_it_should_relate_minor_third_perfect_fifth_minor_seventh_to_minor7_chord()
    {
        let intervals = [Interval.MinorThird, Interval.PerfectFifth, Interval.MinorSeventh];

        XCTAssertEqual(ChordFunction.Minor7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minor7b5_to_name_minor7b5()
    {
        XCTAssertEqual("Minor7b5", ChordFunction.Minor7b5.Name);
    }

    func test_that_it_should_relate_minor7b5_to_abreviature_min7b5()
    {
        XCTAssertEqual("Min7b5", ChordFunction.Minor7b5.Abreviature);
    }

    func test_that_it_should_relate_minor_third_diminished_fifth_minor_seventh_to_min7b5_chord()
    {
        let intervals = [Interval.MinorThird, Interval.DiminishedFifth, Interval.MinorSeventh];

        XCTAssertEqual(ChordFunction.Minor7b5, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_dim7_to_name_dim7()
    {
        XCTAssertEqual("Diminished7", ChordFunction.Diminished7.Name);
    }

    func test_that_it_should_relate_dim7_to_abreviature_dim7()
    {
        XCTAssertEqual("Dim7", ChordFunction.Diminished7.Abreviature);
    }

    func test_that_it_should_relate_minor_third_diminished_fifth_major_sixth_to_dim7_chord()
    {
        let intervals = [Interval.MinorThird, Interval.DiminishedFifth, Interval.MajorSixth];

        XCTAssertEqual(ChordFunction.Diminished7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_minMaj7_to_name_minMaj7()
    {
        XCTAssertEqual("MinorMajor7", ChordFunction.MinorMaj7.Name);
    }

    func test_that_it_should_relate_minMaj7_to_abreviature_minMaj7()
    {
        XCTAssertEqual("MinMaj7", ChordFunction.MinorMaj7.Abreviature);
    }

    func test_that_it_should_relate_minor_third_perfect_fifth_major_seventh_to_minMaj7_chord()
    {
        let intervals = [Interval.MinorThird, Interval.PerfectFifth, Interval.MajorSeventh];

        XCTAssertEqual(ChordFunction.MinorMaj7, ChordFunction.functionForIntervals(intervals));
    }

    func test_that_it_should_relate_augmented7_to_name_augmented7()
    {
        XCTAssertEqual("Augmented7", ChordFunction.Augmented7.Name);
    }

    func test_that_it_should_relate_augmented7_to_abreviature_augmented7()
    {
        XCTAssertEqual("Aug7", ChordFunction.Augmented7.Abreviature);
    }

    func test_that_it_should_relate_major_third_augmented_fifth_major_seventh_to_augmented_chord()
    {
        let intervals = [Interval.MajorThird, Interval.AugmentedFifth, Interval.MajorSeventh];

        XCTAssertEqual(ChordFunction.Augmented7, ChordFunction.functionForIntervals(intervals));
    }
}