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
        tasks = [
            Task(title: "Task 1"),
            Task(title: "Task 2"),
            Task(title: "Task 3", completed: true)
        ]
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
}
