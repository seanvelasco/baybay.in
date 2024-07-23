//
//  DictionaryView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/20/24.
//

import SwiftUI

//struct WordListView: View {
//    var body: some View {
//        Text("All words...")
//    }
//}
//
//struct VocabularyView: View {
//    @State var query = ""
//    var body: some View {
//        List {
//            Text("1")
//            Text("2")
//        }
//        .searchable(text: $query)
//    }
//}
//
//struct StoriesView: View {
//    var body: some View {
//        Text("STORIES")
//    }
//}
//
//struct DictionaryView: View {
//    @State private var selectedTab = 0
//    let tabs = ["Stories", "Dictionary", "Saved"]
//    var body: some View {
//        NavigationStack {
//            VStack {
//                HStack {
//                    ForEach(0..<tabs.count, id: \.self) { index in
//                        Button(action: {
//                            withAnimation {
//                                selectedTab = index
//                            }
//                        }) {
//                            Text(tabs[index])
//                                .padding(.vertical, 10)
//                                .padding(.horizontal, 20)
//                                .background(selectedTab == index ? Color.blue : Color.clear)
//                                .foregroundColor(selectedTab == index ? .white : .blue)
//                                .cornerRadius(10)
//                        }
//                    }
//                }
//                TabView(selection: $selectedTab) {
//                    StoriesView()
//                        .tabItem {
//                        }
//                        .tag(0)
//
//                    WordListView()
//                        .tabItem {
//                        }
//                        .tag(1)
//                    VocabularyView()
//                        .tabItem {}
//                        .tag(2)
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .animation(.easeInOut, value: selectedTab)
//                .transition(.slide)
//                .navigationTitle("Dictionary")
//            }.padding()
//        }
//    }
//}

struct DictionaryView: View {
    var body: some View {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Text("Get to know one of the pre-colonial writing scripts used by early Filipinos")
                        .multilineTextAlignment(.center)
                    Button(action: {}) {
                        Text("Learn Baybayin")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .textCase(.uppercase)
                    }
                    .padding()
                    Divider()
                        .frame(minHeight: 2)
                        .overlay(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Vowels")
                            .font(.title3)
                            .bold()
                        Text("Sounds in a language that are made without closing any part of the mouth or throat")
                    }
                    .padding()
                    Divider()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Consonants")
                            .font(.title3)
                            .bold()
                        Text("Sounds in a language that are made without closing any part of the mouth or throat")
                    }
                    .padding()
                }
            }
            .navigationTitle("Baybayin symbols")
        
    }
}

#Preview {
    DictionaryView()
}
