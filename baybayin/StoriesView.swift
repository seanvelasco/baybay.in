//
//  StoriesView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/23/24.
//

import SwiftUI

struct Story: Hashable {
    var id = UUID()
    var title: String
}

struct StoryView: View {
    var story: Story
    var body: some View {
        Button(action: {}) {
            VStack {
                Image(.jewel)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 380, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text(story.title)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
            }
        }
        .frame(height: 400)
        .containerRelativeFrame(.horizontal)
        .foregroundColor(.white)
        
    }
}

struct StoryCategory: View {
    var title: String
    var stories: [Story]
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(stories, id: \.self) { story in
                        StoryView(story: story)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(20, for: .scrollContent)
            .listRowInsets(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
        } header: {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.top)
                .padding(.horizontal)
        }
        
    }
}

struct StoriesView: View {
    
    let documents = [
        Story(title: "Panatang Makabayan")
    ]
    
    let stories = [
        Story(title: "Noli Me Tangere"),
        Story(title: "El Filibusterismo")
    ]
    
    let songs = [
        Story(title: "Lupang Hinirang")
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    StoryCategory(title: "Featured", stories: documents)
                    StoryCategory(title: "Stories", stories: stories)
                    StoryCategory(title: "Songs", stories: songs)
                }
            }
            .background(AppColor.background)
            .navigationTitle("Works")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(AppColor.background, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    StoriesView()
}
