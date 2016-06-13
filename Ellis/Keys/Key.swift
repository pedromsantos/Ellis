public enum Key: Int
{
    case aMajor
    case aFlatMajor
    case bMajor
    case bFlatMajor
    case cMajor
    case cSharpMajor
    case dMajor
    case dFlatMajor
    case eMajor
    case eFlatMajor
    case fMajor
    case fSharpMajor
    case gMajor
    case gFlatMajor
    case aMinor
    case aFlatMinor
    case aSharpMinor
    case bMinor
    case bFlatMinor
    case cMinor
    case cSharpMinor
    case dMinor
    case eFlatMinor
    case eMinor
    case fMinor
    case fSharpMinor
    case gMinor
    case gSharpMinor

    private static let fifths =
        [Note.f, Note.c, Note.g, Note.d, Note.a, Note.e, Note.b]
    
    private static let allValues =
    [
        (Relative: Key.fSharpMinor, Root: Note.a, Accidents: 3, Quality: KeyQuality.major),
        (Relative: Key.fMinor, Root: Note.aFlat, Accidents: -4, Quality: KeyQuality.major),
        (Relative: Key.gSharpMinor, Root: Note.b, Accidents: 5, Quality: KeyQuality.major),
        (Relative: Key.gMinor, Root: Note.bFlat, Accidents: -2, Quality: KeyQuality.major),
        (Relative: Key.aMinor, Root: Note.c, Accidents: 0, Quality: KeyQuality.major),
        (Relative: Key.bFlatMinor, Root: Note.cSharp, Accidents: 7, Quality: KeyQuality.major),
        (Relative: Key.bMinor, Root: Note.d, Accidents: 2, Quality: KeyQuality.major),
        (Relative: Key.bFlatMinor, Root: Note.dFlat, Accidents: -5, Quality: KeyQuality.major),
        (Relative: Key.cSharpMinor, Root: Note.e, Accidents: 4, Quality: KeyQuality.major),
        (Relative: Key.cMinor, Root: Note.eFlat, Accidents: -3, Quality: KeyQuality.major),
        (Relative: Key.dMinor, Root: Note.f, Accidents: -1, Quality: KeyQuality.major),
        (Relative: Key.eFlatMinor, Root: Note.fSharp, Accidents: 6, Quality: KeyQuality.major),
        (Relative: Key.eMinor, Root: Note.g, Accidents: 1, Quality: KeyQuality.major),
        (Relative: Key.eFlatMinor, Root: Note.gFlat, Accidents: -6, Quality: KeyQuality.major),
        (Relative: Key.cMajor, Root: Note.a, Accidents: 0, Quality: KeyQuality.minor),
        (Relative: Key.bMajor, Root: Note.aFlat, Accidents: -7, Quality: KeyQuality.minor),
        (Relative: Key.cSharpMinor, Root: Note.aSharp, Accidents: 7, Quality: KeyQuality.minor),
        (Relative: Key.dMajor, Root: Note.b, Accidents: 2, Quality: KeyQuality.minor),
        (Relative: Key.dFlatMajor, Root: Note.bFlat, Accidents: -5, Quality: KeyQuality.minor),
        (Relative: Key.eFlatMajor, Root: Note.c, Accidents: -3, Quality: KeyQuality.minor),
        (Relative: Key.eMajor, Root: Note.cSharp, Accidents: 4, Quality: KeyQuality.minor),
        (Relative: Key.fMajor, Root: Note.d, Accidents: -1, Quality: KeyQuality.minor),
        (Relative: Key.gFlatMajor, Root: Note.eFlat, Accidents: -6, Quality: KeyQuality.minor),
        (Relative: Key.gMajor, Root: Note.e, Accidents: 1, Quality: KeyQuality.minor),
        (Relative: Key.aFlatMajor, Root: Note.f, Accidents: -4, Quality: KeyQuality.minor),
        (Relative: Key.aMajor, Root: Note.fSharp, Accidents: 3, Quality: KeyQuality.minor),
        (Relative: Key.bFlatMajor, Root: Note.g, Accidents: -2, Quality: KeyQuality.minor),
        (Relative: Key.bMajor, Root: Note.gSharp, Accidents: 5, Quality: KeyQuality.minor)
    ]

    public var rootName: String
    {
        return root.Name
    }

    public var keyNotes:[Note]
    {
        return generateKeyNotes()
    }
    
    public var KeyNoteNames:[String]
    {
        return generateKeyNotes().map({ (note:Note) in return note.Name })
    }

    public func i() -> Note
    {
        return generateKeyNotes()[0]
    }

    public func ii() -> Note
    {
        return generateKeyNotes()[1]
    }

    public func iii() -> Note
    {
        return generateKeyNotes()[2]
    }

    public func iv() -> Note
    {
        return generateKeyNotes()[3]
    }

    public func v() -> Note
    {
        return generateKeyNotes()[4]
    }

    public func vi() -> Note
    {
        return generateKeyNotes()[5]
    }

    public func vii() -> Note
    {
        return self.quality == KeyQuality.minor
                ? generateKeyNotes()[6].sharp()
                : generateKeyNotes()[6]
    }

    public var quality: KeyQuality
    {
        return Key.allValues[self.rawValue].Quality
    }

    public var relativeKey: Key
    {
        return Key.allValues[self.rawValue].Relative
    }

    public func degreeForNote(_ note:Note) -> Int
    {
        return generateKeyNotes().index(of: note)! + 1
    }
    
    private func generateKeyNotes() -> [Note]
    {
        if self.accidents < 0
        {
            return sortKeyNotes(createKeyFromFlatAccidents())
        }

        if self.accidents > 0
        {
            return sortKeyNotes(createKeyFromSharpAccidents())
        }

        return sortKeyNotes(Key.fifths);
    }

    private func createKeyFromFlatAccidents() -> [Note]
    {
        var keyNotes = Array(Key.fifths.reversed())
        let max = (-1) * accidents

        for i in 0 ..< max
        {
            keyNotes[i] = keyNotes[i].flat()
        }

        return keyNotes
    }

    private func createKeyFromSharpAccidents() -> [Note]
    {
        var keyNotes = Key.fifths
        let max = accidents

        for i in 0 ..< max
        {
            keyNotes[i] = keyNotes[i].sharp()
        }

        return keyNotes
    }

    private func sortKeyNotes(_ notes: [Note]) -> [Note]
    {
        var sortedkeyNotes = notes.sorted(isOrderedBefore: { n1, n2 in return n2 > n1 })

        if(sortedkeyNotes.first == root)
        {
            return sortedkeyNotes
        }

        var last: Note? = nil

        while(last != root)
        {
            last = sortedkeyNotes.last
            sortedkeyNotes.removeLast()
            sortedkeyNotes.insert(last!, at: 0)
        }

        return sortedkeyNotes
    }

    private var root: Note
    {
        return Key.allValues[self.rawValue].Root
    }

    private var accidents: Int
    {
        return Key.allValues[self.rawValue].Accidents
    }
}
