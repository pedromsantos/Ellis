public class KeyHarmonizer
{
    var key: Key

    public init(key: Key)
    {
        self.key = key
    }

    public var Chords: [Chord]
    {
        return [
            self.i(),
            self.ii(),
            self.iii(),
            self.iv(),
            self.v(),
            self.vi(),
            self.vii()
        ]
    }

    public func chordForScaleDegree(scaleDegree: Int) -> Chord
    {
        return Chords[scaleDegree]
    }

    public func updateKey(key: Key)
    {
        self.key = key
    }

    public func i() -> Chord
    {
        return buildChord()
    }

    public func ii() -> Chord
    {
        return buildChord()
    }

    public func iii() -> Chord
    {
        return buildChord()
    }

    public func iv() -> Chord
    {
        return buildChord()
    }

    public func v() -> Chord
    {
        return buildChord()
    }

    public func vi() -> Chord
    {
        return buildChord()
    }

    public func vii() -> Chord
    {
        return buildChord()
    }

    private func buildChord() -> Chord
    {
        return ChordBuilder(root: key.i())
        .build()
    }
}

public enum KeyHarmonizerFactory: Int
{
    case Triad
    case Seventh

    public func create(key: Key) -> KeyHarmonizer
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