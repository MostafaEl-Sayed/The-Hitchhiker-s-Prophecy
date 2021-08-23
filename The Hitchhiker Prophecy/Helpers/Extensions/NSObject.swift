//
//  NSObject.swift
//  The Hitchhiker Prophecy
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return String(describing: self)
    }
}
