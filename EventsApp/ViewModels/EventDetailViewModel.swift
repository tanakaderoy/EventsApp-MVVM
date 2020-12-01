//
//  EventDetailViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/30/20.
//

import UIKit
import CoreData

class EventDetailViewModel: EventDetailViewViewModel {
    //Weak to stop a retain cycle because no strong reference
    weak var coordinator: EventDetailCoordinator?
    var onUpdate: () -> () = {}
    var coreDataManager: CoreDataManager
    var eventId: NSManagedObjectID

    var timeRemainingViewModel: TimeRemainingViewModel? {
        guard let eventDate = event?.date else {return nil}
        let parts = Date.getTimeRemaining(until: eventDate).components(separatedBy: ",")
        return TimeRemainingViewModel(timeRemainingParts: parts, mode: .detail)
    }

    var backgroundImage: UIImage?{
        guard let eventData = event?.image else {return nil}
        return UIImage(data: eventData)
    }
    var event: Event?
    init(eventId: NSManagedObjectID, coreDataManager: CoreDataManager = .shared){
        self.eventId = eventId
        self.coreDataManager = coreDataManager
    }

    func viewDidLoad() {
        event = coreDataManager.getEvent(eventId)
        onUpdate()
    }

    func viewDidDisappear() {
        coordinator?.didFinish()
    }

    

    
}
