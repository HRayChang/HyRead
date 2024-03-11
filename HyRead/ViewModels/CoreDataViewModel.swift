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
        
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addCoreDataBooks(book: Book) {
        
        let bookEntity = Entity(context: container.viewContext)
        bookEntity.uuid = Int16(book.uuid)
        bookEntity.title = book.title
        bookEntity.coverURL = book.coverURL
        
        getCoverImageData(urlString: book.coverURL) { imageData in
            bookEntity.coverImage = imageData
            self.saveCoreDataBooks()
        }
        
    }
    
    func saveCoreDataBooks() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving core data. \(error)")
        }
    }
    
    func clearCoreDataBooks() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Entity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
        } catch let error {
            print("Error clearing core data. \(error)")
        }
    }
    
    private func getCoverImageData(urlString: String, completion: @escaping (Data?) -> Void) {
            
        guard let url = URL(string: urlString) else { return }
        
        ImageManager.getImage(from: url) { image in
            if let image = image {
                let pngImageData = image.pngData()
                completion(pngImageData)
            } else {
                completion(nil)
            }
        }
    }
}
