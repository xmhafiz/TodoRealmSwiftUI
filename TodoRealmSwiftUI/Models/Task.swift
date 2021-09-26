//
//  Task.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import Foundation

struct Task: Identifiable {
    let id: String
    let title: String
    let completed: Bool
    
    init(id: String = UUID().uuidString, title: String, completed: Bool = false) {
        self.title = title
        self.id = id
        self.completed = completed
    }
    
    init(taskObject: TaskObject) {
        self.id = taskObject.id.stringValue
        self.title = taskObject.title
        self.completed = taskObject.completed
    }
}
