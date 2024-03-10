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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookImageView.round()
    }

    func setupCell(viewModel: BookCollectionCellViewModel) {
        self.titleLabel.text = viewModel.title
        self.bookImageView.sd_setImage(with: viewModel.coverURL)
    }
    
    // 移動邏輯到VM
    @IBAction func buttonTapped(_ sender: UIButton) {
            if isFavorit == false {
                isFavorit = true
                let isFavotiteColor = UIColor(red: 0.314, green: 0.89, blue: 0.761, alpha: 1)
                let heartFill = UIImage(systemName: "heart.fill")?.withTintColor(isFavotiteColor, renderingMode: .alwaysOriginal)
                sender.setImage(heartFill, for: .normal)
            } else {
                isFavorit = false
                sender.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
}
