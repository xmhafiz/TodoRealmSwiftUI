//
//  ContentView.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                AddTaskView()
                TaskListView()
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
