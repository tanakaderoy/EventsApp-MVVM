//
//  UIImage+Extensions.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/30/20.
//

import UIKit

extension UIImage {

    func sameAspectRatio(newHeight: CGFloat) -> UIImage {
        let scale = newHeight  / size.height
        let newWidth = size.width  * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image { (_) in
            self.draw(in: .init(origin: .zero, size: newSize))
        }
    }
}
