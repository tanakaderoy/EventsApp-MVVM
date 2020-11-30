//
//  EditEventCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//
import UIKit


class EditEventCoordinator: Coordinator {



    var navigationController: UINavigationController

    private(set) var  childCordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {

    }

    
}
