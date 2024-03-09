//
//  NetworkConstant.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singletone
    }
    
    public var serverAddress: String {
        get {
            return "https://mservice.ebook.hyread.com.tw/exam/user-list"
        }
    }
}
