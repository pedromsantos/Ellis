public enum ChordFunction: Int
{
    case major
    case augmented
    case minor
    case diminished
    case sus2
    case sus2Diminished
    case sus2Augmented
    case sus4
    case sus4Diminished
    case sus4Augmented
    case major7
    case dominant7
    case minor7b5
    case diminished7
    case minor7
    case minorMaj7
    case augmented7

    private static let allValues =
    [
        (Function: major, Name: "Major", Abreviature: "Maj"),
        (Function: augmented, Name: "Augmented", Abreviature: "Aug"),
        (Function: minor, Name: "Minor", Abreviature: "Min"),
        (Function: diminished, Name: "Diminished", Abreviature: "Dim"),
        (Function: sus2, Name: "Sus2", Abreviature: "Sus2"),
        (Function: sus2Diminished, Name: "Sus2Diminished", Abreviature: "Sus2Dim"),
        (Function: sus2Augmented, Name: "Sus2Augmented", Abreviature: "Sus2Aug"),
        (Function: sus4, Name: "Sus4", Abreviature: "Sus4"),
        (Function: sus4Diminished, Name: "Sus4Diminished", Abreviature: "Sus4Dim"),
        (Function: sus4Augmented, Name: "Sus4Augmented", Abreviature: "Sus4Aug"),
        (Function: major7, Name: "Major7", Abreviature: "Maj7"),
        (Function: dominant7, Name: "Dominant7", Abreviature: "Dom7"),
        (Function: minor7b5, Name: "Minor7b5", Abreviature: "Min7b5"),
        (Function: diminished7, Name: "Diminished7", Abreviature: "Dim7"),
        (Function: minor7, Name: "Minor7", Abreviature: "Min7"),
        (Function: minorMaj7, Name: "MinorMajor7", Abreviature: "MinMaj7"),
        (Function: augmented7, Name: "Augmented7", Abreviature: "Aug7")
    ]

    private static let allIntervals =
    [
        [Interval.majorThird, Interval.perfectFifth],
        [Interval.majorThird, Interval.augmentedFifth],
        [Interval.minorThird, Interval.perfectFifth],
        [Interval.minorThird, Interval.diminishedFifth],
        [Interval.majorSecond, Interval.perfectFifth],
        [Interval.majorSecond, Interval.diminishedFifth],
        [Interval.majorSecond, Interval.augmentedFifth],
        [Interval.perfectForth, Interval.perfectFifth],
        [Interval.perfectForth, Interval.diminishedFifth],
        [Interval.perfectForth, Interval.augmentedFifth],
        [Interval.majorThird, Interval.perfectFifth, Interval.majorSeventh],
        [Interval.majorThird, Interval.perfectFifth, Interval.minorSeventh],
        [Interval.minorThird, Interval.diminishedFifth, Interval.minorSeventh],
        [Interval.minorThird, Interval.diminishedFifth, Interval.majorSixth],
        [Interval.minorThird, Interval.perfectFifth, Interval.minorSeventh],
        [Interval.minorThird, Interval.perfectFifth, Interval.majorSeventh],
        [Interval.majorThird, Interval.augmentedFifth, Interval.majorSeventh]
    ]

    public static func functionForIntervals(_ intervals: [Interval]) -> ChordFunction
    {
        for function in ChordFunction.allValues
        {
            if function.Function.Intervals == intervals
            {
                return function.Function;
            }
        }

        return ChordFunction.major;
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
