//
//  Observable.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

class Observable<T> {
    
    var value: T?
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping ((T?) -> Void))
}
