//
//  BooksModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation
import UIKit

struct Book: Codable {
    var uuid: Int
    var title: String
    var coverURL: String
    var coverImage: Data?
    var publishDate, publisher, author: String

    enum CodingKeys: String, CodingKey {
        case uuid, title
        case coverURL = "coverUrl"
        case coverImage
        case publishDate, publisher, author
    }
}

typealias Books = [Book]
