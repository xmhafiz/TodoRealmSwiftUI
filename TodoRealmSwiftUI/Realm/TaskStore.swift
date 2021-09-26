//
//  TaskStore.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import RealmSwift

struct TaskStore {
    static let shared = TaskStore()
    
    func allTasks() -> [Task] {
        let realm = try! Realm()
        let objects = realm.objects(TaskObject.self)
        return objects.map(Task.init)
    }
    
    func createTask(title: String) {
        let taskObject = TaskObject(value: [
            "title": title,
            "completed": false
        ])
        let realm = try! Realm()
        try! realm.write {
            realm.add(taskObject)
        }
    }
    
}
