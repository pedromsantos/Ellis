public enum Accident: Int
{
    case flat, none, sharp

    public func direction() -> Int
    {
        return self == Accident.flat ? -1 : 1
    }
}
