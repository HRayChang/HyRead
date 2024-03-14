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
    
    // Variables
    var cellDataSource: [BookCollectionCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData()
        
        configView()
        bindViewModel()
    }
    
    func configView() {
        self.title = "我的書櫃"
        
        let navigationRightButton = UIBarButtonItem(image: UIImage(systemName: "multiply"),
                                                    style: .done,
                                                    target: .none,
                                                    action: .none)
        navigationController?.navigationBar.tintColor = .label
        self.navigationItem.rightBarButtonItem = navigationRightButton
        
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
    
    func openDetail(uuid: Int) {
        guard let book = viewModel.retriveBook(with: uuid) else {
            return
        }
        let detailViewModel = DetailViewModel(book: book)
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
