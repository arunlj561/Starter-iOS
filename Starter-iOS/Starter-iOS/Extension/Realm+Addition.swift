//
//  RealmAddition.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol RealmType {}
extension Object: RealmType {}
extension Array: RealmType {}


private func realmBlock( _ block: (Realm) throws -> Void) -> Bool {
    do {
        try block(try Realm())
        return true
    } catch {
        print(error)
    }
    return false
}


// MARK:- Write
extension RealmType where Self: Object {
    
    func write( _ block: (Realm) -> Void) -> Bool {
        return realmBlock { realm in
            try realm.write {
                block(realm)
            }
        }
    }
    
    func save() -> Bool {
        return write { realm in
            realm.add(self, update: true)
        }
    }
    
    func saveAsync() {
        threadOnBackground("realm-background") {
            self.save()
            
        }
    }
    
}

extension Array where Element: Object {
    
    func write( _ block: (Realm) -> Void) -> Bool {
        return realmBlock { realm in
            try realm.write {
                block(realm)
            }
        }
    }
    
    func save() -> Bool {
        return write { realm in
            realm.add(self, update: true)
        }
    }
    
    func saveAsync() {
        threadOnBackground("realm-background") {
            self.save()
        }
    }
}


// MARK:- Read
extension RealmType where Self: Object {
    
    static func all() -> [Self] {
        if let realm = try? Realm() {
            return Array(realm.objects(Self.self))
        }
        return []
    }
    
    static func findAll(_ predicateFormat: String, _ args: AnyObject...) -> [Self] {
        if let realm = try? Realm() {
            return Array(realm.objects(Self.self).filter(predicateFormat, args))
        }
        return []
    }
}


// MARK:- Delete
extension RealmType where Self: Object {
    static func deleteAll(_ predicateFormat: String, _ args: AnyObject...) -> Bool {
        return realmBlock { realm in
            let results = realm.objects(Self.self).filter(predicateFormat, args)
            
            try realm.write {
                realm.delete(results)
            }
        }
    }
    
    func delete() -> Bool {
        return write { realm in
            realm.delete(self)
        }
    }
}

extension Array where Element: Object {
    func delete() -> Bool {
        return write { realm in
            realm.delete(self)
        }
    }
}
