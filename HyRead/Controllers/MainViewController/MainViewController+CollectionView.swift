//
//  MainViewController+CollectionView.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import Foundation
import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.backgroundColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
