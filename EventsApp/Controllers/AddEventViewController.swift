//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class AddEventViewController: UIViewController {
    var vm: AddEventViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = vm.title
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        vm.viewDidDisappear()
    }






}
