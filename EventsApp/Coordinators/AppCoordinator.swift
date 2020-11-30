//
//  AppCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class AppCoordinator : Coordinator{
    private(set) var childCordinators: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()

    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window

    }

    func start() {
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        eventListCoordinator.start()
//add to child coordinators array keep ref to it so doesnt get deallocated
        childCordinators.append(eventListCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }


}
