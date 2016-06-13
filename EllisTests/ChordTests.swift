import XCTest
import Ellis

class ChordTests: XCTestCase
{
    func test_that_it_should_be_constructed_using_a_list_of_notes()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual(notes, chord.notes)
    }

    func test_that_it_should_have_correct_note_names()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual([Note.c, Note.e, Note.g], chord.notes)
    }

    func test_that_it_should_return_root_for_root_function()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssert(Note.c == chord.noteByFunction(NoteFunction.root), "")
    }

    func test_that_it_should_return_third_for_third_function()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssert(Note.e == chord.noteByFunction(NoteFunction.third), "")
    }

    func test_that_it_should_return_fifth_for_fifth_function()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssert(Note.g == chord.noteByFunction(NoteFunction.fifth), "")
    }

    func test_that_it_should_return_lowest_for_bass_note()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssert(Note.c == chord.bass, "")
    }

    func test_that_it_should_return_top_for_lead_note()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssert(Note.g == chord.lead, "")
    }

    func test_that_it_should_be_named_after_the_root_note()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssert(chord.name.hasPrefix("C"), "")
    }

    func test_that_it_should_be_named_after_the_root_note_and_function_for_major_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual("CMaj", chord.name, "")
    }

    func test_that_it_should_be_named_after_the_root_note_and_function_for_minor_chord()
    {
        let notes = [Note.c, Note.eFlat, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual("CMin", chord.name, "")
    }

    func test_that_it_should_be_named_after_the_root_note_and_function_for_augmented_chord()
    {
        let notes = [Note.c, Note.e, Note.gSharp]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual("CAug", chord.name, "")
    }

    func test_that_it_should_be_named_after_the_root_note_and_function_for_diminished_chord()
    {
        let notes = [Note.c, Note.eFlat, Note.gFlat]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual("CDim", chord.name, "")
    }

    func test_that_it_should_be_named_after_the_root_note_and_function_for_sus2_chord()
    {
        let notes = [Note.c, Note.d, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual("CSus2", chord.name, "")
    }

    func test_that_it_should_be_named_after_the_root_note_and_function_for_sus4_chord()
    {
        let notes = [Note.c, Note.f, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual("CSus4", chord.name, "")
    }

    func test_that_it_should_return_inverted_chord_for_first_inversion()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.invert()

        let expectedNotes: [Note] = [Note.e, Note.g, Note.c]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_second_inversion()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.invert().invert()

        let expectedNotes: [Note] = [Note.g, Note.c, Note.e]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_third_inversion()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.invert().invert().invert()

        let expectedNotes: [Note] = [Note.b, Note.c, Note.e, Note.g]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_to_root_invertion_from_third_inversion()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.invert().invert().invert()
        let rootInvertion = invertedChord.resetInvertions()

        let expectedNotes: [Note] = [Note.c, Note.e, Note.g, Note.b]
        XCTAssertEqual(expectedNotes, rootInvertion.notes)
    }

    func test_that_it_should_maintain_root_note_function_on_chord_after_inversion()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let _ = chord.invert()

        XCTAssertEqual(Note.c, chord.noteByFunction(NoteFunction.root), "")
    }

    func test_that_it_should_maintain_third_note_function_on_chord_after_inversion()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let _ = chord.invert()

        XCTAssertEqual(Note.e, chord.noteByFunction(NoteFunction.third), "")
    }

    func test_that_it_should_maintain_fifth_note_function_on_chord_after_inversion()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let _ = chord.invert()

        XCTAssertEqual(Note.g, chord.noteByFunction(NoteFunction.fifth), "")
    }

    func test_that_it_should_be_able_to_convert_closed_chord_to_drop2_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let drop2Chord = chord.toDrop2()

        let expectedNotes: [Note] = [Note.c, Note.g, Note.e]
        XCTAssertEqual(expectedNotes, drop2Chord.notes)
    }

    func test_that_it_should_not_change_original_chord_when_converting_it_to_drop2_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        XCTAssertEqual(notes, chord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_first_inversion_drop2_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop2().invert()

        let expectedNotes: [Note] = [Note.e, Note.b, Note.c, Note.g]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_second_inversion_drop2_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop2().invert().invert()

        let expectedNotes: [Note] = [Note.g, Note.c, Note.e, Note.b]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_third_inversion_drop2_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop2().invert().invert().invert()

        let expectedNotes: [Note] = [Note.b, Note.e, Note.g, Note.c]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_to_root_invertion_from_third_inversion_drop2_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop2().invert().invert().invert()
        let rootInvertion = invertedChord.resetInvertions()

        let expectedNotes: [Note] = [Note.c, Note.g, Note.b, Note.e]
        XCTAssertEqual(expectedNotes, rootInvertion.notes)
    }

    func test_that_it_should_be_able_to_convert_open_chord_to_drop3_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let drop3Chord = chord.toDrop3()

        let expectedNotes: [Note] = [Note.c, Note.b, Note.e, Note.g]
        XCTAssertEqual(expectedNotes, drop3Chord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_first_inversion_drop3_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop3().invert()

        let expectedNotes: [Note] = [Note.e, Note.c, Note.g, Note.b]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_second_inversion_drop3_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop3().invert().invert()

        let expectedNotes: [Note] = [Note.g, Note.e, Note.b, Note.c]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_inverted_chord_for_third_inversion_drop3_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop3().invert().invert().invert()

        let expectedNotes: [Note] = [Note.b, Note.g, Note.c, Note.e]
        XCTAssertEqual(expectedNotes, invertedChord.notes)
    }

    func test_that_it_should_return_to_root_invertion_from_third_inversion_drop3_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let invertedChord = chord.toDrop3().invert().invert().invert()
        let rootInvertion = invertedChord.resetInvertions()

        let expectedNotes: [Note] = [Note.c, Note.b, Note.e, Note.g]
        XCTAssertEqual(expectedNotes, rootInvertion.notes)
    }

    func test_that_it_should_transpose_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let transposedChord = chord.transpose(Note.f)

        let expectedNotes: [Note] = [Note.f, Note.a, Note.c]
        XCTAssertEqual(expectedNotes, transposedChord.notes)
    }

    func test_that_it_should_transform_drop2_chord_back_to_closed_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let drop2Chord = chord.toDrop2().invert()
        let closedChord = drop2Chord.toClosed()

        XCTAssertEqual(notes, closedChord.notes)
    }

    func test_that_it_should_transform_drop3_chord_back_to_closed_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let drop3Chord = chord.toDrop3().invert().invert()
        let closedChord = drop3Chord.toClosed()

        XCTAssertEqual(notes, closedChord.notes)
    }

    func test_that_it_should_change_invertion_according_to_lead_when_lead_is_already_correct()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let alteredChord = chord.voiceForLead(NoteFunction.fifth)

        let expectedNotes: [Note] = [Note.c, Note.e, Note.g]
        XCTAssertEqual(expectedNotes, alteredChord.notes)
    }

    func test_that_it_should_change_invertion_according_to_lead()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)

        let alteredChord = chord.voiceForLead(NoteFunction.third)

        let expectedNotes: [Note] = [Note.g, Note.c, Note.e]
        XCTAssertEqual(expectedNotes, alteredChord.notes)
    }

    func test_that_it_should_change_invertion_according_to_bass()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes)

        let alteredChord = chord.toDrop2().voiceForBass(NoteFunction.fifth)

        let expectedNotes: [Note] = [Note.g, Note.c, Note.e, Note.b]
        XCTAssertEqual(expectedNotes, alteredChord.notes)
    }

    func test_that_it_should_change_invertion_with_lead_closest_to_provided_note()
    {
        let notes = [Note.d, Note.f, Note.a, Note.c]
        let chord = createChordFromNoteList(notes)

        let alteredChord = chord.toDrop2().invertionWithLeadClosestToNote(Note.fSharp)

        let expectedNotes: [Note] = [Note.d, Note.a, Note.c, Note.f]
        XCTAssertEqual(expectedNotes, alteredChord.notes)
    }
    
    func test_that_it_should_update_invertion_with_lead_closest_to_provided_note()
    {
        let notes = [Note.d, Note.f, Note.a, Note.c]
        let chord = createChordFromNoteList(notes)
        
        let alteredChord = chord.toDrop2().invertionWithLeadClosestToNote(Note.aSharp)
        
        XCTAssertEqual(Inversions.first, alteredChord.Inversion)
    }

    func test_that_it_should_return_true_if_chords_are_equal_when_comparing_chords()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chordA = createChordFromNoteList(notes)
        let chordB = createChordFromNoteList(notes)

        XCTAssertEqual(chordA, chordB)
    }

    func test_that_it_should_return_false_if_chords_do_not_have_same_number_of_notesl_when_comparing_chords()
    {
        var notes = [Note.c, Note.e, Note.g]
        let chordA = createChordFromNoteList(notes)
        notes.append(Note.b)
        let chordB = createChordFromNoteList(notes)

        XCTAssertNotEqual(chordA, chordB)
    }
    
    func test_that_it_should_return_root_inversion_for_root_inversion_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes)
        
        XCTAssertEqual(chord.Inversion, Inversions.root)
    }
    
    func test_that_it_should_return_first_inversion_for_first_inversion_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes).invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.first)
    }
    
    func test_that_it_should_return_second_inversion_for_second_inversion_chord()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes).invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.second)
    }
    
    func test_that_it_should_return_third_inversion_for_third_inversion_chord()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).invert().invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.third)
    }
    
    func test_that_it_should_return_root_inversion_for_looped_inversion()
    {
        let notes = [Note.c, Note.e, Note.g]
        let chord = createChordFromNoteList(notes).invert().invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.root)
    }
    
    func test_that_it_should_return_root_inversion_for_root_inversion_chord_drop2()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop2()
        
        XCTAssertEqual(chord.Inversion, Inversions.root)
    }
    
    func test_that_it_should_return_first_inversion_for_first_inversion_chord_drop2()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop2().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.first)
    }
    
    func test_that_it_should_return_second_inversion_for_second_inversion_chord_drop2()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop2().invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.second)
    }
    
    func test_that_it_should_return_third_inversion_for_third_inversion_chord_drop2()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop2().invert().invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.third)
    }
    
    func test_that_it_should_return_root_inversion_for_root_inversion_chord_drop3()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop3()
        
        XCTAssertEqual(chord.Inversion, Inversions.root)
    }
    
    func test_that_it_should_return_first_inversion_for_first_inversion_chord_drop3()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop3().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.first)
    }
    
    func test_that_it_should_return_second_inversion_for_second_inversion_chord_drop3()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop3().invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.second)
    }
    
    func test_that_it_should_return_third_inversion_for_third_inversion_chord_drop3()
    {
        let notes = [Note.c, Note.e, Note.g, Note.b]
        let chord = createChordFromNoteList(notes).toDrop3().invert().invert().invert()
        
        XCTAssertEqual(chord.Inversion, Inversions.third)
    }

    func createChordFromNoteList(_ notes: [Note]) -> Chord
    {
        var chordNotes = [NoteWithFunction]()

        var i = 0;

        for note: Note in notes
        {
            chordNotes.append(NoteWithFunction(note: note, function: NoteFunction(rawValue: i)!));
            i += 1;
        }

        return Chord(notes: chordNotes);
    }
}
