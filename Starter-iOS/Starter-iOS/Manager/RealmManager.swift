//
//  RealmManager.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

struct RealmManager {
    static func migrate() {
        let build = UInt64(App.build)!
        
        let config = Realm.Configuration(
            schemaVersion: build,
            migrationBlock: {(migration, oldSchemaVersion) -> Void in
        })
        
        Realm.Configuration.defaultConfiguration = config
        
        // Do migrate
        do {
            _ = try Realm()
        } catch {
            print("realm migrate error")
        }
    }
}
