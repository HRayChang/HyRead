//
//  ImageManager.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/11.
//

import Foundation
import UIKit

public class ImageManager {
    
    static func getImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            guard let data = dataResponse, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
    
}
