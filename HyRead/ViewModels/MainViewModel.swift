//
//  MainViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation
import UIKit

class MainViewModel {
    
    let coreDataViewModel = CoreDataViewModel()
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[BookCollectionCellViewModel]> = Observable(nil)
    var dataSource: Books?
    
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
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItems(in section: Int) -> Int {
        self.dataSource?.count ?? 0
    }
    
    func getData() {
        
        if isLoading.value ?? true { return }
        isLoading.value = true
        
        if NetworkChecker.isConnectedToNetwork() {
            APIManager.getMyLibrary { [weak self] result in
                switch result {
                case .success(let data):
                    
                    guard !data.isEmpty else { return }
                    self?.coreDataViewModel.clearCoreDataBooks()
                    for book in data {
                        self?.coreDataViewModel.addCoreDataBooks(book: book)
                    }
                    self?.dataSource = data
                    self?.mapCellData()
                    
                case .failure(let error):
                    print(error)
                }
                self?.isLoading.value = false
            }
        } else {
            print("裝置未連接到網路")
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.compactMap({BookCollectionCellViewModel(book: $0)})
    }
    
    func getBookTitle(_ book: Book) -> String {
        return book.title
    }
}
