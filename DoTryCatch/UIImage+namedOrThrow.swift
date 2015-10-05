//
//  UIImage+namedOrThrow.swift
//  DoTryCatch
//
//  Created by Daren David Taylor on 25/09/2015.
//  Copyright © 2015 DDT. All rights reserved.
//

import UIKit

enum ImageError : ErrorType {
    case NotFound
}

extension UIImage {
    convenience init ?(namedOrThrow:String) throws {
        // The easiest way of checking whether UIImage(named:) will load an image
        // is to just try, its quite a complex search that the system does when
        // looking for the image, which I didnt want to emulate.
        guard let _ = UIImage(named:namedOrThrow) else {
            throw ImageError.NotFound
        }
        self.init(named:namedOrThrow)
    }
}
