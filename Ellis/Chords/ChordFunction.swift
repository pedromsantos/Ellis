public enum ChordFunction: Int
{
    case Major
    case Augmented
    case Minor
    case Diminished
    case Sus2
    case Sus2Diminished
    case Sus2Augmented
    case Sus4
    case Sus4Diminished
    case Sus4Augmented
    case Major7
    case Dominant7
    case Minor7b5
    case Diminished7
    case Minor7
    case MinorMaj7
    case Augmented7

    private static let allValues =
    [
        (Function: Major, Name: "Major", Abreviature: "Maj"),
        (Function: Augmented, Name: "Augmented", Abreviature: "Aug"),
        (Function: Minor, Name: "Minor", Abreviature: "Min"),
        (Function: Diminished, Name: "Diminished", Abreviature: "Dim"),
        (Function: Sus2, Name: "Sus2", Abreviature: "Sus2"),
        (Function: Sus2Diminished, Name: "Sus2Diminished", Abreviature: "Sus2Dim"),
        (Function: Sus2Augmented, Name: "Sus2Augmented", Abreviature: "Sus2Aug"),
        (Function: Sus4, Name: "Sus4", Abreviature: "Sus4"),
        (Function: Sus4Diminished, Name: "Sus4Diminished", Abreviature: "Sus4Dim"),
        (Function: Sus4Augmented, Name: "Sus4Augmented", Abreviature: "Sus4Aug"),
        (Function: Major7, Name: "Major7", Abreviature: "Maj7"),
        (Function: Dominant7, Name: "Dominant7", Abreviature: "Dom7"),
        (Function: Minor7b5, Name: "Minor7b5", Abreviature: "Min7b5"),
        (Function: Diminished7, Name: "Diminished7", Abreviature: "Dim7"),
        (Function: Minor7, Name: "Minor7", Abreviature: "Min7"),
        (Function: MinorMaj7, Name: "MinorMajor7", Abreviature: "MinMaj7"),
        (Function: Augmented7, Name: "Augmented7", Abreviature: "Aug7")
    ]

    private static let allIntervals =
    [
        [Interval.MajorThird, Interval.PerfectFifth],
        [Interval.MajorThird, Interval.AugmentedFifth],
        [Interval.MinorThird, Interval.PerfectFifth],
        [Interval.MinorThird, Interval.DiminishedFifth],
        [Interval.MajorSecond, Interval.PerfectFifth],
        [Interval.MajorSecond, Interval.DiminishedFifth],
        [Interval.MajorSecond, Interval.AugmentedFifth],
        [Interval.PerfectForth, Interval.PerfectFifth],
        [Interval.PerfectForth, Interval.DiminishedFifth],
        [Interval.PerfectForth, Interval.AugmentedFifth],
        [Interval.MajorThird, Interval.PerfectFifth, Interval.MajorSeventh],
        [Interval.MajorThird, Interval.PerfectFifth, Interval.MinorSeventh],
        [Interval.MinorThird, Interval.DiminishedFifth, Interval.MinorSeventh],
        [Interval.MinorThird, Interval.DiminishedFifth, Interval.MajorSixth],
        [Interval.MinorThird, Interval.PerfectFifth, Interval.MinorSeventh],
        [Interval.MinorThird, Interval.PerfectFifth, Interval.MajorSeventh],
        [Interval.MajorThird, Interval.AugmentedFifth, Interval.MajorSeventh]
    ]

    public static func functionForIntervals(intervals: [Interval]) -> ChordFunction
    {
        for function in ChordFunction.allValues
        {
            if function.Function.Intervals == intervals
            {
                return function.Function;
            }
        }

        return ChordFunction.Major;
    }

    public var Intervals: [Interval]
    {
        return ChordFunction.allIntervals[self.rawValue]
    }

    public var Name: String
    {
        return ChordFunction.allValues[self.rawValue].Name
    }

    public var Abreviature: String
    {
        return ChordFunction.allValues[self.rawValue].Abreviature
    }
}