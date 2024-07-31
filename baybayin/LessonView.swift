//
//  LessonView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/20/24.
//

enum LessonTitle: String {
    case translation = "Select the correct translation"
    case sound = "Translate this sentence"
    case trace = "Trace the Baybayin symbol"
    case image = "Select the correct image"
}

import SwiftUI

struct SelectedChoicesView: View {
    @State var selectedItems: [String] = []
    var body: some View {
        HStack(alignment: .center) {
            ForEach(selectedItems, id: \.self) { item in
                Text("item")
                    .padding()
                    .background(AppColor.buttonDisabled)
                    .clipShape(.rect(cornerRadius: 16))
                    .draggable(item)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColor.button)
        .dropDestination(for: String.self) { items, location in
            selectedItems += items
            return true
            
        }
    }
    
}

struct QuestionOption: View {
    var name: String
    init(_ name: String) {
        self.name = name
    }
    var body: some View {
        Text(name)
            .padding()
            .background(AppColor.buttonDisabled)
            .clipShape(.rect(cornerRadius: 16))
            .draggable(name)
    }
}

struct ChoicesSelectionView: View {
    @State var items = ["A", "E", "I", "O", "U"]
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .padding()
                    .background(AppColor.buttonDisabled)
                    .clipShape(.rect(cornerRadius: 16))
                
            }
        }.frame(maxWidth: .infinity)
    }
}

struct AnswerResultFeedbackView: View {
    var body: some View {
        VStack {
            Spacer()
            Button(action: {}) {
                Text("Continue")
                    .font(.headline)
                    .padding()
                    .textCase(.uppercase)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(AppColor.buttonSuccess)
            .clipShape(.rect(cornerRadius: 12))
            
        }
        .padding()
    }
}

struct LessonQuestionView: View {
    @State var selectedAnswer: String?
    @State var successfulAnswer = false
    @State var isDisabled = true
    @State var displayBottomSheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Select the correct translation")
                .font(.title2)
                .bold()
            //            SelectedChoicesView()
            ChoicesSelectionView()
            Spacer()
            Button(action: {
                successfulAnswer = true
                displayBottomSheet = true
            }) {
                Text("Check")
                    .font(.headline)
                    .padding()
                    .textCase(.uppercase)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(isDisabled ? AppColor.buttonDisabled : AppColor.buttonSuccess)
            .clipShape(.rect(cornerRadius: 12))
            //            .disabled(isDisabled)
            .sheet(isPresented: $displayBottomSheet) {
                AnswerResultFeedbackView()
                .presentationDetents([.height(150)])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled(true)
            }
        }
        
    }
}

struct LessonView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                LessonQuestionView()
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                    .foregroundStyle(.white)
                    .bold()
                }
                ToolbarItem(placement: .principal) {
                    ProgressView(value: 0.5)
                }
            }
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(AppColor.background, for: .navigationBar)
            .background(AppColor.background)
            
        }
    }
}

#Preview {
    LessonView()
}


// In SwiftUI, I don't want to
