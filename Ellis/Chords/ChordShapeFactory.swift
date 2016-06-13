public enum ChordShapeFactory: Int
{
    case closed
    case drop2
    case drop3
    
    public func shape(_ chord: Chord) -> Chord
    {
        switch self
        {
        case closed:
            return chord.toClosed()
        case drop2:
            return chord.toClosed().toDrop2()
        case drop3:
            return chord.toClosed().toDrop3()
        }
    }
    
    public func createInverter(_ chord:Chord) -> ChordInverter
    {
        switch self
        {
        case closed:
            return
                ChordInverter(
                    chordNotes: chord.notesWithFunctions,
                    inversion: chord.Inversion)
        case drop2:
            return
                Drop2Inverter(
                    chordNotes: chord.notesWithFunctions,
                    inversion: chord.Inversion)
        case drop3:
            return
                Drop3Inverter(
                    chordNotes: chord.notesWithFunctions,
                    inversion: chord.Inversion)
        }
    }
}
