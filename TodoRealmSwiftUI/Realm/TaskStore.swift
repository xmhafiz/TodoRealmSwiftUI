//
//  TaskStore.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 25/09/2021.
//

import Foundation
import RealmSwift

struct TaskStore {
    static let shared = TaskStore()
    
    func all() -> [Task] {
        do {
            let realm = try Realm()
            let objects = realm.objects(TaskObject.self)
            return objects.map(Task.init)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
    
    func create(title: String) {
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
                task?.completedAt = Date()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateTitle(id: String, newTitle: String) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
            try realm.write {
                task?.title = newTitle
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func delete(id: String) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            if let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId) {
                try realm.write {
                    realm.delete(task)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
