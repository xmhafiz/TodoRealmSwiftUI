//
//  Task.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import Foundation

struct Task: Identifiable {
    var id: String
    var title: String
    var completed: Bool
    var updatedAt: Date = Date()
    
    init(taskObject: TaskObject) {
        self.id = taskObject.id.stringValue
        self.title = taskObject.title
        self.completed = taskObject.completed
        self.updatedAt = taskObject.completedAt
    }
}
