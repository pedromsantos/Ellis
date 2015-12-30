class Drop3Inverter: ChordInverter
{
    override func invert() -> Chord
    {
        rotate()
        rotate()
        swapChordNotes(1, secondNoteIndex: 2)
        return createChord()
    }
    
    override func createChord() -> Chord {
        let inversion = calculateInvertion()
        return Chord(
            notes: chordNotes,
            inversion:inversion,
            inverterFactory: .Drop3)
    }
    
    override func resetInvertions() -> Chord
    {
        return Chord(notes: chordNotes, inversion:.Root).toClosed().toDrop3()
    }
    
    private func swapChordNotes(firstNoteIndex: Int, secondNoteIndex: Int)
    {
        let first = chordNotes[firstNoteIndex]
        chordNotes[firstNoteIndex] = chordNotes[secondNoteIndex]
        chordNotes[secondNoteIndex] = first
    }
}
