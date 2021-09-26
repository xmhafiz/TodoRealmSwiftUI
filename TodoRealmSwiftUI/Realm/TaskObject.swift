//
//  TaskObject.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 26/09/2021.
//

import RealmSwift

class TaskObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var completed: Bool = false
}
