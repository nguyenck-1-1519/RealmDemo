//
//  AppDelegate.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/14/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        var config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    migration.renameProperty(onType: Student.className(), from: "firstName", to: "firstNamev1")
                }
                /*
                 migration.enumerateObjects(ofType: Student.className(), { (oldObject, newObject) in
                 let firstNamev1 = oldObject?["firstName"] as? String
                 let lastName = oldObject?["lastName"] as? String
                 newObject?["fullName"] = "\(firstNamev1 ?? "") \(lastName ?? "")"
                 })
                */
        })
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("shin.realm")
        print(config.fileURL)
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
        return true
    }

}

