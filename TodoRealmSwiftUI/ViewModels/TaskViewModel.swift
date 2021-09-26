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
        tasks = TaskStore.shared.all()
            .sorted(by: { $0.updatedAt > $1.updatedAt })
            .sorted(by: { !$0.completed && $1.completed })
    }
    
    func addTask(title: String) {
        TaskStore.shared.create(title: title)
        getTasks()
    }
    
    func markComplete(task: Task) {
        TaskStore.shared.updateCompleted(id: task.id, value: !task.completed)
        getTasks()
    }
    
    func remove(task: Task) {
        TaskStore.shared.delete(id: task.id)
        getTasks()
    }
    
    func updateTitle(id: String, title: String) {
        TaskStore.shared.updateTitle(id: id, newTitle: title)
        getTasks()
    }
}
