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
                    Text("Delete").bold()
                }
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.red)
            .foregroundColor(Color.white)
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
        viewModel.updateTitle(id: task.id, newTitle: taskTitle)
    }
    
    private func deleteAction() {
        viewModel.remove(id: task.id)
        presentationMode.wrappedValue.dismiss()
    }
}
