//
//  TodoRealmSwiftUIApp.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import SwiftUI

@main
struct TodoRealmSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TaskViewModel())
        }
    }
}
