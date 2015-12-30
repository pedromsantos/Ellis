public class ChordBuilder
{
    private var notes: [NoteWithFunction]
    private let root: NoteWithFunction

    public init(root: Note)
    {
        notes = [NoteWithFunction]()
        self.root = NoteWithFunction(note: root, function: NoteFunction.Root)
        notes.append(self.root)
    }

    public convenience init(root: Note, chordFunction: ChordFunction)
    {
        self.init(root: root)
        var functionIndex = 1

        for interval in chordFunction.Intervals
        {
            addNoteWithInterval(
                interval,
                function: NoteFunction(rawValue: functionIndex)!)
            functionIndex++
        }
    }

    public func build() -> Chord
    {
        return Chord(notes: notes)
    }

    public func addNoteWithInterval(
        interval: Interval,
        function: NoteFunction) -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(interval)
        notes.append(
            NoteWithFunction(note: note.sharp().flat(), function: function))
        return self
    }

    public func addThird(note: Note) -> ChordBuilder
    {
        notes.append(NoteWithFunction(note: note, function: NoteFunction.Third))
        return self
    }

    public func addMajorThird() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.MajorThird)
        addThird(note)
        return self
    }

    public func addMinorThird() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.MajorThird)
        addThird(note.flat())
        return self
    }

    public func addFifth(note: Note) -> ChordBuilder
    {
        notes.append(NoteWithFunction(note: note, function: NoteFunction.Fifth))
        return self
    }

    public func addPerfectFifth() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.PerfectFifth)
        addFifth(note)
        return self
    }

    public func addDiminishedFifth() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.PerfectFifth)
        addFifth(note.flat())
        return self
    }

    public func addSeventh(note: Note) -> ChordBuilder
    {
        notes.append(
            NoteWithFunction(note: note, function: NoteFunction.Seventh))
        return self
    }

    public func addMajorSeventh() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.MajorSeventh)
        addSeventh(note)
        return self
    }

    public func addMinorSeventh() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.MajorSeventh)
        addSeventh(note.flat())
        return self
    }

    public func addDiminishedSeventh() -> ChordBuilder
    {
        let note = createNoteWithDistanceFromRoot(Interval.MajorSeventh)
        addSeventh(note.flat().flat())
        return self
    }

    private func createNoteWithDistanceFromRoot(distance: Interval) -> Note
    {
        return root.note.transpose(distance)
    }
}
