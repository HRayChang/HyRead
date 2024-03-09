//
//  MainViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[BookCollectionCellViewModel]> = Observable(nil)
    var dataSource: Books?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItems(in section: Int) -> Int {
        self.dataSource?.count ?? 0
    }
    
    func getData() {
        
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APIManager.getMyLibrary { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("My Library Books Count: \(data.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.compactMap({BookCollectionCellViewModel(book: $0)})
    }
    
    func getBookTitle(_ book: Book) -> String {
        return book.title
    }
}
