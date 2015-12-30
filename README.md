# Ellis - Swift music library

Ellis is named after Jazz Guitarrist [Herb Ellis](https://en.wikipedia.org/wiki/Herb_Ellis)

## Examples

These examples are taken from a [playground](EllisPlayground.playground/Contents.swift) in the project 

### Notes

| Example                            | Output           | Comment                                                                       |
| ---------------------------------- | ---------------- | ------------------------------------------------------------------------------|
| Note.A.Name                        | "A"              |                                                                               |
| Note.A.frequency()                 | 440              | Frequency defaults to [OneLine Octave](https://en.wikipedia.org/wiki/Octave)  |
| Note.A.frequency(Octave.TwoLine)   | 880              | If required can pass octave for frequency                                     |
| Note.A.flat()                      | AFlat            |                                                                               |
| Note.A.sharp()                     | ASharp           |                                                                               |
| Note.A == Note.A                   | true             |                                                                               |
| Note.A == Note.C                   | false            |                                                                               |

### Intervals
| Example                                | Output           |
| -------------------------------------- | ---------------- |
| Note.A.intervalWithNote(Note.ASharp)   | MinorSecond      |
| Note.A.intervalWithNote(Note.B)        | MajorSecond      |
| Note.A.transpose(Interval.MinorSecond) | ASharp           |
| Note.A.transpose(Interval.MajorSecond) | B                |
| Note.A.measureAbsoluteSemitones(Note.C)| 3                |
| Interval.createIntervalFromDistance(1) | MinorSecond      |

### Keys
| Example                                  | Output                             |
| ---------------------------------------- | ---------------------------------- |
| Key.CMajor                               | CMajor                             |
| Key.CMajor.keyNotes                      | [C, D, E, F, G, A, B]              |
| Key.CMajor.KeyNoteNames                  | ["C", "D", "E", "F", "G", "A", "B"]|
| Key.CMajor.quality                       | Major                              |
| Key.AMinor.quality                       | Minor                              |
| Key.CMajor.rootName                      | "C"                                |
| Key.CMajor.degreeForNote(Note.A)         | 6                                  |
| Key.CMajor.degreeForNote(Note.ASharp)    | Thows exception                    |
| Key.CMajor.relativeKey                   | AMinor                             |
| Key.CMajor.i()                           | C                                  |

### Chords
#### Building chords
```swift
let cmaj = ChordBuilder(root: Note.C)
                .addMajorThird()
                .addPerfectFifth()
                .build()
```

| Example                                  | Output                             |
| ---------------------------------------- | ---------------------------------- |
| cmaj.name                                | "CMaj"                             |
| cmaj.noteNames                           | ["C", "E", "G"]                    |

```swift
let cmaj7 = ChordBuilder(root: Note.C, chordFunction: ChordFunction.Major7)
    .build()
```
| Example                                  | Output                                           |
| ---------------------------------------- | ------------------------------------------------ |
| cmaj7.name                               | "CMaj7"                                          |
| cmaj7.noteNames                          | ["C", "E", "G", "B"]                             |
| cmaj7.functions                          | [Root, Third, Fifth, Seventh]                    |
| cmaj7.noteFunctionNames                  | ["R", "3", "5", "7"]                             |
| cmaj7.ChordNotes                         | [{C, Root}, {E, Third}, {G, Fifth}, {B, Seventh}]|
| cmaj7.Inversion                          | Root                                             |
| cmaj7.bass                               | C                                                |
| cmaj7.lead                               | B                                                |
| cmaj7.Shape                              | Closed                                           |
| cmaj7.noteByFunction(NoteFunction.Fifth) | G                                                |
| cmaj7 == cmaj7                           | true                                             |
| cmaj == cmaj7                            | false                                            |
#### Transposing chords
```swift
let gmaj7 = cmaj7.transpose(Note.G)
```

| Example      | Output           |
| ------------ | ---------------- |
| gmaj7.name   | "GMaj7"          |
| gmaj7.notes  | [G, B, D, FSharp]|
#### Inverting chords
```swift
let firstInversion = cmaj7.invert()
```
| Example                   | Output           |
| ------------------------- | ---------------- |
| firstInversion.notes      | [E, G, B, C]     |
| firstInversion.Inversion  | First            |

```swift
let secondInversion = firstInversion.invert()
```

| Example                    | Output           |
| -------------------------- | ---------------- |
| secondInversion.notes      | [G, B, C, E]     |
| secondInversion.Inversion  | Second           |

```swift
let thirdInversion = secondInversion.invert()
```

| Example                    | Output           |
| -------------------------- | ---------------- |
| thirdInversion.notes       | [B, C, E, G]     |
| thirdInversion.Inversion   | Third            |
#### Drop2 chords
```swift
let drop2 = cmaj7.toDrop2()
```
| Example      | Output           |
| ------------ | ---------------- |
| drop2.notes  | [C, G, B, E]     |
#### Drop3 chords
```swift
let drop3 = cmaj7.toDrop3()
```

| Example      | Output           |
| ------------ | ---------------- |
| drop3.notes  | [C, B, E, G]     |
#### Voice leading chords
```swift
let inversionWithFunctionInLead = cmaj7.voiceForLead(NoteFunction.Third)
```

| Example                                   | Output                             |
| ----------------------------------------- | ---------------------------------- |
| inversionWithFunctionInLead.notes         | [G, B, C, E]                       |
| inversionWithFunctionInLead.Inversion     | Second                             |

```swift
let inversionWithFunctionInBass = cmaj7.voiceForBass(NoteFunction.Third)
```

| Example                                   | Output                             |
| ----------------------------------------- | ---------------------------------- |
| inversionWithFunctionInBass.notes         | [E, G, B, C]                       |
| inversionWithFunctionInBass.Inversion     | First                              |

```swift
let invertionWithLeadClosestToNote = cmaj7.invertionWithLeadClosestToNote(Note.F)
```

| Example                                   | Output                             |
| ----------------------------------------- | ---------------------------------- |
| invertionWithLeadClosestToNote.notes      | [G, B, C, E]                       |
| invertionWithLeadClosestToNote.Inversion  | Second                             |

```swift
let invertionWithLeadClosestToNote1 = cmaj7.invertionWithLeadClosestToNote(Note.GSharp)
```
| Example                                   | Output                             |
| ----------------------------------------- | ---------------------------------- |
| invertionWithLeadClosestToNote1.notes     | [B, C, E, G]                       |
| invertionWithLeadClosestToNote1.Inversion | Third                              |

### Key Harmonizers
#### Triad harmonizer
```swift
let triadHarmonizer = TriadsKeyHarmonizer(key: Key.CMajor)
```

| Example                   | Output |
| ------------------------- | ------ |
| triadHarmonizer.i().name  | "CMaj" |
| triadHarmonizer.ii().name | "DMin" |
| triadHarmonizer.iii().name| "EMin" |
| triadHarmonizer.iv().name | "FMaj" |
| triadHarmonizer.v().name  | "GMaj" |
| triadHarmonizer.vi().name | "AMin" |
| triadHarmonizer.vii().name| "BDim" |
#### Seventh harmonizer
```swift
let seventsHarmonizer = SeventhsKeyHarmonizer(key: Key.CMajor)
```
| Example                     | Output    |
| --------------------------- | --------- |
| seventsHarmonizer.i().name  | "CMaj7"   |
| seventsHarmonizer.ii().name | "DMin7"   |
| seventsHarmonizer.iii().name| "EMin7"   |
| seventsHarmonizer.iv().name | "FMaj7"   |
| seventsHarmonizer.v().name  | "GDom7"   |
| seventsHarmonizer.vi().name | "AMin7"   |
| seventsHarmonizer.vii().name| "Bmin7b5" |
#### Minor harmonizer
```swift
let seventsHarmonizerMinor = SeventhsKeyHarmonizer(key: Key.AMinor)
```
| Example                          | Output     |
| -------------------------------- | ---------- |
| seventsHarmonizerMinor.i().name  | "AMinMaj7" |
| seventsHarmonizerMinor.ii().name | "BMin7b5"  |
| seventsHarmonizerMinor.iii().name| "CAug7"    |
| seventsHarmonizerMinor.iv().name | "DMin7"    |
| seventsHarmonizerMinor.v().name  | "EDom7"    |
| seventsHarmonizerMinor.vi().name | "FMaj7"    |
| seventsHarmonizerMinor.vii().name| "G#Dim7"   |
