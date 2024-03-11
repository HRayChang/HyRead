//
//  BooksModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

struct Book: Codable {
    let uuid: Int
    let title: String
    let coverURL: String
    let coverImage: Data?
    var isFavorite: Bool?
    let publishDate, publisher, author: String

    enum CodingKeys: String, CodingKey {
        case uuid, title
        case coverURL = "coverUrl"
        case coverImage
        case isFavorite
        case publishDate, publisher, author
    }
}

typealias Books = [Book]
