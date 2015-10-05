//
//  UIImage+imageOrPlaceholder.swift
//  DoTryCatch
//
//  Created by Daren David Taylor on 25/09/2015.
//  Copyright © 2015 DDT. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init ?(named:String, placeholderOrThrow:String) {
        
        var path: String
        
        do {
            let _ = try UIImage(namedOrThrow: named)
            path = named
        }
        catch {
            path = placeholderOrThrow
        }
        
        // if we cant find the images pointed to by named and
        // placeholderOrThrow then we still want to throw
        try! self.init(namedOrThrow:path)
    }
}
