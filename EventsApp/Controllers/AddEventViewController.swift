//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class AddEventViewController: UIViewController {
    var vm: AddEventViewModel!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        vm.viewDidLoad()

        configure()
        setUpHeader()
        vm.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        vm.viewDidDisappear()
    }
    private func setupView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: TitleSubtitleCell.cellID)
    }


    /// Set up header to show   large title
    private func setUpHeader(){
        navigationItem.title = vm.title
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController.navigationBar.sizeToFit()
        navigationController.navigationBar.tintColor = .black

        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }

    func configure(){
        view.addSubview(tableView)
        tableView.bindFrameToSuperviewSafeAreaBounds()
    }

    @objc private func tappedDone(){
        vm.tappedDone()
    }

}


extension AddEventViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.numberOfRowsin()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = vm.cellForRowAtIndexPath(indexPath) as? AddEventCell else {return UITableViewCell()}

        switch cellVM{
        case .titleSubtitle(let titleSubtitleVM):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleSubtitleCell.cellID, for: indexPath) as? TitleSubtitleCell else {return UITableViewCell()}
            cell.update(with: titleSubtitleVM)
            cell.subtitleTextField.delegate = self
            return cell
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }


}


extension AddEventViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else {return false}
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else {return false}
        vm.updateCell(forCellAt: indexPath, subtitle: text)
        return true
    }
}
