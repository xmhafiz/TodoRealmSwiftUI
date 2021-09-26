//
//  TaskView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 26/09/2021.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject private var viewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var taskTitle: String = ""
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Title")
                    .foregroundColor(Color.gray)
                TextField("Enter title..", text: $taskTitle)
                    .font(.largeTitle)
                Divider()
            }
            Button(action: deleteAction) {
                HStack {
                    Image(systemName: "trash.fill")
                    Text("Delete")
                }
                .foregroundColor(Color.red)
            }
            Spacer()
        }
        .navigationBarTitle("Edit Todo", displayMode: .inline)
        .padding(24)
        .onAppear(perform: {
            taskTitle = task.title
            
        })
        .onDisappear(perform: updateTask)
    }
    
    private func updateTask() {
        viewModel.updateTitle(id: task.id, title: taskTitle)
    }
    
    private func deleteAction() {
        viewModel.remove(task: task)
        presentationMode.wrappedValue.dismiss()
    }
}
