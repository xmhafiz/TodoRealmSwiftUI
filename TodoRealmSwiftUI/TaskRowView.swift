//
//  TaskRowView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    var body: some View {
        HStack (spacing: 8) {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(task.completed ? Color.green : Color.gray)
            Text(task.title)
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTask = Task(title: "Example 1")
        TaskRowView(task: mockTask)
    }
}
