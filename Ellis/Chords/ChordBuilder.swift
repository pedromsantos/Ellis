public class ChordBuilder
{
    private var notes: [NoteWithFunction]
    private let root: NoteWithFunction

    public init(root: Note)
    {
        notes = [NoteWithFunction]()
        self.root = NoteWithFunction(note: root, function: NoteFunction.root)
        notes.append(self.root)
    }

    public convenience init(root: Note, chordFunction: ChordFunction)
    {
        self.init(root: root)
        var functionIndex = 1

        for interval in chordFunction.Intervals
        {
            let _ = addNoteWithInterval(
                interval,
                function: NoteFunction(rawValue: functionIndex)!)
            functionIndex += 1
        }
    }

    public func build() -> Chord
    {
        return Chord(notes: notes)
    }

    public func addNoteWithInterval(
        _ interval: Interval,
        function: NoteFunction) -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(interval)
        notes.append(
            NoteWithFunction(note: note.sharp().flat(), function: function))
        return self
    }

    public func addThird(_ note: Note) -> ChordBuilder
    {
        notes.append(NoteWithFunction(note: note, function: NoteFunction.third))
        return self
    }

    public func addMajorThird() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.majorThird)
        let _ = addThird(note)
        return self
    }

    public func addMinorThird() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.majorThird)
        let _ = addThird(note.flat())
        return self
    }

    public func addFifth(_ note: Note) -> ChordBuilder
    {
        notes.append(NoteWithFunction(note: note, function: NoteFunction.fifth))
        return self
    }

    public func addPerfectFifth() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.perfectFifth)
        let _ = addFifth(note)
        return self
    }

    public func addDiminishedFifth() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.perfectFifth)
        let _ = addFifth(note.flat())
        return self
    }

    public func addSeventh(_ note: Note) -> ChordBuilder
    {
        notes.append(
            NoteWithFunction(note: note, function: NoteFunction.seventh))
        return self
    }

    public func addMajorSeventh() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.majorSeventh)
        let _ = addSeventh(note)
        return self
    }

    public func addMinorSeventh() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.majorSeventh)
        let _ = addSeventh(note.flat())
        return self
    }

    public func addDiminishedSeventh() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.majorSeventh)
        let _ = addSeventh(note.flat().flat())
        return self
    }

    private func createNoteWithDistanceFromRoot(_ distance: Interval) -> Note
    {
        return root.note.transpose(distance)
    }
}
