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
        cells = coreDataManager.fetchEvents().map({
            EventListCell.eventCell(EventCellViewModel(name: $0.name ?? "Bhristmas", dateRemaining: "adsad", date: ($0.date?.toFormattedString()) ?? "", image: UIImage(data: $0.image ?? Data()) ?? #imageLiteral(resourceName: "chelsea")))
        })
        onUpdate()
    }

}
