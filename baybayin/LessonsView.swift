//
//  LessonsView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/20/24.
//

import SwiftUI


struct CourseProgressView: View {
    var completed: Int
    var total: Int
    var body: some View {
        HStack(spacing: 4) {
            Text("\(completed)/\(total)")
            Image(systemName: "flag.fill")
                .font(.caption)
        }
        .foregroundColor(.secondary)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.gray.opacity(0.2))
        .clipShape(.capsule)
    }
}

struct LessonItemView: View {
    @State private var isLessonViewPresented = false
    var lesson: Lesson
    var started = false
    var unlocked = false
    var body: some View {
        Button(action: { isLessonViewPresented = true }) {
            VStack(alignment: .center) {
                Circle()
                    .fill(.gray)
                    .padding(4)
                    .overlay{
                        Circle()
                            .strokeBorder(.gray.opacity(0.4), lineWidth: 4)
                    }
                    .frame(width: 80, height: 80)
                Text("Introduction")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
        .fullScreenCover(isPresented: $isLessonViewPresented) {
            LessonView()
        }
    }
}

struct LessonsGridView: View {
    var lessons: [Lesson]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 40) {
                ForEach(lessons) { lesson in
                    LessonItemView(lesson: lesson)
                }
            }
            .padding(40)
        }
    }
}

struct LessonsView: View {
    var lessons: [Lesson] = []
    var body: some View {
            NavigationStack {
                LessonsGridView(lessons: lessons)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("baybay.in")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            CourseProgressView(completed: lessons.count, total: lessons.count)
                        }
                    }
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarBackground(AppColor.background, for: .navigationBar)
                    .background(AppColor.background)
            }
        
    }
}

#Preview {
    LessonsView(lessons: [Lesson(
        title:  "asd",
        progress: 0.5
    )])
}
