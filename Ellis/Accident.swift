public enum Accident: Int
{
    case Flat, None, Sharp

    public func direction() -> Int
    {
        return self == Accident.Flat ? -1 : 1
    }
}