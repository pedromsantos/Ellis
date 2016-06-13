import XCTest
import Ellis

class IntervalTests: XCTestCase
{
    func testThatItShouldRelateDistanceZeroToUnisson()
    {
        XCTAssertEqual(Interval.unisson, Interval.createIntervalFromDistance(0), "")
    }

    func testThatItShouldRelateDistanceOneToMinorSecond()
    {
        XCTAssertEqual(Interval.minorSecond, Interval.createIntervalFromDistance(1), "")
    }

    func testThatItShouldRelateDistanceTwoToMajorSecond()
    {
        XCTAssertEqual(Interval.majorSecond, Interval.createIntervalFromDistance(2), "")
    }

    func testThatItShouldRelateDistanceThreeToMinorThird()
    {
        XCTAssertEqual(Interval.minorThird, Interval.createIntervalFromDistance(3), "")
    }

    func testThatItShouldRelateDistanceFourToMajorThird()
    {
        XCTAssertEqual(Interval.majorThird, Interval.createIntervalFromDistance(4), "")
    }

    func testThatItShouldRelateDistanceFiveToPerfectFourth()
    {
        XCTAssertEqual(Interval.perfectForth, Interval.createIntervalFromDistance(5), "")
    }

    func testThatItShouldRelateDistanceSixToDiminishedFifth()
    {
        XCTAssertEqual(Interval.diminishedFifth, Interval.createIntervalFromDistance(6), "")
    }

    func testThatItShouldRelateDistanceSevenToPerfectFifth()
    {
        XCTAssertEqual(Interval.perfectFifth, Interval.createIntervalFromDistance(7), "")
    }

    func testThatItShouldRelateDistanceEigthToAugmentedFifth()
    {
        XCTAssertEqual(Interval.augmentedFifth, Interval.createIntervalFromDistance(8), "")
    }

    func testThatItShouldRelateDistanceNineToMajorSixth()
    {
        XCTAssertEqual(Interval.majorSixth, Interval.createIntervalFromDistance(9), "")
    }

    func testThatItShouldRelateDistanceTenToMinorSeventh()
    {
        XCTAssertEqual(Interval.minorSeventh, Interval.createIntervalFromDistance(10), "")
    }

    func testThatItShouldRelateDistanceEleventhToMajorSeventh()
    {
        XCTAssertEqual(Interval.majorSeventh, Interval.createIntervalFromDistance(11), "")
    }

    func testThatItShouldRelateDistanceTwelveToPerfectOctave()
    {
        XCTAssertEqual(Interval.perfectOctave, Interval.createIntervalFromDistance(12), "")
    }
    
    func testThatItSubtractingAMinorSecondFromAnOctaveIsAMajorSeventh()
    {
        XCTAssertEqual(Interval.perfectOctave - Interval.minorSecond, Interval.majorSeventh.rawValue, "")
    }
    
    func testThatOctaveIsGreaterThamMajorSeventh()
    {
        XCTAssertTrue(Interval.perfectOctave > Interval.majorSeventh, "")
    }
}

