//
//  HomeCharacterCollectionViewCell.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

protocol HomeCharacterCollectionView {
    func configure(with viewModel: HomeScene.Search.ViewModel)
}

class HomeCharacterCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet  weak var characterNameLabel: UILabel!
    @IBOutlet  weak var characterImageView: UIImageView!

    // MARK: - Life Cycle
    override func awakeFromNib() {
        characterImageView.layer.cornerRadius = 8
        characterImageView.clipsToBounds = true
    }

}

// MARK: - HomeCharacterCollectionView
extension HomeCharacterCollectionViewCell: HomeCharacterCollectionView {
    func configure(with viewModel: HomeScene.Search.ViewModel) {
        characterNameLabel.text = viewModel.name
        if let url = URL(string: viewModel.imageUrl) {
            characterImageView.af_setImage(withURL: url,
                                           placeholderImage: UIImage(named: "placeHolder"))
        } else {
            characterImageView.image = UIImage(named:"placeHolder")
        }
    }
}

