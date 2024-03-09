//
//  MainViewModel.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

class MainViewModel {
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItems(in section: Int) -> Int {
        10
    }
    
    func getData() {
        APIManager.getMyLibrary { result in
            switch result {
            case .success(let data):
                print("My Library Books: \(data)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
