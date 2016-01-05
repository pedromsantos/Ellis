# Ellis - Swift music library

[![Pod Version](https://img.shields.io/cocoapods/v/Ellis.svg?style=flat)](http://cocoadocs.org/docsets/Ellis/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![](http://travis-ci.org/pedromsantos/Ellis.svg?branch=master)

Ellis is named after Jazz Guitarrist [Herb Ellis](https://en.wikipedia.org/wiki/Herb_Ellis)

## Usages

Ellis is currently used on [LetsComp](https://itunes.apple.com/us/app/letscomp/id984916129?ls=1&mt=8)

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
let seventhsHarmonizer = SeventhsKeyHarmonizer(key: Key.CMajor)
```
| Example                      | Output    |
| ---------------------------- | --------- |
| seventhsHarmonizer.i().name  | "CMaj7"   |
| seventhsHarmonizer.ii().name | "DMin7"   |
| seventhsHarmonizer.iii().name| "EMin7"   |
| seventhsHarmonizer.iv().name | "FMaj7"   |
| seventhsHarmonizer.v().name  | "GDom7"   |
| seventhsHarmonizer.vi().name | "AMin7"   |
| seventhsHarmonizer.vii().name| "Bmin7b5" |
#### Minor harmonizer
Scale is a melodic minor but when harmonizing its treated as a harmonic minor.
```swift
let seventhsHarmonizerMinor = SeventhsKeyHarmonizer(key: Key.AMinor)
```
| Example                          | Output     |
| -------------------------------- | ---------- |
| seventhsHarmonizerMinor.i().name  | "AMinMaj7" |
| seventhsHarmonizerMinor.ii().name | "BMin7b5"  |
| seventhsHarmonizerMinor.iii().name| "CAug7"    |
| seventhsHarmonizerMinor.iv().name | "DMin7"    |
| seventhsHarmonizerMinor.v().name  | "EDom7"    |
| seventhsHarmonizerMinor.vi().name | "FMaj7"    |
| seventhsHarmonizerMinor.vii().name| "G#Dim7"   |
