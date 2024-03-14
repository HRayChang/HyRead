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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // Variables
    var cellDataSource: [BookCollectionCellViewModel] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            configView()
            setupCollectionView()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

        func configView() {
            self.title = "我的收藏"
            navigationController?.navigationBar.tintColor = .label
        }

        func setupCollectionView() {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(BookCollectionViewCell.register(), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        }
    }

extension FavoritiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as? BookCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
}
