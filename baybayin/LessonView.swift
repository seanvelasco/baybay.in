//
//  LessonView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/20/24.
//

enum LessonTitle: String {
    case translation = "Select the correct translation"
    case sound = "What sound does this make?"
    case trace = "Trace the Baybayin symbol"
}

import SwiftUI

struct LessonQuestionView: View {
    @State var selectedAnswer: String?
    @State var successfulAnswer = false
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Select the correct translation")
                .font(.title2)
                .bold()
            Spacer()
            Button(action: {
                successfulAnswer = true
            }) {
                Text("Continue")
                    .font(.headline)
                    .padding()
                    .textCase(.uppercase)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(12)
            .disabled(selectedAnswer == nil)
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct LessonView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            LessonQuestionView()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .bold()
                        }
                    }
                    //                    ToolbarItem(placement: .principal) {
                    //                        ProgressView(value: 1)
                    //                    }
                }
                .toolbarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.background, for: .navigationBar)
                .background(Color.background)
        }
    }
}

#Preview {
    LessonView()
}
