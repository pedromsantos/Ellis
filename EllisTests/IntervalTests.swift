import XCTest
import Ellis

class IntervalTests: XCTestCase
{
    func testThatItShouldRelateDistanceZeroToUnisson()
    {
        XCTAssertEqual(Interval.Unisson, Interval.createIntervalFromDistance(0), "")
    }

    func testThatItShouldRelateDistanceOneToMinorSecond()
    {
        XCTAssertEqual(Interval.MinorSecond, Interval.createIntervalFromDistance(1), "")
    }

    func testThatItShouldRelateDistanceTwoToMajorSecond()
    {
        XCTAssertEqual(Interval.MajorSecond, Interval.createIntervalFromDistance(2), "")
    }

    func testThatItShouldRelateDistanceThreeToMinorThird()
    {
        XCTAssertEqual(Interval.MinorThird, Interval.createIntervalFromDistance(3), "")
    }

    func testThatItShouldRelateDistanceFourToMajorThird()
    {
        XCTAssertEqual(Interval.MajorThird, Interval.createIntervalFromDistance(4), "")
    }

    func testThatItShouldRelateDistanceFiveToPerfectFourth()
    {
        XCTAssertEqual(Interval.PerfectForth, Interval.createIntervalFromDistance(5), "")
    }

    func testThatItShouldRelateDistanceSixToDiminishedFifth()
    {
        XCTAssertEqual(Interval.DiminishedFifth, Interval.createIntervalFromDistance(6), "")
    }

    func testThatItShouldRelateDistanceSevenToPerfectFifth()
    {
        XCTAssertEqual(Interval.PerfectFifth, Interval.createIntervalFromDistance(7), "")
    }

    func testThatItShouldRelateDistanceEigthToAugmentedFifth()
    {
        XCTAssertEqual(Interval.AugmentedFifth, Interval.createIntervalFromDistance(8), "")
    }

    func testThatItShouldRelateDistanceNineToMajorSixth()
    {
        XCTAssertEqual(Interval.MajorSixth, Interval.createIntervalFromDistance(9), "")
    }

    func testThatItShouldRelateDistanceTenToMinorSeventh()
    {
        XCTAssertEqual(Interval.MinorSeventh, Interval.createIntervalFromDistance(10), "")
    }

    func testThatItShouldRelateDistanceEleventhToMajorSeventh()
    {
        XCTAssertEqual(Interval.MajorSeventh, Interval.createIntervalFromDistance(11), "")
    }

    func testThatItShouldRelateDistanceTwelveToPerfectOctave()
    {
        XCTAssertEqual(Interval.PerfectOctave, Interval.createIntervalFromDistance(12), "")
    }
    
    func testThatItSubtractingAMinorSecondFromAnOctaveIsAMajorSeventh()
    {
        XCTAssertEqual(Interval.PerfectOctave - Interval.MinorSecond, Interval.MajorSeventh.rawValue, "")
    }
    
    func testThatOctaveIsGreaterThamMajorSeventh()
    {
        XCTAssertTrue(Interval.PerfectOctave > Interval.MajorSeventh, "")
    }
}

