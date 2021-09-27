//
//  AppDelegate.swift
//  TodoRealmSwiftUI
//
//  Created by Hafiz on 27/09/2021.
//

import UIKit
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            let realm = try Realm()
            print("Realm db file: \(realm.configuration.fileURL?.absoluteString ?? "Unknown")")
        } catch let error {
            print(error.localizedDescription)
        }
        return true
    }
}
