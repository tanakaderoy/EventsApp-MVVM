//
//  EventDetailViewController.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/30/20.
//

import UIKit

class EventDetailViewController: UIViewController {

    let backgroundImageView  = UIImageView()
    let containerView = UIView()
    var viewModel: EventDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = {  [weak self] in
            self?.backgroundImageView.image = self?.viewModel.backgroundImage

        }
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpViews()
        setUpHierachy()
        setUpLayout()
    }



}


extension EventDetailViewController: ProgramaticView {
    func setUpViews() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.blurBackground(style: .dark, alpha: 0.3)
    }

    func setUpHierachy() {
        view.addSubview(containerView)
        containerView.addSubview(backgroundImageView)
    }

    func setUpLayout() {
        containerView.bindFrameToSuperviewBounds()
        backgroundImageView.bindFrameToSuperviewBounds()
    }

}
