public enum Note: Int
{
    case c = 0
    case cSharp
    case dFlat
    case d
    case dSharp
    case eFlat
    case e
    case f
    case fSharp
    case gFlat
    case g
    case gSharp
    case aFlat
    case a
    case aSharp
    case bFlat
    case b

    private static let allValues =
    [
        (Pitch: 0, Name: "C", Accident: Accident.none),
        (Pitch: 1, Name: "C#", Accident: Accident.sharp),
        (Pitch: 1, Name: "Db", Accident: Accident.flat),
        (Pitch: 2, Name: "D", Accident: Accident.none),
        (Pitch: 3, Name: "D#", Accident: Accident.sharp),
        (Pitch: 3, Name: "Eb", Accident: Accident.flat),
        (Pitch: 4, Name: "E", Accident: Accident.none),
        (Pitch: 5, Name: "F", Accident: Accident.none),
        (Pitch: 6, Name: "F#", Accident: Accident.sharp),
        (Pitch: 6, Name: "Gb", Accident: Accident.flat),
        (Pitch: 7, Name: "G", Accident: Accident.none),
        (Pitch: 8, Name: "G#", Accident: Accident.sharp),
        (Pitch: 8, Name: "Ab", Accident: Accident.flat),
        (Pitch: 9, Name: "A", Accident: Accident.none),
        (Pitch: 10, Name: "A#", Accident: Accident.sharp),
        (Pitch: 10, Name: "Bb", Accident: Accident.flat),
        (Pitch: 11, Name: "B", Accident: Accident.none)
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
        return accidentedNote(Accident.sharp)
    }

    public func flat() -> Note
    {
        return accidentedNote(Accident.flat)
    }

    public func intervalWithNote(_ other: Note) -> Interval
    {
        let distance = measureAbsoluteSemitones(other)

        return Interval.createIntervalFromDistance(distance)
    }

    public func measureAbsoluteSemitones(_ other: Note) -> Int
    {
        let distance = other - self

        return distance < 0 ? 12 - (distance * (-1)) : distance;
    }

    public func transpose(_ transposingInterval: Interval) -> Note
    {
        var interval = Interval.unisson;
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

    public func frequency(_ octave: Octave = .oneLine) -> Double
    {
        let octaveRange = 12.0
        let a4Frequency = 440.0
        let power = Double(Pitch - Note.a.Pitch) / octaveRange
        let frequency = pow(2.0, power) * a4Frequency
        return octave.adjustFrequencyForOctave(frequency)
    }

    private func accidentedNote(_ accident: Accident) -> Note
    {
        let accidentedNoteIndex = self.rawValue + accidentedNoteDistance(accident)

        if accidentedNoteIndex < 0
        {
            return .b
        }

        if accidentedNoteIndex > 16
        {
            return .c
        }

        return Note(rawValue: accidentedNoteIndex)!
    }

    private func accidentedNoteDistance(_ accident: Accident) -> Int
    {
        return accident.direction() * accidentedNoteAbsoluteDistance(accident)
    }

    private func accidentedNoteAbsoluteDistance(_ accident: Accident) -> Int
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
