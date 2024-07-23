//
//  ContentView.swift
//  baybayin
//
//  Created by Sean Velasco on 5/15/24.
//

import SwiftUI

extension Color {
    static let background = Color(red: 20/255, green: 31/255, blue: 37/255)
    static let button = Color(red: 73/255, green: 192/255, blue: 248/255)
}
struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                LessonsView(lessons: [Lesson(title: "Engrish", progress: 0.5)]).tabItem {
                    Label("Learn", systemImage: "house.fill")
                }
                PracticeView().tabItem {
                    Label("Practice", systemImage: "book.fill")
                }
                StoriesView().tabItem {
                    Label("Stories", systemImage: "books.vertical.fill")
                }
                TranslateView().tabItem {
                    Label("Translate", systemImage: "translate")
                }
                SettingsView().tabItem {
                    Label("More", systemImage: "ellipsis.circle.fill")
                }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color.background, for: .tabBar)
        }
        .accentColor(Color.button)
    }
    
}

#Preview {
    ContentView()
}
