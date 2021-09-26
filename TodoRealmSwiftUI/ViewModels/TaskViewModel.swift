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
        getTask()
    }
    
    func addTask(title: String) {
        TaskStore.shared.createTask(title: title)
        getTask()
    }
    
    private func getTask() {
        tasks = TaskStore.shared.allTasks()
    }
    
}
