//
//  BookCollectionViewCell.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import UIKit
import SDWebImage

class BookCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        get {
            "BookCollectionViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "BookCollectionViewCell", bundle: nil)
    }
    
    var isFavorit: Bool = false
    
    // IBoutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var viewModel: BookCollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookImageView.round()
    }
    
    func setupCell(viewModel: BookCollectionCellViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.bookImageView.sd_setImage(with: viewModel.coverURL)
        updateFavoriteButtonImage()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.toggleFavorite(book: viewModel)
        updateFavoriteButtonImage()
    }
    
    private func updateFavoriteButtonImage() {
        guard let viewModel = viewModel else { return }
        favoriteButton.setImage(viewModel.favoriteButtonImage, for: .normal)
    }
}
