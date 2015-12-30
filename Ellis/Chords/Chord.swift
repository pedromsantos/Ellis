public class Chord: Equatable
{
    private let inversion:Inversions
    private let chordNotes: [NoteWithFunction]
    private let inverterFactory:ChordShapeFactory
    
    public init(
        notes: [NoteWithFunction],
        inversion:Inversions = .Root,
        inverterFactory:ChordShapeFactory = .Closed)
    {
        chordNotes = notes
        self.inversion = inversion
        self.inverterFactory = inverterFactory
    }
    
    public var shapeFactory:ChordShapeFactory
    {
        return inverterFactory
    }
    
    public var ChordNotes:[NoteWithFunction]
    {
        return chordNotes
    }
    
    public var notes:[Note]
    {
        return chordNotes.map(
            { (note: NoteWithFunction) -> Note in return note.note })
    }
    
    public var functions:[NoteFunction]
    {
        return chordNotes.map(
            { (note: NoteWithFunction) -> NoteFunction in return note.function })
    }
    
    public var noteNames:[String]
    {
        return chordNotes.map(
            { (note: NoteWithFunction) -> String in return note.note.Name })
    }
    
    public var noteFunctionNames:[String]
    {
        return chordNotes.map(
            { (note: NoteWithFunction) -> String in return note.function.name })
    }
    
    public var bass:Note
    {
        return chordNotes.first!.note
    }
    
    public var lead:Note
    {
        return chordNotes.last!.note
    }
    
    public var function:ChordFunction
    {
        return ChordFunction.functionForIntervals(chordIntervals())
    }
    
    public var name:String
    {
        let closedChord = self.toClosed()
        return closedChord.noteByFunction(NoteFunction.Root).Name
            + closedChord.function.Abreviature;
    }
    
    public var Inversion:Inversions
    {
        return inversion
    }
    
    public var Shape:ChordShapeFactory
    {
        return inverterFactory
    }
    
    public func noteByFunction(function: NoteFunction) -> Note
    {
        return chordNotes.filter({ $0.function == function }).first!.note
    }
    
    public func invert() -> Chord
    {
        let inverter = inverterFactory.createInverter(self)
        return inverter.invert()
    }
    
    public func resetInvertions() -> Chord
    {
        let inverter = inverterFactory.createInverter(self)
        return inverter.resetInvertions()
    }
    
    public func toDrop2() -> Chord
    {
        var drop2ChordNotes = swapedChordNotes(0, secondNoteIndex: 1)
        let first = drop2ChordNotes.removeAtIndex(0)
        drop2ChordNotes.append(first)
        
        return Chord(
            notes: drop2ChordNotes,
            inversion: .Root,
            inverterFactory:.Drop2)
    }
    
    public func toDrop3() -> Chord
    {
        let chord = toDrop2().toDrop2()
        
        return Chord(
            notes: chord.chordNotes,
            inversion: .Root,
            inverterFactory:.Drop3)
    }
    
    public func toClosed() -> Chord
    {
        var closedChordNotes = chordNotes
        for chordNote in closedChordNotes
        {
            closedChordNotes[chordNote.closedChordNoteIndex] = chordNote;
        }
        
        return Chord(notes: closedChordNotes)
    }
    
    public func transpose(newRoot: Note) -> Chord
    {
        let interval = noteByFunction(NoteFunction.Root)
            .intervalWithNote(newRoot)
        var transposedNotes = [NoteWithFunction]()
        
        for chordNote in chordNotes
        {
            let transposedNote = chordNote.note.transpose(interval)
            let transposedNoteWithFunction =
            NoteWithFunction(
                note: transposedNote,
                function: chordNote.function)
            transposedNotes.append(transposedNoteWithFunction)
        }
        
        return Chord(notes: transposedNotes)
    }
    
    public func voiceForBass(desiredBass: NoteFunction) -> Chord
    {
        return voiceForNoteFunction(desiredBass,
            closure: {
                (chord: Chord) -> NoteWithFunction in
                return chord.bassWithFunction()
        })
    }
    
    public func voiceForLead(desiredLead: NoteFunction) -> Chord
    {
        return voiceForNoteFunction(desiredLead,
            closure: {
                (chord: Chord) -> NoteWithFunction in
                return chord.leadWithFunction()
        })
    }
    
    public func invertionWithLeadClosestToNote(leadTarget: Note) -> Chord
    {
        var chord = self
        var bestInversion = self
        var lead = chord.lead
        var currentMinimumDistance = leadTarget.measureAbsoluteSemitones(lead)
        
        for _ in chordNotes
        {
            lead = chord.lead
            let newMinimunDistance = min(
                leadTarget.measureAbsoluteSemitones(lead),
                lead.measureAbsoluteSemitones(leadTarget))
            
            if(newMinimunDistance < currentMinimumDistance)
            {
                bestInversion = Chord(
                    notes: chord.chordNotes,
                    inversion:chord.inversion)
                
                currentMinimumDistance = newMinimunDistance
            }
            
            chord = chord.invert()
        }
        
        return bestInversion
    }
    
    private func voiceForNoteFunction(
        desiredNoteFunction: NoteFunction,
        closure: (chord:Chord) -> NoteWithFunction) -> Chord
    {
        var invertedChord = self
        var noteFunctionForCurrentInvertion = closure(chord: invertedChord)
        
        while(noteFunctionForCurrentInvertion.function != desiredNoteFunction)
        {
            invertedChord = invertedChord.invert();
            noteFunctionForCurrentInvertion = closure(chord: invertedChord);
        }
        
        return invertedChord;
    }
    
    private func bassWithFunction() -> NoteWithFunction
    {
        return chordNotes.first!
    }
    
    private func leadWithFunction() -> NoteWithFunction
    {
        return chordNotes.last!
    }
    
    private func swapedChordNotes(
        firstNoteIndex: Int,
        secondNoteIndex: Int) -> [NoteWithFunction]
    {
        var chordNotesSwaped = self.chordNotes
        
        let first = chordNotesSwaped[firstNoteIndex]
        chordNotesSwaped[firstNoteIndex] = chordNotesSwaped[secondNoteIndex]
        chordNotesSwaped[secondNoteIndex] = first
        
        return chordNotesSwaped
    }
    
    private func chordIntervals() -> [Interval]
    {
        var intervals: [Interval] = []
        let root = noteByFunction(NoteFunction.Root)
        
        for note: NoteWithFunction in chordNotes
        {
            if note.note != root
            {
                intervals.append(root.intervalWithNote(note.note))
            }
        }
        
        return intervals
    }
    
    public func equalTo(otherChord: Chord) -> Bool
    {
        if self.chordNotes.count != otherChord.chordNotes.count
        {
            return false
        }
        
        for var i = 0; i < self.chordNotes.count; i++
        {
            if !(self.chordNotes[i] == otherChord.chordNotes[i])
            {
                return false
            }
        }
        
        return true
    }
}

public func ==(chordA: Chord, chordB: Chord) -> Bool
{
    return chordA.equalTo(chordB)
}