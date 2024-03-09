//
//  BookCollectionCellViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/10.
//

import Foundation

class BookCollectionCellViewModel {
    let uuid: Int
    let title: String
    var coverURL: URL? = URL(string: "")
    
    init(book: Book) {
        self.uuid = book.uuid
        self.title = book.title
        self.coverURL = makeImageURL(book.coverURL)
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(imageCode)")
    }
}
