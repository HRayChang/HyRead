//
//  MainViewController.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import UIKit

class MainViewController: UIViewController {
    
    // IBoutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    var coreDataViewModel: CoreDataViewModel = CoreDataViewModel()
    
    // Variables
    var cellDataSource: [BookCollectionCellViewModel] = []
    
    let navigationRightButton = UIBarButtonItem(image: UIImage(systemName: "multiply"),
                                           style: .done,
                                           target: .none,
                                           action: .none)
    let navigationLeftButton = UIBarButtonItem(image: UIImage(systemName: "book.circle"),
                                               style: .done,
                                               target: .none,
                                               action: .none)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func configView() {
        self.title = "我的書櫃"
        self.navigationRightButton.tintColor = .label
        self.navigationLeftButton.tintColor = .label
        self.navigationItem.rightBarButtonItem = navigationRightButton
        self.navigationItem.leftBarButtonItem = navigationLeftButton
        
        setupCollectionView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] books in
            guard let self = self, let books = books else {
                return
            }
            self.cellDataSource = books
            self.reloadCollectionView()
        }
    }
}
