//
//  TaskViewModel.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import Foundation
import Combine

final class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        getTasks()
    }
    
    private func getTasks() {
        tasks = TaskStore.shared.allTasks()
    }
    
    func addTask(title: String) {
        TaskStore.shared.createTask(title: title)
        getTasks()
    }
    
    func markComplete(task: Task) {
        TaskStore.shared.updateCompleted(id: task.id, value: !task.completed)
        getTasks()
    }
}
