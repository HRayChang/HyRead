//
//  MainViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: Books?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItems(in section: Int) -> Int {
        10
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
                print("My Library Books: \(data)")
                self?.dataSource = data
            case .failure(let error):
                print(error)
            }
        }
    }
}
