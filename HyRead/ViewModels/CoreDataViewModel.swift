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
    
    func fetchCoreDataBooks(completion: @escaping ([Entity]) -> Void) {
        
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        do {
            savedEntities = try container.viewContext.fetch(request)
            completion(savedEntities)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func fetchIsFavorite(completion: @escaping ([Int]) -> Void) {
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        request.predicate = NSPredicate(format: "isFavorite == true")
        
        do {
            let result = try container.viewContext.fetch(request)
            let favoriteUUIDs = result.compactMap { Int($0.uuid) }
            completion(favoriteUUIDs)
        } catch let error {
            print("Error fetching favorite UUIDs. \(error)")
            completion([])
        }
    }
    
    func addOrUpdateCoreDataBooks(book: Book) {
        fetchCoreDataBooks { [weak self] entities in
            guard let self = self else { return }

            let existingEntity = entities.first(where: { $0.uuid == Int16(book.uuid) })

            if let existingEntity = existingEntity {
                // Update existing book
                existingEntity.title = book.title
            } else {
                // Add new book
                let newEntity = Entity(context: self.container.viewContext)
                newEntity.uuid = Int16(book.uuid)
                newEntity.title = book.title
                newEntity.coverURL = book.coverURL
                newEntity.isFavorite = book.isFavorite ?? false
                
                self.getCoverImageData(urlString: book.coverURL) { imageData in
                    newEntity.coverImage = imageData
                    
                }
            }
            saveCoreDataBooks()
        }
    }
    
    func updateFavoriteStatus(forUUID uuid: Int, newFavoriteStatus: Bool) {
        fetchCoreDataBooks { [weak self] entities in
            guard let self = self else { return }
            
            for entity in entities where entity.uuid == Int16(uuid) {
                entity.isFavorite = newFavoriteStatus
            }
            
            saveCoreDataBooks()
        }
    }
    
    func saveCoreDataBooks() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving core data. \(error)")
        }
    }
    
//    func clearCoreDataBooks() {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Entity")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        
//        do {
//            try container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
//        } catch let error {
//            print("Error clearing core data. \(error)")
//        }
//    }
    
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
