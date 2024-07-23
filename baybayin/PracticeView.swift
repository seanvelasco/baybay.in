//
//  PracticeView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/20/24.
//

import SwiftUI

//struct Character {
//    var value: String
//    init(_ value: String) {
//        self.value = value
//    }
//}

typealias Character = String

let vowels: [Character] = ["A", "E", "I", "O", "U"]

let consonants: [Character] = [
    "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"
]

//let vowelsSet = Sequence(vowels)

//let consonantsSet = Set(consonants)

struct CharacterGridItemView: View {
    var character: Character
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Text(character)
                    .foregroundColor(.white)
                    .bold()
                    .padding(4)
                ProgressView(value: 0.5)
                
                
            }        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.separator, lineWidth: 2)
        )
        // .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CharacterGridView: View {
    var characters: [Character] = []
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    var body: some View {
        VStack(spacing: 16) {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(characters, id: \.self) { character in
                    CharacterGridItemView(character: character)
                }
            }
            Button(action: {}) {
                Text("Practice")
                    .textCase(.uppercase)
                    .bold()
            }
            .buttonStyle(.plain)
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.button)
            .foregroundColor(Color.background)
            .cornerRadius(12)
        }
    }
}

struct PracticeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text("Practice reading and writing Baybayin characters")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                Divider()
                VStack(alignment: .leading, spacing: 16) {
                    Text("Vowels")
                        .font(.title3)
                        .bold()
                    Text("Sounds that are made without closing any part of the mouth or throat")
                    CharacterGridView(characters: vowels)
                }
                .padding()
                Divider()
                VStack(alignment: .leading, spacing: 16) {
                    Text("Consonants")
                        .font(.title3)
                        .bold()
                    Text("Sounds that are made without closing any part of the mouth or throat")
                    CharacterGridView(characters: consonants)
                }
                .padding()
            }
            .background(Color.background)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.background, for: .navigationBar)
            .navigationTitle("Baybayin")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}

#Preview {
    PracticeView()
}
