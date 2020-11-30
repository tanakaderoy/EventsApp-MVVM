//
//  EventListViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation
import UIKit


class EventListViewModel: EventListViewViewModel {
    var coordinator: EventListCoordinator?
    var title = "Events"
    var cells:  [EventListCell] = []
    var coreDataManager: CoreDataManager
    var onUpdate: () -> () =  {}

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    func tappedAddEvent(){
        coordinator?.startAddEvent()
    }


    func numberOfRowsin(_ section: Int) -> Int {
        return cells.count
    }
    
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> BaseCell {
        let cell = cells[indexPath.row]
        return cell
    }

    func viewDidLoad() {
       reloadData()
    }

    func didSelectRow(at indexPath: IndexPath) {
        let cell = cells[indexPath.row]
        switch cell {
        case .eventCell(let eventCellViewModel):
            eventCellViewModel.didSelect()
        }
    }

    func reloadData() {
        cells = coreDataManager.fetchEvents().map({
            let eventCellViewModel = EventCellViewModel($0)
            if let coordinator = coordinator{
                eventCellViewModel.onSelect = coordinator.onSelect
            }
           return EventListCell.eventCell(eventCellViewModel)
        })
        onUpdate()
    }
}
