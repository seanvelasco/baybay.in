//
//  Lesson.swift
//  baybayin
//
//  Created by Sean Velasco on 7/28/24.
//

import Foundation

struct Lesson: Identifiable, Decodable {
    var id = UUID()
    var title: String
    var progress: Double
}

struct PracticeLesson {
    var name: String
}

extension PracticeLesson {
    init(_ name: String) {
        self.name = name
    }
}


var prac = PracticeLesson("Sean Velasco")
var prac2 = PracticeLesson(name: "Sean Velasco")
