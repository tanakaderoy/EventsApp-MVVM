//
//  EventDetailViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/30/20.
//

import UIKit
import CoreData

class EventDetailViewModel: EventDetailViewViewModel {
    var onUpdate: () -> () = {}
    var coreDataManager: CoreDataManager
    var eventId: NSManagedObjectID
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

    

    
}
