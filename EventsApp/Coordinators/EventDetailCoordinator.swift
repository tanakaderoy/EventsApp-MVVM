//
//  EventDetailCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//
import UIKit
import CoreData


class EventDetailCoordinator: ChildCoordinatorWithLifeCycle {
    var parentCoordinator: ParentCoordinator?

    var navigationController: UINavigationController
    var  eventId: NSManagedObjectID
    init(navigationController: UINavigationController, eventId: NSManagedObjectID) {
        self.navigationController = navigationController
        self.eventId = eventId
    }
    private(set) var  childCordinators: [Coordinator] = []

    func start() {
        let eventDetailViewController: EventDetailViewController = .instantiate()
        let  eventDatilViewModel = EventDetailViewModel(eventId: eventId)
        eventDatilViewModel.coordinator = self
        eventDetailViewController.viewModel = eventDatilViewModel
        navigationController.pushViewController(eventDetailViewController, animated: true)
        //create event detail vc
        //event detail vm
        //push it ontoo nav controller
    }
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }



    
}
