//
//  EventListCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class EventListCoordinator: ParentCoordinator {
    func childDidFinish(_ coordinator: Coordinator) {
        guard let index = childCordinators.firstIndex(where: {coordinator === $0}) else {return}
        childCordinators.remove(at: index)
    }

    
    private(set) var  childCordinators: [Coordinator] = []
    
    private var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let eventListVC: EventListViewController = .instantiate()
        let vm = EventListViewModel(coreDataManager: CoreDataManager.shared)
        vm.coordinator = self
        eventListVC.viewModel = vm
        navController.setViewControllers([eventListVC], animated: false)
    }
    func startAddEvent(){
        let addEventCoord = AddEventCoordinator(navController: navController)
        addEventCoord.parentCoordinator = self
        childCordinators.append(addEventCoord)
        addEventCoord.start()
    }
    
    
}
