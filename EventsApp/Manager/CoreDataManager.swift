//
//  CoreDataManager.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import CoreData


class CoreDataManager {
    static let shared = CoreDataManager()
    lazy var persistanceContainer: NSPersistentContainer = {
        let persistanceContainer = NSPersistentContainer(name: "EventsApp")

        persistanceContainer.loadPersistentStores { (_, err) in
            if let err = err{
                print(err.localizedDescription)

            }
        }

        return persistanceContainer
    }()
    var moc: NSManagedObjectContext {
        persistanceContainer.viewContext
    }

    func saveEvent(currEvent:EventModel){
        let event = Event(context: moc)
        event.setValuesForKeys(
            [
                "name":currEvent.name,
                "date":currEvent.date,
                "image":currEvent.image
            ]
        )
        
        do {
            try moc.save()
        } catch  {
            print(error)
        }
    }


    func fetchEvents() -> [Event]{
        do {
            let fetchRequest = NSFetchRequest<Event> (entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print(error)
            return []
        }
    }
}
