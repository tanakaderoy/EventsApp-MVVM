//
//  EventCellViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/29/20.
//

import Foundation
import UIKit


class EventCellViewModel: EventCellModel {
    var name: String

    var dateRemaining: String

    var date: String

    var image: UIImage

    init(name: String, dateRemaining: String, date: String, image: UIImage) {
        self.name = name
        self.dateRemaining = dateRemaining
        self.date = date
        self.image = image
    }


    
}
