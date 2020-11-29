//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class EventListViewController: UIViewController {

    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    private func setUpViews(){

        let image = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedAddEvent))

        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc private func tappedAddEvent () {
        viewModel.tappedAddEvent()
    }


}
