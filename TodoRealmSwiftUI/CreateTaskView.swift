//
//  CreateTaskView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

struct CreateTaskView: View {
    @State private var taskTitle: String = ""
    let viewModel: TaskViewModel
    
    var body: some View {
        HStack (spacing: 12) {
            TextField("Enter New Task..", text: $taskTitle)
            Button("Submit", action: handleSubmit)
                .font(Font.system(size: 16, weight: .bold))
        }
        .padding(20)
    }
    
    private func handleSubmit() {
        let task = Task(title: taskTitle)
        viewModel.addTask(task)
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TaskViewModel()
        CreateTaskView(viewModel: viewModel)
    }
}
