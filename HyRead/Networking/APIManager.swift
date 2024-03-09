//
//  APICaller.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APIManager {
    
    static func getMyLibrary(completionHandler: @escaping (_ result: Result<Books, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            
            if error == nil,
                let data = dataResponse,
                let resultData = try? JSONDecoder().decode(Books.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }
        .resume()
    }
}
