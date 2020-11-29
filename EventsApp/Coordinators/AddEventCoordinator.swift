//
//  AddEventCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit
protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? {get set}
    func didFinish()
}
class AddEventCoordinator: ChildCoordinator {
    var parentCoordinator: ParentCoordinator?
    private var navController:UINavigationController
    init(navController: UINavigationController){
        self.navController = navController
    }
    private(set) var  childCordinators: [Coordinator] = []

    func start() {
        //create add vc and vm and present modally
        let addEventVM = AddEventViewModel()
        addEventVM.coordinator = self
        let vc : AddEventViewController = .instantiate()
        vc.vm = addEventVM
        vc.view.backgroundColor = .primary
        let addNavVC = UINavigationController(rootViewController: vc)
        navController.present(addNavVC, animated: true, completion: nil)
    }
    func didFinish(){
        parentCoordinator?.childDidFinish(self)
    }
  
}
