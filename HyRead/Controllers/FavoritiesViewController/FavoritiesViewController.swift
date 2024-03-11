//
//  FavoritiesViewController.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/11.
//

import UIKit

class FavoritiesViewController: UIViewController {
    
    // IBoutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() {
        self.title = "我的收藏"
    }
}
