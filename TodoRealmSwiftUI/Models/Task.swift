//
//  Task.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var completed: Bool = false
}
