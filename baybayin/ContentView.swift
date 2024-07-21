//
//  ContentView.swift
//  baybayin
//
//  Created by Sean Velasco on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                LessonsView().tabItem {
                    Label("Learn", systemImage: "graduationcap.fill")
                }
                PracticeView().tabItem {
                    Label("Practice", systemImage: "book.fill")
                }
                DictionaryView().tabItem {
                    Label("Words", systemImage: "bookmark.fill")
                }
                SettingsView().tabItem {
                    Label("More", systemImage: "ellipsis.circle.fill")
                }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.black, for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}
