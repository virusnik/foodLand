//
//  RealmData.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/19/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation
import RealmSwift

class RealmData {
    
    static let shared = RealmData()
    
    func updateData<T: RealmSwift.Object>(_ data: [T]) {
        do {
            let realm = try Realm()
//            try realm.write {
                realm.add(data, update: Realm.UpdatePolicy.modified)
//            }
        } catch let error as NSError {
            print("cannot write products \(error)")
        }
    }
    
    func writeData<T: RealmSwift.Object>(_ data: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
//                realm.delete(realm.objects(T.self))
                realm.add(data)
            }
        } catch let error as NSError {
            print("cannot write products \(error)")
        }
    }
    
    func getRealmData<T: RealmSwift.Object>(completion: (_ objects: [T]) -> Void) {
        do {
            let realmObject = try Realm().objects(T.self)
            let realmData = realmObject.map({ $0.detached() })
            completion(Array(realmData))
        } catch let error as NSError {
            print("cannot get object \(error)")
        }
    }
    
    func getDetachedObject<T: RealmSwift.Object>(_ key: String, _ type: T.Type, completion: (_ object: T?) -> Void) {
        do {
            let realmObject = try Realm().object(ofType: type, forPrimaryKey: key)
            completion(realmObject?.detached())
        } catch let error as NSError {
            print("cannot get object \(error)")
        }
    }
    
    func getRealmObject<T: RealmSwift.Object>(_ key: String, completion: (_ object: T?) -> Void) {
        do {
            let realmObject = try Realm().object(ofType: T.self, forPrimaryKey: key)
            completion(realmObject)
        } catch let error as NSError {
            print("cannot get object \(error)")
        }
    }
    
    func deleteDataForKey<T: RealmSwift.Object>(_ object: T, _ key: String) {
        do {
            let realm = try Realm()
            if let realmObject = realm.object(ofType: T.self, forPrimaryKey: key) {
                try realm.write {
                    realm.delete(realmObject)
                }
            }
        } catch let error as NSError {
            print("error \(error)")
        }
    }
    
    func deleteAllRealmData() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print("cannot delete Product \(error)")
        }
    }
}
