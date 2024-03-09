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
    
    // IBoutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addBorder(color: .lightGray, width: 1)
    
        bookImageView.round()
    }

    func setupCell(viewModel: BookCollectionCellViewModel) {
        self.titleLabel.text = viewModel.title
        self.bookImageView.sd_setImage(with: viewModel.coverURL)
    }
}
