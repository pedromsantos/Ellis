public class ChordInverter
{
    var chordNotes: [NoteWithFunction]
    let inversion:Inversions
    
    init(chordNotes: [NoteWithFunction], inversion:Inversions)
    {
        self.inversion = inversion
        self.chordNotes = chordNotes
    }
    
    func invert() -> Chord
    {
        rotate()
        return createChord()
    }
    
    func rotate()
    {
        let first = chordNotes.removeAtIndex(0)
        chordNotes.append(first)
    }
    
    func createChord() -> Chord {
        return Chord(notes: chordNotes, inversion:calculateInvertion())
    }
    
    func resetInvertions() -> Chord
    {
        return Chord(notes: chordNotes, inversion:.Root).toClosed()
    }
    
    func calculateInvertion() -> Inversions
    {
        var newInversionRaw = inversion.rawValue + 1
        if newInversionRaw >= chordNotes.count
        {
            newInversionRaw = 0
        }
        
        return Inversions(rawValue: newInversionRaw)!
    }
}
