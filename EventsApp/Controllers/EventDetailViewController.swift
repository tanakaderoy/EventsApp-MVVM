//
//  EventDetailViewController.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/30/20.
//

import UIKit

class EventDetailViewController: UIViewController {

    let backgroundImageView  = UIImageView()
    let timeRemainingStackview = TimeRemainingStackView()
    let containerView = UIView()
    var viewModel: EventDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = {  [weak self] in
            guard let self = self  else {return}
            self.backgroundImageView.image = self.viewModel.backgroundImage
            self.timeRemainingStackview.update(with: self.viewModel.timeRemainingViewModel)

        }
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpViews()
        setUpHierachy()
        setUpLayout()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }



}


extension EventDetailViewController: ProgramaticView {
    func setUpViews() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.blurBackground(style: .dark, alpha: 0.3)
        timeRemainingStackview.setup()
    }

    func setUpHierachy() {
        view.addSubview(containerView)
        containerView.addSubview(backgroundImageView)
        containerView.addSubview(timeRemainingStackview)
    }

    func setUpLayout() {
        containerView.bindFrameToSuperviewBounds()
        backgroundImageView.bindFrameToSuperviewBounds()
        timeRemainingStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeRemainingStackview.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            timeRemainingStackview.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }

}
