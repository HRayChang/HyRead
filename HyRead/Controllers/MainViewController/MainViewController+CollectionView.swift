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
        
        self.registerCells()
    }
    
    func registerCells() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let bookData = cellDataSource[indexPath.row]
        let tempText = self.viewModel.getBookTitle(bookData)
           
           // 創建一個 UILabel
           let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
           label.text = tempText
           label.textAlignment = .center
           label.textColor = .black
           
           // 將 UILabel 添加為儲存格的子視圖
           cell.addSubview(label)
        
        return cell
    }
}
