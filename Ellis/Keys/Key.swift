public enum Key: Int
{
    case AMajor
    case AFlatMajor
    case BMajor
    case BFlatMajor
    case CMajor
    case CSharpMajor
    case DMajor
    case DFlatMajor
    case EMajor
    case EFlatMajor
    case FMajor
    case FSharpMajor
    case GMajor
    case GFlatMajor
    case AMinor
    case AFlatMinor
    case ASharpMinor
    case BMinor
    case BFlatMinor
    case CMinor
    case CSharpMinor
    case DMinor
    case EFlatMinor
    case EMinor
    case FMinor
    case FSharpMinor
    case GMinor
    case GSharpMinor

    private static let fifths =
        [Note.F, Note.C, Note.G, Note.D, Note.A, Note.E, Note.B]
    
    private static let allValues =
    [
        (Relative: Key.FSharpMinor, Root: Note.A, Accidents: 3, Quality: KeyQuality.Major),
        (Relative: Key.FMinor, Root: Note.AFlat, Accidents: -4, Quality: KeyQuality.Major),
        (Relative: Key.GSharpMinor, Root: Note.B, Accidents: 5, Quality: KeyQuality.Major),
        (Relative: Key.GMinor, Root: Note.BFlat, Accidents: -2, Quality: KeyQuality.Major),
        (Relative: Key.AMinor, Root: Note.C, Accidents: 0, Quality: KeyQuality.Major),
        (Relative: Key.BFlatMinor, Root: Note.CSharp, Accidents: 7, Quality: KeyQuality.Major),
        (Relative: Key.BMinor, Root: Note.D, Accidents: 2, Quality: KeyQuality.Major),
        (Relative: Key.BFlatMinor, Root: Note.DFlat, Accidents: -5, Quality: KeyQuality.Major),
        (Relative: Key.CSharpMinor, Root: Note.E, Accidents: 4, Quality: KeyQuality.Major),
        (Relative: Key.CMinor, Root: Note.EFlat, Accidents: -3, Quality: KeyQuality.Major),
        (Relative: Key.DMinor, Root: Note.F, Accidents: -1, Quality: KeyQuality.Major),
        (Relative: Key.EFlatMinor, Root: Note.FSharp, Accidents: 6, Quality: KeyQuality.Major),
        (Relative: Key.EMinor, Root: Note.G, Accidents: 1, Quality: KeyQuality.Major),
        (Relative: Key.EFlatMinor, Root: Note.GFlat, Accidents: -6, Quality: KeyQuality.Major),
        (Relative: Key.CMajor, Root: Note.A, Accidents: 0, Quality: KeyQuality.Minor),
        (Relative: Key.BMajor, Root: Note.AFlat, Accidents: -7, Quality: KeyQuality.Minor),
        (Relative: Key.CSharpMinor, Root: Note.ASharp, Accidents: 7, Quality: KeyQuality.Minor),
        (Relative: Key.DMajor, Root: Note.B, Accidents: 2, Quality: KeyQuality.Minor),
        (Relative: Key.DFlatMajor, Root: Note.BFlat, Accidents: -5, Quality: KeyQuality.Minor),
        (Relative: Key.EFlatMajor, Root: Note.C, Accidents: -3, Quality: KeyQuality.Minor),
        (Relative: Key.EMajor, Root: Note.CSharp, Accidents: 4, Quality: KeyQuality.Minor),
        (Relative: Key.FMajor, Root: Note.D, Accidents: -1, Quality: KeyQuality.Minor),
        (Relative: Key.GFlatMajor, Root: Note.EFlat, Accidents: -6, Quality: KeyQuality.Minor),
        (Relative: Key.GMajor, Root: Note.E, Accidents: 1, Quality: KeyQuality.Minor),
        (Relative: Key.AFlatMajor, Root: Note.F, Accidents: -4, Quality: KeyQuality.Minor),
        (Relative: Key.AMajor, Root: Note.FSharp, Accidents: 3, Quality: KeyQuality.Minor),
        (Relative: Key.BFlatMajor, Root: Note.G, Accidents: -2, Quality: KeyQuality.Minor),
        (Relative: Key.BMajor, Root: Note.GSharp, Accidents: 5, Quality: KeyQuality.Minor)
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
        return self.quality == KeyQuality.Minor
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

    public func degreeForNote(note:Note) -> Int
    {
        return generateKeyNotes().indexOf(note)! + 1
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
        var keyNotes = Array(Key.fifths.reverse())
        let max = (-1) * accidents

        for var i = 0; i < max; i++
        {
            keyNotes[i] = keyNotes[i].flat()
        }

        return keyNotes
    }

    private func createKeyFromSharpAccidents() -> [Note]
    {
        var keyNotes = Key.fifths
        let max = accidents

        for var i = 0; i < max; i++
        {
            keyNotes[i] = keyNotes[i].sharp()
        }

        return keyNotes
    }

    private func sortKeyNotes(notes: [Note]) -> [Note]
    {
        var sortedkeyNotes = notes.sort({ n1, n2 in return n2 > n1 })

        if(sortedkeyNotes.first == root)
        {
            return sortedkeyNotes
        }

        var last: Note? = nil

        while(last != root)
        {
            last = sortedkeyNotes.last
            sortedkeyNotes.removeLast()
            sortedkeyNotes.insert(last!, atIndex: 0)
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