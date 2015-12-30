public enum KeyHarmonizerFactory: Int
{
    case Triad
    case Seventh
    
    public func createHarmonizer(key: Key) -> KeyHarmonizer
    {
        switch self
        {
        case Triad:
            return TriadsKeyHarmonizer(key: key)
        case Seventh:
            return SeventhsKeyHarmonizer(key: key)
        }
    }
}
