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
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configView()
    }
    
    func configView() {
        self.title = "我的書櫃"
        
        self.view.backgroundColor = .red
        
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
}
