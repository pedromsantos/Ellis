public enum Inversions:Int {
    case Root, First, Second, Third
}

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
    
    private func calculateInvertion() -> Inversions
    {
        var newInversionRaw = inversion.rawValue + 1
        if newInversionRaw >= chordNotes.count
        {
            newInversionRaw = 0
        }
        
        return Inversions(rawValue: newInversionRaw)!
    }
}

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
                    chordNotes: chord.chordNotes,
                    inversion: chord.Inversion)
        case Drop2:
            return
                Drop2Inverter(
                    chordNotes: chord.chordNotes,
                    inversion: chord.Inversion)
        case Drop3:
            return
                Drop3Inverter(
                    chordNotes: chord.chordNotes,
                    inversion: chord.Inversion)
        }
    }
}