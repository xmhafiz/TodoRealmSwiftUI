//
//  ContentView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var taskTitle: String = ""
    @ObservedObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                CreateTaskView(viewModel: viewModel)
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(viewModel.tasks, id: \.id) { task in
                            TaskRowView(task: task)
                            Divider().padding(.leading, 20)
                        }
                    }
                }
            }
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
