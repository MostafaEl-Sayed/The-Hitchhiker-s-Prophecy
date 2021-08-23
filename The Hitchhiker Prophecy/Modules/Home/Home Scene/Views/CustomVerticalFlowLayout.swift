//
//  CustomVerticalFlowLayout.swift
//  The Hitchhiker Prophecy
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class CustomVerticalFlowLayout:  UICollectionViewFlowLayout {

    let numberOfCellsPerScreen: CGFloat = 3.4
    var isSetup = false

    override func prepare() {
        super.prepare()
        if isSetup == false {
            setupCollectionView()
            isSetup = true
        }
    }

    func setupCollectionView() {
        guard  let collectionSize = collectionView?.bounds.size else { return }
        let imageCutSize: CGFloat = 40
        scrollDirection = .vertical
        
        self.itemSize = CGSize(width: collectionSize.width - imageCutSize, height: collectionSize.height / numberOfCellsPerScreen)
        
        // 80 refers to save area height
        let yInset: CGFloat = 20
        let xInset: CGFloat = 20
        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()

        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            attributesCopy.append(itemAttributesCopy)
        }
        return attributesCopy
    }

    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}

