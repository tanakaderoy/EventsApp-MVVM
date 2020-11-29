//
//  EventListViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation


class EventListViewModel {
    var coordinator: EventListCoordinator?
    let title = "Events"

    
    func tappedAddEvent(){
        coordinator?.startAddEvent()
    }
}
