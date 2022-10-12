//
//  StorageManager.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 09.10.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ character: Character){
        
        try! realm.write{
            realm.add(character)
        }
    }
    
    static func deleteObject(_ character: Character) {
        try! realm.write{
            realm.delete(character)
        }
    }
}
