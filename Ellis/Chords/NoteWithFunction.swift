public struct NoteWithFunction
{
    public var note: Note;
    public var function: NoteFunction;

    public init(note: Note, function: NoteFunction)
    {
        self.note = note
        self.function = function
    }
    
    public var closedChordNoteIndex:Int
    {
        return self.function.closedChordNoteIndex
    }
}

public func ==(noteA: NoteWithFunction, noteB: NoteWithFunction) -> Bool
{
    return noteA.note == noteB.note && noteA.function == noteB.function
}
