//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class EventListViewController: UIViewController {
    var tableView  : UITableView!
    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidLoad()

    }

    private func setUpViews(){

        let image = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedAddEvent))

        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView = UITableView()
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.cellID)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.bindFrameToSuperviewSafeAreaBounds()
    }

    @objc private func tappedAddEvent () {
        viewModel.tappedAddEvent()
    }


}


extension EventListViewController:  UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsin(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = viewModel.cellForRowAtIndexPath(indexPath) as? EventListCell else {return UITableViewCell()}

        switch cellVM  {
        case .eventCell(let eventCellViewModel):
            guard let cell =  tableView.dequeueReusableCell(withIdentifier: EventCell.cellID, for: indexPath) as? EventCell
            else {return  UITableViewCell() }
            cell.update(with: eventCellViewModel)
            return cell
        }
    }


}

extension EventListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}
