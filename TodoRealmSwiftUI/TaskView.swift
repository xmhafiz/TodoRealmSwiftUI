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
    @State private var selectedDate: Date = Date()
    @State private var enableDueDate = false
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Title")
                    .foregroundColor(Color.gray)
                TextField("Enter title..", text: $taskTitle)
                    .font(.title)
                Divider()
            }
            VStack(alignment: .leading, spacing: 12) {
                Text("Due Date")
                    .foregroundColor(Color.gray)
                Toggle("Enabled", isOn: $enableDueDate)
                if  enableDueDate {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Divider()
            }
            Spacer()
            Button(action: deleteAction) {
                HStack {
                    Image(systemName: "trash.fill")
                    Text("Delete").bold()
                }
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.red)
            .foregroundColor(Color.white)
        }
        .navigationBarTitle("Edit Todo", displayMode: .inline)
        .padding(24)
        .onAppear(perform: {
            taskTitle = task.title
        })
        .onDisappear(perform: updateTask)
    }
    
    private func updateTask() {
        let dueDate: Date? = enableDueDate ? selectedDate : nil
        print(dueDate)
        viewModel.update(id: task.id, newTitle: taskTitle, dueDate: dueDate)
    }
    
    private func deleteAction() {
        viewModel.remove(id: task.id)
        presentationMode.wrappedValue.dismiss()
    }
}
