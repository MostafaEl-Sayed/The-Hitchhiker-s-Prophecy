//
//  CustomHorizontalFlowLayout.swift
//  The Hitchhiker Prophecy
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
import UIKit

class CustomHorizontalFlowLayout:  UICollectionViewFlowLayout {

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
        scrollDirection = .horizontal
        
        self.itemSize = CGSize(width: collectionSize.width - imageCutSize, height: collectionSize.height * 0.8)
        
        // 80 refers to save area height
        let yInset = (collectionSize.height - self.itemSize.height - 80 ) / 2
        let xInset = (collectionSize.width - self.itemSize.width ) / 2
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

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        print(proposedContentOffset)
        let layoutAttributes = self.layoutAttributesForElements(in: collectionView!.bounds)

        let collectionViewXCenter = collectionView!.bounds.size.width / 2
        // current Content Offset Center Origin
        let proposedx = proposedContentOffset.x + collectionViewXCenter
        // the closest x to  Center Origin
        let  closest = layoutAttributes!.sorted {
            abs($0.center.x - proposedx ) < abs($1.center.x - proposedx)

        }.first ?? UICollectionViewLayoutAttributes()

        let targetContentOffset = CGPoint(x:floor(closest.center.x - collectionViewXCenter) , y: proposedContentOffset.y)

        return targetContentOffset
    }


    
}

