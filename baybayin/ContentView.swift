//
//  ContentView.swift
//  baybayin
//
//  Created by Sean Velasco on 5/15/24.
//

import SwiftUI

struct AppColor {
    static let background = Color(red: 20/255, green: 31/255, blue: 37/255)
    static let secondary = Color(red: 32/255, green: 47/255, blue: 54/255)
    static let tertiary = Color(red: 55/255, green: 70/255, blue: 79/255)
    static let button = Color(red: 73/255, green: 192/255, blue: 248/255)
    static let buttonSuccess = Color(red: 147/255, green: 211/255, blue: 52/255)
    static let buttonDisabled = Color(red: 57/255, green: 69/255, blue: 81/255)
}
struct ContentView: View {
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            TabView {
                Group {
                    LessonsView(lessons: [Lesson(title: "Engrish", progress: 0.5)]).tabItem {
                        Label("Learn", systemImage: "house")
                    }
                    PracticeView().tabItem {
                        Label("Practice", systemImage: "character.phonetic")
                    }
                    StoriesView().tabItem {
                        Label("Stories", systemImage: "book")
                    }
                    TranslateView().tabItem {
                        Label("Translate", systemImage: "translate")
                    }
                    ProfileView().tabItem {
                        Label("Me", systemImage: "person")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(AppColor.background, for: .tabBar)
            }
            .accentColor(AppColor.button)
        }
    }
    
}

#Preview {
    ContentView()
}
