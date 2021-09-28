//
//  TaskObject.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 26/09/2021.
//

import Foundation
import RealmSwift

class TaskObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var completed: Bool = false
    @Persisted var completedAt: Date = Date()
    // new field
    @Persisted var dueDate: Date? = nil
}
