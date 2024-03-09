//
//  BookCollectionViewCell.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/9.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    // IBoutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.round()
        containerView.addBorder(color: .lightGray, width: 1)
    
        bookImageView.round()
    }

    func setupCell(viewModel: BookCollectionCellViewModel) {
        
    }
}
