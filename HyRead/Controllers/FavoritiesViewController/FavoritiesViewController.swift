//
//  FavoritiesViewController.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/14.
//

import UIKit

class FavoritiesViewController: UIViewController {

    // IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // View Model
    var viewModel: FavoritiesViewModel
    
    init(viewModel: FavoritiesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "FavoritiesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        self.title = "我的收藏"
    
        navigationController?.navigationBar.tintColor = .label
        
        setupCollectionView()
    }
}
