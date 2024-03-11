//
//  DetailViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/12.
//

import Foundation

class DetailViewModel {
    
    var book: Book
    
    var coverURL: URL?
    var title: String
    
    init(book: Book) {
        self.book = book
        
        self.title = book.title
        self.coverURL = URL(string: book.coverURL)
    }
}
