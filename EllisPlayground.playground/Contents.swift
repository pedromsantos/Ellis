import Ellis

// Notes
Note.A.Name

Note.A.frequency()
Note.A.frequency(Octave.TwoLine)

Note.A.flat()
Note.A.sharp()

Note.A == Note.A
Note.A == Note.C


// Intervals
Note.A.intervalWithNote(Note.ASharp)
Note.A.intervalWithNote(Note.B)

Note.A.transpose(Interval.MinorSecond)
Note.A.transpose(Interval.MajorSecond)

Note.A.measureAbsoluteSemitones(Note.C)

Interval.createIntervalFromDistance(1)


// Keys
Key.CMajor
Key.CMajor.keyNotes
Key.CMajor.KeyNoteNames
Key.CMajor.quality
Key.AMinor.quality
Key.CMajor.rootName
Key.CMajor.degreeForNote(Note.A)
// Key.CMajor.degreeForNote(Note.ASharp) // fix
Key.CMajor.relativeKey
Key.CMajor.i()


// Chords
let cmaj = ChordBuilder(root: Note.C)
                .addMajorThird()
                .addPerfectFifth()
                .build()

cmaj.name
cmaj.noteNames

let cmaj7 = ChordBuilder(root: Note.C, chordFunction: ChordFunction.Major7)
    .build()

cmaj7.name
cmaj7.noteNames
cmaj7.functions
cmaj7.noteFunctionNames
cmaj7.notes
cmaj7.Inversion

cmaj7.bass
cmaj7.lead

cmaj7.Shape

cmaj7.noteByFunction(NoteFunction.Fifth)

cmaj7 == cmaj7
cmaj == cmaj7

let gmaj7 = cmaj7.transpose(Note.G)
gmaj7.name
gmaj7.notes

let firstInversion = cmaj7.invert()
firstInversion.notes
firstInversion.Inversion

let secondInversion = firstInversion.invert()
secondInversion.notes
secondInversion.Inversion

let thirdInversion = secondInversion.invert()
thirdInversion.notes
thirdInversion.Inversion

let drop2 = cmaj7.toDrop2()
drop2.notes

let drop3 = cmaj7.toDrop3()
drop3.notes

let inversionWithFunctionInLead = cmaj7.voiceForLead(NoteFunction.Third)
inversionWithFunctionInLead.notes
inversionWithFunctionInLead.Inversion

let inversionWithFunctionInBass = cmaj7.voiceForBass(NoteFunction.Third)
inversionWithFunctionInBass.notes
inversionWithFunctionInBass.Inversion

let invertionWithLeadClosestToNote = cmaj7.invertionWithLeadClosestToNote(Note.F)
invertionWithLeadClosestToNote.notes
invertionWithLeadClosestToNote.Inversion

let invertionWithLeadClosestToNote1 = cmaj7.invertionWithLeadClosestToNote(Note.GSharp)
invertionWithLeadClosestToNote1.notes
invertionWithLeadClosestToNote1.Inversion


// Harmonizers
let triadHarmonizer = TriadsKeyHarmonizer(key: Key.CMajor)
triadHarmonizer.i().name
triadHarmonizer.ii().name
triadHarmonizer.iii().name
triadHarmonizer.iv().name
triadHarmonizer.v().name
triadHarmonizer.vi().name
triadHarmonizer.vii().name

let seventsHarmonizer = KeyHarmonizerFactory.Seventh.createHarmonizer(Key.CMajor)
seventsHarmonizer.i().name
seventsHarmonizer.ii().name
seventsHarmonizer.iii().name
seventsHarmonizer.iv().name
seventsHarmonizer.v().name
seventsHarmonizer.vi().name
seventsHarmonizer.vii().name

let seventsHarmonizerMinor = KeyHarmonizerFactory.Seventh.createHarmonizer(Key.AMinor)
seventsHarmonizerMinor.i().name
seventsHarmonizerMinor.ii().name
seventsHarmonizerMinor.iii().name
seventsHarmonizerMinor.iv().name
seventsHarmonizerMinor.v().name
seventsHarmonizerMinor.vi().name
seventsHarmonizerMinor.vii().name
