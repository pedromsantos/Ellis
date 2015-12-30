public enum Octave: Int
{
    case SubContra = -16
    case Contra = -8
    case Great = -4
    case Small = -2
    case OneLine = 1
    case TwoLine = 2
    case ThreeLine = 4
    case FourLine = 8
    case FiveLine = 16
    case SixLine = 32

    public func adjustFrequencyForOctave(frequency: Double) -> Double
    {
        let octaveValue = Double(self.rawValue)

        var noteFrequency = 0.0

        noteFrequency = octaveValue < 0
            ? frequency / (-1 * octaveValue)
            : frequency * octaveValue

        let roundToThousands = Double(1000)

        return round(roundToThousands * noteFrequency) / roundToThousands
    }
}