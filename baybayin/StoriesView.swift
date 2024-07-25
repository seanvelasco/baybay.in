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
                    .frame(width: 125, height: 125, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text(story.title)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)

            }
        }
        .frame(maxWidth: 150)
        .foregroundColor(.white)
        
    }
}

struct StoryCategory: View {
    var title: String?
    var stories: [Story]
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if (title != nil) {
                Text("Stories")
                    .font(.title3)
                    .bold()
            }
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(stories, id: \.self) { story in
                    StoryView(story: story)
                }
            }
        }
    }
}

struct StoriesView: View {
    
    let documents = [
        Story(title: "PH Consitution - Preamble"),
        Story(title: "PH Consitution - Bill of Rights")
    ]
    
    let stories = [
        Story(title: "Noli Me Tangere"),
        Story(title: "El Filibusterismo")
    ]
    
    let songs = [
        Story(title: ""),
        Story(title: "")
    ]

    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    StoryCategory(stories: documents)
                    StoryCategory(title: "Stories", stories: stories)
                    StoryCategory(title: "Songs", stories: documents)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .navigationTitle("Works")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(AppColor.background, for: .navigationBar)
//            .navigationBarTitleDisplayMode(.inline)
            .background(AppColor.background)
        }
    }
}

#Preview {
    StoriesView()
}


//
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .strokeBorder(.separator, lineWidth: 1)
//        )
