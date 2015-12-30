public enum ChordShapeFactory: Int
{
    case Closed
    case Drop2
    case Drop3
    
    public func shape(chord: Chord) -> Chord
    {
        switch self
        {
        case Closed:
            return chord.toClosed()
        case Drop2:
            return chord.toClosed().toDrop2()
        case Drop3:
            return chord.toClosed().toDrop3()
        }
    }
    
    public func createInverter(chord:Chord) -> ChordInverter
    {
        switch self
        {
        case Closed:
            return
                ChordInverter(
                    chordNotes: chord.ChordNotes,
                    inversion: chord.Inversion)
        case Drop2:
            return
                Drop2Inverter(
                    chordNotes: chord.ChordNotes,
                    inversion: chord.Inversion)
        case Drop3:
            return
                Drop3Inverter(
                    chordNotes: chord.ChordNotes,
                    inversion: chord.Inversion)
        }
    }
}
