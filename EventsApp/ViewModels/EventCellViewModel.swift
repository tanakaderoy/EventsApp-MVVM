//
//  EventCellViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/29/20.
//

import Foundation
import UIKit


class EventCellViewModel: EventCellModel {

    private static let imageCache = NSCache<NSString,UIImage>()
    private var imageQueue = DispatchQueue(label: "imageQueue", qos: .background)
    private var cacheKey: String  {
        event.objectID.description
    }
    var name: String{
        event.name ?? ""
    }

    var timeRemainingString: [String]{
        let timeRem = Date.getTimeRemaining(until: event.date ??  Date())
        return timeRem.components(separatedBy: ",")
    }

    var date: String {
        event.date?.toFormattedString("MMM dd yyy") ?? ""
    }
    var onCellUpdate: () -> ()  = {}

    var event:Event

    init(_ event:  Event) {
        self.event = event
    }

    func loadImage(completion: @escaping(UIImage) -> ()) {
        guard let eventImage = event.image  else {return}
        if let img = EventCellViewModel.imageCache.object(forKey:cacheKey as NSString) {
            completion(img)
        }else{
            imageQueue.async { [weak self] in

                let img = UIImage(data: eventImage) ?? UIImage()
                EventCellViewModel.imageCache.setObject(img, forKey: (self?.cacheKey ?? "") as NSString)
                DispatchQueue.main.async {
                    completion(img)
                }
            }
        }

    }


    
}
