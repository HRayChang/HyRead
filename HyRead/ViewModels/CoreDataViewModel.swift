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
    @Published var savedEntities: [Entity] = []
    
    init() {
        container = NSPersistentContainer(name: "HyRead")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load core data. \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCoreDataBooks() {
        
        print(NSPersistentContainer.defaultDirectoryURL())
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addCoreDataBooks(book: Book) {
        let newBook = Entity(context: container.viewContext)
        newBook.title = book.title
        newBook.coverURL = book.coverURL
        saveCoreDataBooks()
    }
    
    func saveCoreDataBooks() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving core data. \(error)")
        }
    }
}
