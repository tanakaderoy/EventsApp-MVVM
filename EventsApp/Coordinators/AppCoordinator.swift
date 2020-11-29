//
//  AppCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

protocol Coordinator: class {
    var childCordinators: [Coordinator] {get}
    func  start()
}

protocol ParentCoordinator: Coordinator {
    func childDidFinish(_ coordinator: Coordinator)
}

class AppCoordinator : Coordinator{
    private(set) var childCordinators: [Coordinator] = []

    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window

    }

    func start() {
        let navController = UINavigationController()
        let eventListCoordinator = EventListCoordinator(navController: navController)
        eventListCoordinator.start()
//add to child coordinators array keep ref to it so doesnt get deallocated
        childCordinators.append(eventListCoordinator)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }


}
