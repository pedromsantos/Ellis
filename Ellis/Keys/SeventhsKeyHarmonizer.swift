public class SeventhsKeyHarmonizer: KeyHarmonizer
{
    public override func i() -> Chord
    {
        return buildChord(
            key.i(),
            third: key.iii(),
            fifth: key.v(),
            seventh: key.vii())
    }

    public override func ii() -> Chord
    {
        return buildChord(
            key.ii(),
            third: key.iv(),
            fifth: key.vi(),
            seventh: key.i())
    }

    public override func iii() -> Chord
    {
        return buildChord(
            key.iii(),
            third: key.v(),
            fifth: key.vii(),
            seventh: key.ii());
    }

    public override func iv() -> Chord
    {
        return buildChord(
            key.iv(),
            third: key.vi(),
            fifth: key.i(),
            seventh: key.iii());
    }

    public override func v() -> Chord
    {
        return buildChord(
            key.v(),
            third: key.vii(),
            fifth: key.ii(),
            seventh: key.iv());
    }

    public override func vi() -> Chord
    {
        return buildChord(
            key.vi(),
            third: key.i(),
            fifth: key.iii(),
            seventh: key.v());
    }

    public override func vii() -> Chord
    {
        return buildChord(
            key.vii(),
            third: key.ii(),
            fifth: key.iv(),
            seventh: key.vi());
    }

    private func buildChord(
        _ root: Note,
        third: Note,
        fifth: Note,
        seventh: Note) -> Chord
    {
        return ChordBuilder(root: root)
            .addThird(third)
            .addFifth(fifth)
            .addSeventh(seventh)
            .build()
    }
}
