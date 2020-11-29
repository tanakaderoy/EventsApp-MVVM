//
//  UIViewController+Extension.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

extension UIViewController {
    static func instantiate<T>() -> T{
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)

        guard let controller = storyBoard.instantiateViewController(identifier: "\(T.self)") as? T else {
            fatalError("Set story board id equal to class name")
        }
        return controller
    }
}
