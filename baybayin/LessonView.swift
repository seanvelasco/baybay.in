//
//  LessonView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/20/24.
//

import SwiftUI

struct LessonView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            Text("What does this sound mean?")
            Spacer()
            Button(action: {
                print("")
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .textCase(.uppercase)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .principal) {
                    ProgressView(value: 1)
                }
            }
            .tabItem { EmptyView() }
            //                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LessonView()
}
