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
        do {
            let realm = try Realm()
            let objects = realm.objects(TaskObject.self)
            return objects.map(Task.init)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
    
    func createTask(title: String) {
        let taskObject = TaskObject(value: [
            "title": title,
            "completed": false
        ])
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(taskObject)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateCompleted(id: String, value: Bool) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
            try realm.write {
                task?.completed = value
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}
