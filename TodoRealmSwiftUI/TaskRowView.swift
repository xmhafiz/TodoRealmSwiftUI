//
//  TaskRowView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    @EnvironmentObject private var viewModel: TaskViewModel
    var body: some View {
        HStack(spacing: 12) {
            Button(action: {
                viewModel.markComplete(id: task.id, completed: !task.completed)
            }) {
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(task.completed ? Color.green : Color.gray)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .foregroundColor(.black)
                if !task.formattedDate.isEmpty {
                    Text(task.formattedDate)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            Spacer()
            
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        let object = TaskObject(value: ["title": "Example Task 1", "completed": true])
        let mockTask = Task(taskObject: object)
        TaskRowView(task: mockTask)
    }
}
