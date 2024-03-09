//
//  BooksModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

struct Books: Codable {
    let uuid: Int
    let title: String
    let coverURL: String
    let publishDate, publisher, author: String

    enum CodingKeys: String, CodingKey {
        case uuid, title
        case coverURL = "coverUrl"
        case publishDate, publisher, author
    }
}
