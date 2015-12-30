class Drop2Inverter: ChordInverter
{
    override func invert() -> Chord
    {
        let last = chordNotes.removeLast()
        rotate()
        rotate()
        chordNotes.insert(last, atIndex: 0)
        return createChord()
    }
    
    override func createChord() -> Chord
    {
        let inversion = calculateInvertion()
        return Chord(
            notes: chordNotes,
            inversion:inversion,
            inverterFactory: .Drop2)
    }
    
    override func resetInvertions() -> Chord
    {
        return Chord(notes: chordNotes, inversion:.Root).toClosed().toDrop2()
    }
}
