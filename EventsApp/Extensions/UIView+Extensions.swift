//
//  UIView+Extensions.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

extension UIView: ElevatableView {}


extension  UIView {

    func blurBackground(style: UIBlurEffect.Style  = .dark, alpha:  CGFloat = 0.4   ) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = .black
        blurEffectView.alpha = alpha

        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }

    func roundCorners(_ val: CGFloat) {
        self.layer.cornerRadius = val
        self.clipsToBounds = true
    }


    enum Edge : CaseIterable{
        case top,left,right,bottom
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
            case .left:
                self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .right:
                self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
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
            case .left:
                self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
            case .right:
                self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: constant).isActive = true
            }
        }



    }
}

