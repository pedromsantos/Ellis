public enum Octave: Int
{
    case subContra = -16
    case contra = -8
    case great = -4
    case small = -2
    case oneLine = 1
    case twoLine = 2
    case threeLine = 4
    case fourLine = 8
    case fiveLine = 16
    case sixLine = 32

    public func adjustFrequencyForOctave(_ frequency: Double) -> Double
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
