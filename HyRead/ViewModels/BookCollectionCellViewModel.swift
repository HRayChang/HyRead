//
//  BookCollectionCellViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/10.
//

import Foundation
import UIKit

class BookCollectionCellViewModel {
    
    let coreDataViewModel = CoreDataViewModel()
    
    let uuid: Int
    let title: String
    var coverURL: URL? = URL(string: "")
    var isFavorite: Bool
    
    init(book: Book) {
        self.uuid = book.uuid
        self.isFavorite = book.isFavorite ?? false
        self.title = book.title
        self.coverURL = makeImageURL(book.coverURL)

        coreDataViewModel.fetchIsFavorite { [unowned self] uuids in
            for uuid in uuids {
                if book.uuid == uuid {
                    self.isFavorite = true
                    return
                }
            }
        }
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(imageCode)")
    }
    
    func toggleFavorite(book: BookCollectionCellViewModel) {
        isFavorite.toggle()
        let book = Book(uuid: book.uuid, title: book.title, coverURL: book.coverURL?.absoluteString ?? "", coverImage: nil, isFavorite: isFavorite, publishDate: "", publisher: "", author: "")
        coreDataViewModel.updateFavoriteStatus(forUUID: book.uuid, newFavoriteStatus: isFavorite)
    }
    
    var favoriteButtonImage: UIImage? {
        let heartImageName = isFavorite ? "heart.fill" : "heart"
        let isFavoriteColor = UIColor(red: 0.314, green: 0.89, blue: 0.761, alpha: 1)
        let heartColor = isFavorite ? isFavoriteColor : .white
        return UIImage(systemName: heartImageName)?.withTintColor(heartColor, renderingMode: .alwaysOriginal)
    }
}
