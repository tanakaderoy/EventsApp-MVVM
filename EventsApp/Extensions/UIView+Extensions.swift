//
//  UIView+Extensions.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit


extension  UIView {

    func roundCorners(_ val: CGFloat) {
        self.layer.cornerRadius = val
    }


    enum Edge : CaseIterable{
        case top,leading,trailing,bottom
        static let all = allCases
    }
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds(_ edges: [Edge] = Edge.all, constant: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        edges.forEach { (edge) in
            switch edge{
            case .bottom:
                self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            case .top:
                self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .leading:
                self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant).isActive = true
            case .trailing:
                self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant).isActive = true
            }
        }



    }



    func bindFrameToSuperviewSafeAreaBounds(_ edges: [Edge] = Edge.all, constant: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        edges.forEach { (edge) in
            switch edge{
            case .bottom:
                self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
            case .top:
                self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
            case .leading:
                self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
            case .trailing:
                self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: constant).isActive = true
            }
        }



    }
}

