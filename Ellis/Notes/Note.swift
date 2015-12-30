public enum Note: Int
{
    case C = 0
    case CSharp
    case DFlat
    case D
    case DSharp
    case EFlat
    case E
    case F
    case FSharp
    case GFlat
    case G
    case GSharp
    case AFlat
    case A
    case ASharp
    case BFlat
    case B

    private static let allValues =
    [
        (Pitch: 0, Name: "C", Accident: Accident.None),
        (Pitch: 1, Name: "C#", Accident: Accident.Sharp),
        (Pitch: 1, Name: "Db", Accident: Accident.Flat),
        (Pitch: 2, Name: "D", Accident: Accident.None),
        (Pitch: 3, Name: "D#", Accident: Accident.Sharp),
        (Pitch: 3, Name: "Eb", Accident: Accident.Flat),
        (Pitch: 4, Name: "E", Accident: Accident.None),
        (Pitch: 5, Name: "F", Accident: Accident.None),
        (Pitch: 6, Name: "F#", Accident: Accident.Sharp),
        (Pitch: 6, Name: "Gb", Accident: Accident.Flat),
        (Pitch: 7, Name: "G", Accident: Accident.None),
        (Pitch: 8, Name: "G#", Accident: Accident.Sharp),
        (Pitch: 8, Name: "Ab", Accident: Accident.Flat),
        (Pitch: 9, Name: "A", Accident: Accident.None),
        (Pitch: 10, Name: "A#", Accident: Accident.Sharp),
        (Pitch: 10, Name: "Bb", Accident: Accident.Flat),
        (Pitch: 11, Name: "B", Accident: Accident.None)
    ]

    public var Pitch: Int
    {
        return Note.allValues[self.rawValue].Pitch
    }

    public var Name: String
    {
        return Note.allValues[self.rawValue].Name
    }

    public func sharp() -> Note
    {
        return accidentedNote(Accident.Sharp)
    }

    public func flat() -> Note
    {
        return accidentedNote(Accident.Flat)
    }

    public func intervalWithNote(other: Note) -> Interval
    {
        let distance = measureAbsoluteSemitones(other)

        return Interval.createIntervalFromDistance(distance)
    }

    public func measureAbsoluteSemitones(other: Note) -> Int
    {
        let distance = other - self

        return distance < 0 ? 12 - (distance * (-1)) : distance;
    }

    public func transpose(transposingInterval: Interval) -> Note
    {
        var interval = Interval.Unisson;
        var resultingNote = self;

        while(interval != transposingInterval)
        {
            resultingNote = interval - transposingInterval > 0
                    ? resultingNote.flat()
                    : resultingNote.sharp()

            interval = intervalWithNote(resultingNote);
        }

        return resultingNote;
    }

    public func frequency(octave: Octave = .OneLine) -> Double
    {
        let octaveRange = 12.0
        let a4Frequency = 440.0
        let power = Double(Pitch - Note.A.Pitch) / octaveRange
        let frequency = pow(2.0, power) * a4Frequency
        return octave.adjustFrequencyForOctave(frequency)
    }

    private func accidentedNote(accident: Accident) -> Note
    {
        let accidentedNoteIndex = self.rawValue + accidentedNoteDistance(accident)

        if accidentedNoteIndex < 0
        {
            return .B
        }

        if accidentedNoteIndex > 16
        {
            return .C
        }

        return Note(rawValue: accidentedNoteIndex)!
    }

    private func accidentedNoteDistance(accident: Accident) -> Int
    {
        return accident.direction() * accidentedNoteAbsoluteDistance(accident)
    }

    private func accidentedNoteAbsoluteDistance(accident: Accident) -> Int
    {
        return self.accident == accident ? 2 : 1
    }

    private var accident: Accident
    {
        return Note.allValues[self.rawValue].Accident
    }
}

extension Note: Equatable
{
}

public func ==(noteA: Note, noteB: Note) -> Bool
{
    return noteA.Pitch == noteB.Pitch && noteA.Name == noteB.Name
}

public func >(noteA: Note, noteB: Note) -> Bool
{
    return noteA.Pitch > noteB.Pitch
}

public func -(noteA: Note, noteB: Note) -> Int
{
    return noteA.Pitch - noteB.Pitch
}