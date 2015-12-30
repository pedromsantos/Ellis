public enum NoteFunction: Int
{
    case Root, Third, Fifth, Seventh, Ninth, Eleventh, Thirnteenth

    private static let allValues = ["R", "3", "5", "7", "9", "11", "13"]

    public var name: String
    {
        return NoteFunction.allValues[self.rawValue]
    }
    
    public var closedChordNoteIndex:Int
    {
        return self.rawValue
    }
}
