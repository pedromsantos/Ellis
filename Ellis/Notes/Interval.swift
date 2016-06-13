public enum Interval: Int
{
    case unisson = 0
    case minorSecond
    case majorSecond
    case minorThird
    case majorThird
    case perfectForth
    case diminishedFifth
    case perfectFifth
    case augmentedFifth
    case majorSixth
    case minorSeventh
    case majorSeventh
    case perfectOctave

    public static func createIntervalFromDistance(_ distance: Int) -> Interval
    {
        if let interval = Interval(rawValue: distance)
        {
            return interval
        }

        return Interval.unisson
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
