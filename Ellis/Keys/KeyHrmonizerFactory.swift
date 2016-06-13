public enum KeyHarmonizerFactory: Int
{
    case triad
    case seventh
    
    public func createHarmonizer(_ key: Key) -> KeyHarmonizer
    {
        switch self
        {
        case triad:
            return TriadsKeyHarmonizer(key: key)
        case seventh:
            return SeventhsKeyHarmonizer(key: key)
        }
    }
}
