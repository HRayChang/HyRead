//
//  BookCollectionCellViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/10.
//

import Foundation
import UIKit

class BookCollectionCellViewModel {
    let uuid: Int
    let title: String
    var coverURL: URL? = URL(string: "")
    var isFavorite: Bool = false
    
    init(book: Book) {
        self.uuid = book.uuid
        self.title = book.title
        self.coverURL = makeImageURL(book.coverURL)
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(imageCode)")
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
    }
    
    var favoriteButtonImage: UIImage? {
        let heartImageName = isFavorite ? "heart.fill" : "heart"
        let isFavoriteColor = UIColor(red: 0.314, green: 0.89, blue: 0.761, alpha: 1)
        let heartColor = isFavorite ? isFavoriteColor : .white
        return UIImage(systemName: heartImageName)?.withTintColor(heartColor, renderingMode: .alwaysOriginal)
    }
}
