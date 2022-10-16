////
//  CreateTaskView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

struct AddTaskView: View {
    @State private var taskTitle: String = ""
    @EnvironmentObject private var viewModel: TaskViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            TextField("Enter New Task..", text: $taskTitle)
            Button(action: handleSubmit) {
                Image(systemName: "plus")
            }
        }
        .padding(20)
    }
    
    private func handleSubmit() {
        guard !taskTitle.isEmpty else { return }
        viewModel.addTask(title: taskTitle)
        taskTitle = ""
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
