//
//  CoredataManager.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/10.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "HyRead")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load core data. \(error.localizedDescription)")
            } else {
                print("Success to load core data")
            }
        }
    }
    
    func fetchCoreDataBooks() {
        let request = NSFetchRequest<Entity>(entityName: "Entity")
    }
}
