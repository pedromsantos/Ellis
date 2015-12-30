public enum Interval: Int
{
    case Unisson = 0
    case MinorSecond
    case MajorSecond
    case MinorThird
    case MajorThird
    case PerfectForth
    case DiminishedFifth
    case PerfectFifth
    case AugmentedFifth
    case MajorSixth
    case MinorSeventh
    case MajorSeventh
    case PerfectOctave

    public static func createIntervalFromDistance(distance: Int) -> Interval
    {
        if let interval = Interval(rawValue: distance)
        {
            return interval
        }

        return Interval.Unisson
    }
}

public func -(intervalA: Interval, intervalB: Interval) -> Int
{
    return intervalA.rawValue - intervalB.rawValue
}

public func >(intervalA: Interval, intervalB: Interval) -> Bool
{
    return intervalA.rawValue > intervalB.rawValue
}