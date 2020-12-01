//
//  EventListCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit
import CoreData

class EventListCoordinator: ParentCoordinator {
    func childDidFinish(_ coordinator: Coordinator) {
        guard let index = childCordinators.firstIndex(where: {coordinator === $0}) else {return}
        childCordinators.remove(at: index)
    }

    
    private(set) var  childCordinators: [Coordinator] = []
    
var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListVC: EventListViewController = .instantiate()
        let vm = EventListViewModel(coreDataManager: CoreDataManager.shared)
        onSaveEvent = vm.reloadData
        vm.coordinator = self
        eventListVC.viewModel = vm
        navigationController.setViewControllers([eventListVC], animated: false)
    }
    func startAddEvent(){
        let addEventCoord = AddEventCoordinator(navigationController: navigationController)
        addEventCoord.parentCoordinator = self
        childCordinators.append(addEventCoord)
        addEventCoord.start()
    }

    var onSaveEvent: ()->() = {}

    func onSelect(_ id: NSManagedObjectID){
        let eventDetailCoordinator = EventDetailCoordinator(navigationController: navigationController, eventId: id)
        eventDetailCoordinator.parentCoordinator = self
        childCordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()

    }
    
    
}
