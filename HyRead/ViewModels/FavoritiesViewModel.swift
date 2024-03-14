//
//  FavoritiesViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/14.
//

import Foundation
import UIKit

class FavoritiesViewModel {
    
    var books: [BookCollectionCellViewModel]
    
    init(books: [BookCollectionCellViewModel]) {
        self.books = books
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItems(in section: Int) -> Int {
        self.books.count 
    }
    
    var itemsPerRow: CGFloat { return 3 }
    var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    var itemSize: CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = UIScreen.main.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem * 1.95
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
}
